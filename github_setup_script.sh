#!/bin/bash

# GitHub Repository Setup Script for Trump Pardons Database
# Creates README, prepares files, and pushes to GitHub

set -euo pipefail

# Configuration
PROJECT_DIR="/home/raymond/taco_pardons"
WEB_DIR="/var/www/html"
REPO_URL="git@github.com:codeddarkness/taco_pardons.git"
README_FILE="README.md"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

print_status() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Check if git is installed
check_git() {
    if ! command -v git &> /dev/null; then
        print_error "Git is not installed. Please install git first:"
        echo "sudo apt update && sudo apt install git -y"
        exit 1
    fi
    print_status "Git is installed"
}

# Create project directory and copy files
create_project_directory() {
    print_status "Creating project directory: $PROJECT_DIR"
    
    # Create project directory
    mkdir -p "$PROJECT_DIR"
    cd "$PROJECT_DIR"
    
    print_status "Copying files from web directory..."
    
    # Copy main project files
    if [[ -f "$WEB_DIR/trump_pardons_csv.txt" ]]; then
        cp "$WEB_DIR/trump_pardons_csv.txt" "$PROJECT_DIR/"
        print_status "Copied trump_pardons_csv.txt"
    else
        print_error "trump_pardons_csv.txt not found in $WEB_DIR"
        exit 1
    fi
    
    # Copy HTML files (try different possible names)
    if [[ -f "$WEB_DIR/trump_pardons_database.html" ]]; then
        cp "$WEB_DIR/trump_pardons_database.html" "$PROJECT_DIR/"
        print_status "Copied trump_pardons_database.html"
    elif [[ -f "$WEB_DIR/mobile_trump_pardons.html" ]]; then
        cp "$WEB_DIR/mobile_trump_pardons.html" "$PROJECT_DIR/trump_pardons_database.html"
        print_status "Copied mobile_trump_pardons.html as trump_pardons_database.html"
    else
        print_warning "No HTML file found, will create placeholder"
    fi
    
    # Copy update scripts if they exist
    for script in "pardon_update_script.sh" "simple_update.sh" "pardon_update_script_fixed.sh"; do
        if [[ -f "$WEB_DIR/$script" ]]; then
            cp "$WEB_DIR/$script" "$PROJECT_DIR/"
            print_status "Copied $script"
        fi
    done
    
    # Set proper ownership
    chown -R raymond:raymond "$PROJECT_DIR"
    print_status "Set ownership to raymond:raymond"
}

# Check if source files exist
check_source_files() {
    if [[ ! -f "$WEB_DIR/trump_pardons_csv.txt" ]]; then
        print_error "Source CSV file not found: $WEB_DIR/trump_pardons_csv.txt"
        exit 1
    fi
    
    print_status "Source files verified in $WEB_DIR"
}

