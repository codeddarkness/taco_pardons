#!/bin/bash
# deploy_to_webserver.sh
# Script to deploy Trump Pardons Database to Apache/Nginx web server

set -e  # Exit on any error

# Color codes for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
PURPLE='\033[0;35m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

print_deploy() {
    echo -e "${CYAN}[DEPLOY]${NC} $1"
}

print_server() {
    echo -e "${PURPLE}[SERVER]${NC} $1"
}

# Configuration variables
WEB_ROOTS=(
    "/var/www/html"
    "/usr/share/nginx/html"
    "/var/www"
    "/opt/lampp/htdocs"
    "/usr/local/apache2/htdocs"
)

DEPLOY_SUBDIR="taco_pardons"
BACKUP_DIR=""
WEB_ROOT=""
WEB_SERVER=""

# Function to check if running as root/sudo
check_permissions() {
    if [[ $EUID -ne 0 ]]; then
        print_error "This script must be run as root or with sudo"
        print_status "Usage: sudo $0"
        exit 1
    fi
    print_success "Running with appropriate permissions"
}

# Function to check environment
check_environment() {
    print_status "Checking git repository environment..."
    
    if [[ ! -d ".git" ]]; then
        print_error "Not in a git repository."
        print_error "Please run this script from the taco_pardons repository root."
        exit 1
    fi
    
    if [[ ! -f "trump_pardons_database.html" ]]; then
        print_error "trump_pardons_database.html not found."
        print_error "Please ensure you're in the correct directory."
        exit 1
    fi
    
    # Verify we're on main branch with latest changes
    local current_branch=$(git branch --show-current)
    if [[ "$current_branch" != "main" ]]; then
        print_warning "Not on main branch (currently on: $current_branch)"
        read -p "Do you want to switch to main branch? (y/N): " -n 1 -r
        echo
        if [[ $REPLY =~ ^[Yy]$ ]]; then
            git checkout main
            print_success "Switched to main branch"
        else
            print_status "Continuing with current branch: $current_branch"
        fi
    fi
    
    print_success "Environment check passed"
}

# Function to detect web server and find web root
detect_webserver() {
    print_status "Detecting web server and document root..."
    
    # Check for Apache
    if command -v apache2 >/dev/null 2>&1 || command -v httpd >/dev/null 2>&1; then
        WEB_SERVER="apache"
        print_server "Apache detected"
        
        # Try to get Apache document root
        local apache_root=""
        if command -v apache2 >/dev/null 2>&1; then
            apache_root=$(apache2 -S 2>/dev/null | grep -i "Main DocumentRoot" | awk '{print $3}' | tr -d '"' 2>/dev/null || echo "")
        elif command -v httpd >/dev/null 2>&1; then
            apache_root=$(httpd -S 2>/dev/null | grep -i "Main DocumentRoot" | awk '{print $3}' | tr -d '"' 2>/dev/null || echo "")
        fi
        
        if [[ -n "$apache_root" && -d "$apache_root" ]]; then
            WEB_ROOT="$apache_root"
            print_success "Apache DocumentRoot: $WEB_ROOT"
            return
        fi
    fi
    
    # Check for Nginx
    if command -v nginx >/dev/null 2>&1; then
        WEB_SERVER="nginx"
        print_server "Nginx detected"
        
        # Try to get Nginx document root from default config
        local nginx_root=""
        if [[ -f "/etc/nginx/sites-enabled/default" ]]; then
            nginx_root=$(grep -m1 "root" /etc/nginx/sites-enabled/default | awk '{print $2}' | tr -d ';' 2>/dev/null || echo "")
        elif [[ -f "/etc/nginx/nginx.conf" ]]; then
            nginx_root=$(grep -m1 "root" /etc/nginx/nginx.conf | awk '{print $2}' | tr -d ';' 2>/dev/null || echo "")
        fi
        
        if [[ -n "$nginx_root" && -d "$nginx_root" ]]; then
            WEB_ROOT="$nginx_root"
            print_success "Nginx DocumentRoot: $WEB_ROOT"
            return
        fi
    fi
    
    # Fallback: Check common web root directories
    print_status "Checking common web root directories..."
    for root in "${WEB_ROOTS[@]}"; do
        if [[ -d "$root" && -w "$root" ]]; then
            WEB_ROOT="$root"
            print_success "Found writable web root: $WEB_ROOT"
            
            # Try to determine server type from directory
            if [[ "$root" == *"nginx"* ]]; then
                WEB_SERVER="nginx"
            elif [[ "$root" == *"apache"* ]] || [[ "$root" == *"www"* ]]; then
                WEB_SERVER="apache"
            else
                WEB_SERVER="unknown"
            fi
            return
        fi
    done
    
    print_error "Could not detect web server or find writable web root directory"
    print_status "Checked directories: ${WEB_ROOTS[*]}"
    print_status "Please ensure Apache or Nginx is installed and configured"
    exit 1
}