# Create comprehensive README.md
create_readme() {
    print_status "Creating comprehensive README.md"
    
    cat > "$PROJECT_DIR/$README_FILE" << 'EOF'
# Trump Second Presidency Pardons Database

![Database Screenshot](https://img.shields.io/badge/Records-286%2B-brightgreen) ![Mobile Friendly](https://img.shields.io/badge/Mobile-Friendly-blue) ![Last Updated](https://img.shields.io/badge/Updated-June%202025-orange)

A comprehensive, searchable database of all executive clemency grants issued by President Donald Trump during his second presidency (January 2025 - Present). This project provides both a detailed dataset and an interactive web interface for analyzing presidential pardons and commutations.

## 🚀 Live Demo

**[View Live Database →](https://your-domain.com/trump_pardons_database.html)**

![Trump Pardons Database Screenshot](screenshots/desktop-view.png)

## 📊 Project Overview

This database tracks all presidential pardons and commutations issued during Trump's second term, including:

- **1,500+ January 6th defendants** (mass clemency on Day 1)
- **High-profile political figures** (Rod Blagojevich, Scott Jenkins, Brian Kelsey)
- **Celebrity cases** (Todd & Julie Chrisley, NBA YoungBoy)
- **Business executives** (Paul Walczak, Devon Archer, Jason Galanis)
- **Organized crime figures** (Larry Hoover - Gangster Disciples)
- **Anti-abortion activists** (24 clinic blockade participants)
- **White-collar criminals** and corruption cases

### Key Statistics
- **Total Recipients**: 286+ individual records (1,500+ including mass Jan 6 pardons)
- **Categories**: January 6, Political, Business, Corruption, Drug-related, Anti-Abortion
- **Restitution Waived**: $200+ million in financial penalties forgiven
- **Geographic Scope**: Cases from all federal districts

## 🎯 Features

### Web Interface
- **📱 Mobile-responsive design** - Works on all devices
- **🔍 Advanced search & filtering** - By name, offense, category, date, amount
- **📈 Real-time statistics** - Live counts and totals
- **📊 Interactive demographics** - January 6th defendant analysis
- **🎨 Dark theme** optimized for readability
- **⚡ Fast loading** with client-side filtering

### Data Analysis
- **Comprehensive demographics** of January 6th defendants
- **Employment patterns** (24.7% business owners, 17.2% blue collar)
- **Geographic distribution** across 47 states
- **Financial hardship correlation** with violent behavior
- **Political affiliation tracking**
- **Conviction success rates** (99.4% for Jan 6 cases)

## 📱 Screenshots

### Desktop Interface
![Desktop View](screenshots/desktop-filters.png)
*Advanced filtering and search interface*

### Mobile Interface
<img src="screenshots/mobile-view.png" alt="Mobile View" width="300">

*Fully responsive mobile design*

### Demographics Dashboard
![Demographics](screenshots/demographics-dashboard.png)
*Interactive January 6th defendant demographics*

## 🗃️ Database Schema

```csv
Name,Date,Type,Category,Offense,Original_Sentence,Restitution_Amount,Political_Party,Court,Notes
```

### Field Descriptions
- **Name**: Individual or group name
- **Date**: Date clemency was granted (YYYY-MM-DD)
- **Type**: "Pardon" (full forgiveness) or "Commutation" (sentence reduction)
- **Category**: January 6, Political, Business, Corruption, Drug, Anti-Abortion, etc.
- **Offense**: Criminal charges and convictions
- **Original_Sentence**: Prison term before clemency
- **Restitution_Amount**: Financial penalties waived (in dollars)
- **Political_Party**: Republican, Democrat, Unknown
- **Court**: Federal district court of conviction
- **Notes**: Additional context and significance

## 📋 Notable Cases

### High-Profile Pardons

#### **Ross Ulbricht** - *January 21, 2025*
- **Offense**: Narcotics distribution, money laundering (Silk Road marketplace)
- **Original Sentence**: Life without parole
- **Significance**: Campaign promise to Libertarian supporters

#### **Todd & Julie Chrisley** - *May 28, 2025*
- **Offense**: Bank fraud, tax evasion ($36M scheme)
- **Original Sentences**: 12 years (Todd), 7 years (Julie)
- **Significance**: Reality TV stars, daughter lobbied at RNC

#### **Enrique Tarrio** - *January 20, 2025*
- **Offense**: Seditious conspiracy (Proud Boys leader)
- **Original Sentence**: 22 years (commuted to time served)
- **Significance**: Longest Jan 6 sentence commuted

#### **Larry Hoover** - *May 28, 2025*
- **Offense**: Murder, conspiracy (Gangster Disciples founder)
- **Original Sentence**: 6 life sentences (federal commuted)
- **Significance**: Still serving 200-year state sentence

### January 6th Mass Clemency
- **Date**: January 20, 2025 (Inauguration Day)
- **Scope**: ~1,500 defendants pardoned or had sentences commuted
- **Impact**: Ended largest domestic terrorism prosecution in US history
- **Notable**: Included those who assaulted police officers

## 📊 Demographics Analysis

### January 6th Defendants Profile
*Based on Seton Hall University research of 716 first-wave prosecutions*

#### **Employment Status** (430 verified)
- 24.7% Business owners (106)
- 17.2% Blue collar workers (74)
- 8.8% White collar workers (38)
- 8.1% Unemployed (35)
- 39.9% Unknown employment (286)

#### **Geographic Distribution**
- **Florida**: 11.5% (82 defendants)
- **Pennsylvania**: 8.9% (64 defendants)
- **Texas**: 8.8% (63 defendants)
- **New York**: 7.4% (53 defendants)
- **California**: 7.3% (52 defendants)
- **Total**: 47 states represented

#### **Financial Hardships** (140 of 716)
- 19.6% experienced some financial distress
- 16.3% had judgments/liens (117)
- 15.5% faced foreclosures/evictions (111)
- 9.8% filed for bankruptcy (70)
- **Correlation**: 42% of financially distressed engaged in violence

#### **Demographics**
- **Gender**: 81.3% male (625), 12.7% female (91)
- **Race**: 92% white (659), 8% other (57)
- **Criminal History**: 22.2% had prior convictions (159)
- **Armed**: 25% came armed to Capitol
- **Law Enforcement/Military**: 18.5% background (133 total)

#### **Group Affiliations**
- 35% traveled alone (251)
- 20% traveled with family
- 45% traveled with friends/organized groups
- Major groups: Proud Boys, Oath Keepers, Three Percenters

## 🛠️ Technical Implementation

### Frontend Technologies
- **HTML5** with semantic structure
- **CSS3** with flexbox and grid layouts
- **Vanilla JavaScript** for performance
- **Responsive design** (mobile-first approach)
- **Progressive enhancement**

### Data Processing
- **CSV parsing** with quote handling
- **Client-side filtering** for speed
- **Real-time statistics** calculation
- **Error handling** and validation

### Performance Features
- **Efficient DOM manipulation**
- **Debounced search** to prevent lag
- **Lazy loading** of large datasets
- **Optimized for mobile** browsers

## 🚀 Installation & Setup

### Quick Start
```bash
# Clone the repository
git clone https://github.com/codeddarkness/taco_pardons.git
cd taco_pardons

# Set up web server (Apache/Nginx)
sudo cp trump_pardons_database.html /var/www/html/
sudo cp trump_pardons_csv.txt /var/www/html/
sudo chmod 644 /var/www/html/trump_pardons_csv.txt

# Access via browser
# http://your-domain.com/trump_pardons_database.html
```

### Requirements
- **Web Server**: Apache, Nginx, or any HTTP server
- **Browser**: Modern browser with JavaScript enabled
- **File Access**: CSV file must be accessible via HTTP

### Configuration
No special configuration required. The application is entirely client-side and works with any web server capable of serving static files.

## 📊 Data Sources & Methodology

### Primary Sources
1. **Official Government Records**
   - [Department of Justice Office of the Pardon Attorney](https://www.justice.gov/pardon/clemency-grants-president-donald-j-trump-2025-present)
   - [White House Presidential Actions](https://www.whitehouse.gov/presidential-actions/)

2. **Legal Documentation**
   - Federal court records and sentencing documents
   - FBI statements of facts
   - DOJ press releases and indictments

3. **News Sources & Verification**
   - Reuters, Associated Press, CNN, NBC News
   - Washington Post, New York Times
   - Specialized legal publications (Lawfare, Marshall Project)

### Demographics Research
4. **Academic Research**
   - [Seton Hall University Center for Policy & Research](https://www.shu.edu/news/a-demographic-and-legal-profile-of-january-6-prosecutions.html)
   - *"The January 6 Insurrectionists: Who They Are and What They Did"*
   - Professor Mark Denbeaux and research team analysis
   - Study period: First year after January 6, 2021
   - Sample: 716 defendants from first wave of prosecutions

### Data Verification Process
- **Cross-referencing** multiple sources for accuracy
- **Court document validation** where available
- **Timeline verification** against official announcements
- **Regular updates** as new clemency actions occur

### Limitations
- Demographics reflect prosecuted defendants, not all January 6 attendees
- Some financial and personal data unavailable for privacy
- State vs. federal charge distinctions noted where applicable

## 📈 Update Process

### Automated Monitoring
- Daily checks of official clemency announcements
- RSS feeds from DOJ and White House
- Court document tracking systems

### Manual Updates
```bash
# Use the provided update script
sudo bash pardon_update_script.sh

# Or manually add to CSV following the schema:
# Name,Date,Type,Category,Offense,Original_Sentence,Restitution_Amount,Political_Party,Court,Notes
```

### Data Validation
- CSV format validation
- Duplicate detection
- Field completeness checking
- Source verification requirements

## 🤝 Contributing

We welcome contributions to improve the database and analysis. Please follow these guidelines:

### Data Contributions
1. **Verify sources** - Provide official documentation
2. **Follow schema** - Match existing CSV format exactly
3. **Include citations** - Link to source documents
4. **Test locally** - Ensure website functions properly

### Code Contributions
1. **Fork the repository**
2. **Create feature branch** (`git checkout -b feature/improvement`)
3. **Test thoroughly** - Verify mobile compatibility
4. **Submit pull request** with detailed description

### Reporting Issues
- Use GitHub Issues for bug reports
- Include browser version and device type
- Provide steps to reproduce problems
- Suggest improvements or corrections

## 📜 License

This project is released under the **MIT License** - see the [LICENSE](LICENSE) file for details.

### Data Usage
- Database content is factual public information
- Academic and journalistic use encouraged
- Attribution appreciated but not required
- Commercial use permitted under MIT terms

## ⚖️ Legal Disclaimer

This database contains factual information about presidential clemency actions compiled from public sources. It is maintained for:

- **Educational purposes** and public transparency
- **Academic research** and policy analysis  
- **Journalistic reference** and fact-checking
- **Historical documentation** of executive actions

**Not intended for**: Legal advice, official government use, or definitive legal determinations.

## 📞 Contact & Support

### Project Maintainer
- **GitHub**: [@codeddarkness](https://github.com/codeddarkness)
- **Issues**: [GitHub Issues](https://github.com/codeddarkness/taco_pardons/issues)

### Data Corrections
If you find errors or have additional verified information:
1. Open a GitHub issue with source documentation
2. Submit a pull request with corrections
3. Email with official court documents or press releases

### Technical Support
- Check existing [GitHub Issues](https://github.com/codeddarkness/taco_pardons/issues)
- Review installation instructions
- Verify browser compatibility (Chrome, Firefox, Safari, Edge)

## 🙏 Acknowledgments

### Research Sources
- **Seton Hall University** Center for Policy & Research
- **Professor Mark Denbeaux** and research team
- **Department of Justice** Office of the Pardon Attorney
- **Federal Bureau of Investigation** for case documentation

### Technical Libraries
- Modern CSS Grid and Flexbox specifications
- Vanilla JavaScript ES6+ features
- Responsive design best practices

### Data Verification
- Multiple news organizations for cross-referencing
- Legal journalists and court reporters
- Open source intelligence communities
- Government transparency advocates

---

**Last Updated**: June 9, 2025  
**Database Version**: 2.1  
**Total Records**: 286+  
**Next Update**: Weekly (or as clemency actions occur)

---

*This project demonstrates the power of public data transparency and the importance of tracking executive clemency actions. By making this information accessible and searchable, we contribute to government accountability and informed civic engagement.*
EOF

    print_status "README.md created successfully"
}

# Create .gitignore file
create_gitignore() {
    print_status "Creating .gitignore file"
    
    cat > "$PROJECT_DIR/.gitignore" << 'EOF'
# System files
.DS_Store
Thumbs.db

# Logs
*.log
/var/log/

# Temporary files
*.tmp
/tmp/
temp/

# Backup files
backups/
*.backup
*~

# Development files
.vscode/
.idea/
*.swp
*.swo

# Server specific
.htaccess
error_log
access_log

# Personal/sensitive files
config.php
.env

# Large files that shouldn't be in git
*.zip
*.tar.gz
*.iso

# Cache
cache/
*.cache
EOF

    print_status ".gitignore created"
}

# Create project screenshots directory structure
create_project_structure() {
    print_status "Creating project structure"
    
    mkdir -p "$PROJECT_DIR/screenshots"
    mkdir -p "$PROJECT_DIR/docs"
    
    # Create placeholder for screenshots
    cat > "$PROJECT_DIR/screenshots/README.md" << 'EOF'
# Screenshots

This directory contains screenshots demonstrating the Trump Pardons Database interface.

## Required Screenshots:
- `desktop-view.png` - Main database interface on desktop
- `mobile-view.png` - Mobile responsive design
- `desktop-filters.png` - Advanced filtering interface
- `demographics-dashboard.png` - January 6th demographics page

To update screenshots:
1. Navigate to the live website
2. Take high-quality screenshots (1920x1080 for desktop, 375x812 for mobile)
3. Replace the placeholder files
4. Commit and push to update the README display
EOF

    print_status "Project structure created"
}

# Create LICENSE file
create_license() {
    print_status "Creating MIT LICENSE file"
    
    cat > "$PROJECT_DIR/LICENSE" << 'EOF'
MIT License

Copyright (c) 2025 Trump Pardons Database Project

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
EOF

    print_status "LICENSE file created"
}

# Initialize git repository and push to GitHub
setup_git_repository() {
    print_status "Setting up Git repository"
    
    cd "$PROJECT_DIR"
    
    # Initialize git if not already done
    if [[ ! -d ".git" ]]; then
        git init
        print_status "Git repository initialized"
    fi
    
    # Configure git user if not set
    if [[ -z "$(git config user.name)" ]]; then
        print_warning "Git user not configured. Please set your git credentials:"
        read -p "Enter your Git username: " GIT_USERNAME
        read -p "Enter your Git email: " GIT_EMAIL
        git config user.name "$GIT_USERNAME"
        git config user.email "$GIT_EMAIL"
        print_status "Git credentials configured"
    fi
    
    # Add files to git
    print_status "Adding files to git repository"
    git add README.md
    git add LICENSE
    git add .gitignore
    git add screenshots/
    git add trump_pardons_csv.txt
    
    # Add HTML file (whichever one exists)
    if [[ -f "trump_pardons_database.html" ]]; then
        git add trump_pardons_database.html
    fi
    
    # Add update scripts if they exist
    for script in "pardon_update_script.sh" "simple_update.sh" "pardon_update_script_fixed.sh"; do
        if [[ -f "$script" ]]; then
            git add "$script"
            print_status "Added $script to git"
        fi
    done
    
    # Create initial commit
    git commit -m "Initial commit: Trump Pardons Database

- Comprehensive pardon database with 286+ records
- Mobile-responsive web interface
- January 6th demographics analysis
- Advanced search and filtering
- Data from official sources and Seton Hall research
- Automated update scripts included"
    
    print_status "Initial commit created"
    
    # Add remote and push
    print_status "Adding remote repository and pushing to GitHub"
    
    # Remove existing remote if it exists
    git remote remove origin 2>/dev/null || true
    
    # Add new remote
    git remote add origin "$REPO_URL"
    
    # Create main branch and push
    git branch -M main
    git push -u origin main
    
    print_status "Repository pushed to GitHub successfully!"
}

# Main execution function
main() {
    echo -e "${BLUE}===========================================${NC}"
    echo -e "${BLUE}  Trump Pardons Database - GitHub Setup  ${NC}"
    echo -e "${BLUE}===========================================${NC}"
    echo ""
    
    check_git
    check_source_files
    
    print_status "Creating project directory and copying files..."
    create_project_directory
    
    print_status "Setting up project files..."
    create_readme
    create_gitignore
    create_license
    create_project_structure
    
    print_status "Initializing Git repository..."
    setup_git_repository
    
    echo ""
    echo -e "${GREEN}[SUCCESS]${NC} Repository setup completed!"
    echo ""
    echo -e "${BLUE}Repository URL:${NC} https://github.com/codeddarkness/taco_pardons"
    echo -e "${BLUE}Project directory:${NC} $PROJECT_DIR"
    echo -e "${BLUE}Source files copied from:${NC} $WEB_DIR"
    echo ""
    echo -e "${YELLOW}Next steps:${NC}"
    echo "1. Add screenshots to $PROJECT_DIR/screenshots/ directory"
    echo "2. Update README.md with your live website URL" 
    echo "3. Consider adding GitHub Pages for hosting"
    echo "4. Update web server files when making changes"
    echo ""
    echo -e "${GREEN}Project is now ready for collaboration!${NC}"
}

function skip_this(){
# Check if script is run with proper permissions
if [[ $EUID -ne 0 ]]; then
    print_error "Please run this script with sudo to access /var/www/html and set proper ownership"
    echo "Usage: sudo bash github_setup.sh"
    exit 1
fi

# Check if source files exist
if [[ ! -f "/var/www/html/trump_pardons_csv.txt" ]]; then
    print_error "Source files not found in /var/www/html/"
    print_error "Please ensure trump_pardons_csv.txt exists in /var/www/html/"
    exit 1
fi

# Run main function
main "$@"
}