# Function to create deployment directory
create_deploy_directory() {
    local deploy_path="$WEB_ROOT/$DEPLOY_SUBDIR"
    
    print_deploy "Setting up deployment directory: $deploy_path"
    
    # Create backup if directory exists
    if [[ -d "$deploy_path" ]]; then
        BACKUP_DIR="$deploy_path.backup.$(date +%Y%m%d_%H%M%S)"
        print_status "Creating backup: $BACKUP_DIR"
        cp -r "$deploy_path" "$BACKUP_DIR"
        print_success "Backup created successfully"
    fi
    
    # Create or clear deployment directory
    mkdir -p "$deploy_path"
    
    # Set proper ownership and permissions
    if [[ "$WEB_SERVER" == "apache" ]]; then
        chown -R www-data:www-data "$deploy_path" 2>/dev/null || chown -R apache:apache "$deploy_path" 2>/dev/null || true
    elif [[ "$WEB_SERVER" == "nginx" ]]; then
        chown -R www-data:www-data "$deploy_path" 2>/dev/null || chown -R nginx:nginx "$deploy_path" 2>/dev/null || true
    else
        chown -R www-data:www-data "$deploy_path" 2>/dev/null || true
    fi
    
    chmod 755 "$deploy_path"
    
    print_success "Deployment directory ready: $deploy_path"
}

# Function to deploy core files
deploy_core_files() {
    local deploy_path="$WEB_ROOT/$DEPLOY_SUBDIR"
    
    print_deploy "Deploying core application files..."
    
    # List of files to deploy
    local core_files=(
        "trump_pardons_database.html"
        "trump_pardons_csv.txt"
        "trump_pardons_first_term_csv.txt"
        "README.md"
        "index.html"
    )
    
    # Deploy core files
    for file in "${core_files[@]}"; do
        if [[ -f "$file" ]]; then
            cp "$file" "$deploy_path/"
            print_success "Deployed: $file"
        else
            print_warning "File not found: $file"
        fi
    done
    
    # Deploy screenshots directory if it exists
    if [[ -d "screenshots" ]]; then
        cp -r screenshots "$deploy_path/"
        print_success "Deployed: screenshots directory"
    fi
    
    # Deploy docs directory if it exists
    if [[ -d "docs" ]]; then
        cp -r docs "$deploy_path/"
        print_success "Deployed: docs directory"
    fi
    
    # Create .htaccess for Apache with proper configuration
    if [[ "$WEB_SERVER" == "apache" ]]; then
        create_htaccess "$deploy_path"
    fi
    
    print_success "Core files deployment completed"
}

# Function to create .htaccess for Apache
create_htaccess() {
    local deploy_path="$1"
    
    print_deploy "Creating .htaccess for Apache optimization..."
    
    cat > "$deploy_path/.htaccess" << 'EOF'
# Trump Pardons Database - Apache Configuration

# Enable compression
<IfModule mod_deflate.c>
    AddOutputFilterByType DEFLATE text/plain
    AddOutputFilterByType DEFLATE text/html
    AddOutputFilterByType DEFLATE text/xml
    AddOutputFilterByType DEFLATE text/css
    AddOutputFilterByType DEFLATE application/xml
    AddOutputFilterByType DEFLATE application/xhtml+xml
    AddOutputFilterByType DEFLATE application/rss+xml
    AddOutputFilterByType DEFLATE application/javascript
    AddOutputFilterByType DEFLATE application/x-javascript
    AddOutputFilterByType DEFLATE text/csv
</IfModule>

# Set proper MIME types
<IfModule mod_mime.c>
    AddType text/csv .csv
    AddType application/javascript .js
    AddType text/css .css
    AddType text/html .html
</IfModule>

# Enable caching for static files
<IfModule mod_expires.c>
    ExpiresActive On
    ExpiresByType text/css "access plus 1 month"
    ExpiresByType application/javascript "access plus 1 month"
    ExpiresByType image/png "access plus 1 month"
    ExpiresByType image/jpg "access plus 1 month"
    ExpiresByType image/jpeg "access plus 1 month"
    ExpiresByType text/csv "access plus 1 day"
    ExpiresByType text/html "access plus 1 hour"
</IfModule>

# Security headers
<IfModule mod_headers.c>
    Header always set X-Content-Type-Options nosniff
    Header always set X-Frame-Options DENY
    Header always set X-XSS-Protection "1; mode=block"
    Header always set Referrer-Policy "strict-origin-when-cross-origin"
</IfModule>

# DirectoryIndex
DirectoryIndex index.html trump_pardons_database.html

# Friendly URLs (optional redirects)
RewriteEngine On

# Redirect root to main database
RewriteRule ^$ trump_pardons_database.html [L,R=302]

# Block access to sensitive files
<FilesMatch "\.(bak|backup|sql|log|sh)$">
    Order allow,deny
    Deny from all
</FilesMatch>

# Prevent access to git directory
<DirectoryMatch "\.git">
    Order allow,deny
    Deny from all
</DirectoryMatch>
EOF
    
    print_success "Created .htaccess configuration"
}

# Function to set proper file permissions
set_permissions() {
    local deploy_path="$WEB_ROOT/$DEPLOY_SUBDIR"
    
    print_deploy "Setting proper file permissions..."
    
    # Set directory permissions
    find "$deploy_path" -type d -exec chmod 755 {} \;
    
    # Set file permissions
    find "$deploy_path" -type f -exec chmod 644 {} \;
    
    # Set ownership based on web server
    if [[ "$WEB_SERVER" == "apache" ]]; then
        chown -R www-data:www-data "$deploy_path" 2>/dev/null || chown -R apache:apache "$deploy_path" 2>/dev/null || true
    elif [[ "$WEB_SERVER" == "nginx" ]]; then
        chown -R www-data:www-data "$deploy_path" 2>/dev/null || chown -R nginx:nginx "$deploy_path" 2>/dev/null || true
    else
        chown -R www-data:www-data "$deploy_path" 2>/dev/null || true
    fi
    
    print_success "File permissions set correctly"
}

# Function to test web server configuration
test_deployment() {
    local deploy_path="$WEB_ROOT/$DEPLOY_SUBDIR"
    
    print_deploy "Testing deployment..."
    
    # Check if files are accessible
    if [[ ! -r "$deploy_path/trump_pardons_database.html" ]]; then
        print_error "Main HTML file is not readable"
        return 1
    fi
    
    if [[ ! -r "$deploy_path/trump_pardons_csv.txt" ]]; then
        print_error "Second-term CSV file is not readable"
        return 1
    fi
    
    if [[ ! -r "$deploy_path/trump_pardons_first_term_csv.txt" ]]; then
        print_error "First-term CSV file is not readable"
        return 1
    fi
    
    # Test web server is running
    if [[ "$WEB_SERVER" == "apache" ]]; then
        if systemctl is-active --quiet apache2 || systemctl is-active --quiet httpd; then
            print_success "Apache is running"
        else
            print_warning "Apache doesn't appear to be running"
            print_status "Start it with: sudo systemctl start apache2 (or httpd)"
        fi
    elif [[ "$WEB_SERVER" == "nginx" ]]; then
        if systemctl is-active --quiet nginx; then
            print_success "Nginx is running"
        else
            print_warning "Nginx doesn't appear to be running"
            print_status "Start it with: sudo systemctl start nginx"
        fi
    fi
    
    # Get server IP/hostname
    local server_ip=$(hostname -I | awk '{print $1}' 2>/dev/null || echo "localhost")
    local server_hostname=$(hostname 2>/dev/null || echo "localhost")
    
    print_success "Deployment test completed"
    
    echo
    echo "🌐 Access URLs:"
    echo "  📍 http://$server_ip/$DEPLOY_SUBDIR/"
    echo "  📍 http://$server_hostname/$DEPLOY_SUBDIR/"
    echo "  📍 http://localhost/$DEPLOY_SUBDIR/"
    echo "  📱 Direct: http://$server_ip/$DEPLOY_SUBDIR/trump_pardons_database.html"
    echo
}

# Function to create update script
create_update_script() {
    local deploy_path="$WEB_ROOT/$DEPLOY_SUBDIR"
    local update_script="$deploy_path/update_from_git.sh"
    
    print_deploy "Creating auto-update script..."
    
    cat > "$update_script" << EOF
#!/bin/bash
# Auto-generated update script for Trump Pardons Database
# Run this script to update from the git repository

set -e

# Colors
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m'

echo -e "\${BLUE}Updating Trump Pardons Database...\${NC}"

# Source directory (where this script was run from)
SOURCE_DIR="$(pwd)"

# Go to source directory if different
if [[ "\$SOURCE_DIR" != "$deploy_path" ]]; then
    cd "\$SOURCE_DIR"
fi

# Pull latest changes
echo "Pulling latest changes from git..."
git fetch origin
git checkout main
git pull origin main

# Copy updated files
echo "Copying updated files..."
cp trump_pardons_database.html "$deploy_path/"
cp trump_pardons_csv.txt "$deploy_path/"
cp trump_pardons_first_term_csv.txt "$deploy_path/"
cp README.md "$deploy_path/"

# Copy screenshots if updated
if [[ -d "screenshots" ]]; then
    cp -r screenshots "$deploy_path/"
fi

# Set permissions
echo "Setting permissions..."
chmod 644 "$deploy_path"/*.html "$deploy_path"/*.txt "$deploy_path"/*.md
chown www-data:www-data "$deploy_path"/*.html "$deploy_path"/*.txt "$deploy_path"/*.md 2>/dev/null || true

echo -e "\${GREEN}Update completed successfully!\${NC}"
echo "Database updated at: $deploy_path"
EOF
    
    chmod +x "$update_script"
    print_success "Created update script: $update_script"
}

# Function to provide deployment summary
deployment_summary() {
    local deploy_path="$WEB_ROOT/$DEPLOY_SUBDIR"
    
    print_success "🚀 Web server deployment completed successfully!"
    echo
    echo "📊 Deployment Summary:"
    echo "======================"
    echo "✅ Web Server: $WEB_SERVER"
    echo "✅ Deploy Path: $deploy_path"
    echo "✅ Core Files: Deployed successfully"
    echo "✅ Permissions: Set correctly"
    echo "✅ Configuration: Optimized for web serving"
    
    if [[ -n "$BACKUP_DIR" ]]; then
        echo "✅ Backup: $BACKUP_DIR"
    fi
    
    echo
    echo "🌐 Access Information:"
    echo "======================"
    
    # Get server information
    local server_ip=$(hostname -I | awk '{print $1}' 2>/dev/null || echo "localhost")
    local server_hostname=$(hostname 2>/dev/null || echo "localhost")
    
    echo "🖥️  Server: $server_hostname ($server_ip)"
    echo "📁 Web Root: $WEB_ROOT"
    echo "📂 App Directory: $deploy_path"
    echo
    echo "🔗 Access URLs:"
    echo "  🏠 Main Site: http://$server_ip/$DEPLOY_SUBDIR/"
    echo "  🏠 By Hostname: http://$server_hostname/$DEPLOY_SUBDIR/"
    echo "  🏠 Localhost: http://localhost/$DEPLOY_SUBDIR/"
    echo "  📊 Direct Database: http://$server_ip/$DEPLOY_SUBDIR/trump_pardons_database.html"
    echo
    echo "📱 Mobile Access:"
    echo "  All URLs above work on mobile devices"
    echo "  Responsive design adapts automatically"
    echo
    echo "💾 Deployed Files:"
    echo "  ✅ trump_pardons_database.html (main application)"
    echo "  ✅ trump_pardons_csv.txt (second-term data)"
    echo "  ✅ trump_pardons_first_term_csv.txt (first-term data)"
    echo "  ✅ index.html (root redirection)"
    echo "  ✅ README.md (documentation)"
    if [[ -d "$deploy_path/screenshots" ]]; then
        echo "  ✅ screenshots/ (project images)"
    fi
    if [[ -f "$deploy_path/.htaccess" ]]; then
        echo "  ✅ .htaccess (Apache optimization)"
    fi
    echo "  ✅ update_from_git.sh (auto-update script)"
    echo
    echo "⚙️  Server Configuration:"
    if [[ "$WEB_SERVER" == "apache" ]]; then
        echo "  🔧 Apache with mod_rewrite, mod_deflate"
        echo "  🔧 Compression enabled for CSS, JS, HTML, CSV"
        echo "  🔧 Caching headers set for static files"
        echo "  🔧 Security headers configured"
    elif [[ "$WEB_SERVER" == "nginx" ]]; then
        echo "  🔧 Nginx with standard configuration"
        echo "  🔧 Static file serving optimized"
    fi
    echo "  🔧 Proper file permissions (644/755)"
    echo "  🔧 Web server user ownership"
    echo
    echo "🔄 Future Updates:"
    echo "  Run the update script: $deploy_path/update_from_git.sh"
    echo "  Or manually copy files after git pull"
    echo
    echo "🛠️  Troubleshooting:"
    if [[ "$WEB_SERVER" == "apache" ]]; then
        echo "  📋 Check Apache logs: tail -f /var/log/apache2/error.log"
        echo "  🔄 Restart Apache: sudo systemctl restart apache2"
        echo "  ✅ Test config: sudo apache2ctl configtest"
    elif [[ "$WEB_SERVER" == "nginx" ]]; then
        echo "  📋 Check Nginx logs: tail -f /var/log/nginx/error.log"
        echo "  🔄 Restart Nginx: sudo systemctl restart nginx"
        echo "  ✅ Test config: sudo nginx -t"
    fi
    echo "  🔍 Check permissions: ls -la $deploy_path"
    echo "  🌐 Test connectivity: curl http://localhost/$DEPLOY_SUBDIR/"
    echo
    
    # Final success message
    print_success "🎉 Your Trump Pardons Database is now live on your web server!"
    echo
    echo "Visit http://$server_ip/$DEPLOY_SUBDIR/ to access the database"
