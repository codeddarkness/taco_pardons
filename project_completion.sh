#!/bin/bash

# Trump Pardons Database - Project Completion Script
# Completes baseline setup and updates project metadata
# Author: Raymond Scheel <ray.scheel@gmail.com>
# Date: June 9, 2025

set -euo pipefail

# Configuration
PROJECT_DIR="/home/raymond/taco_pardons"
CURRENT_DATE="June 9, 2025"
AUTHOR_NAME="Raymond Scheel"
AUTHOR_EMAIL="ray.scheel@gmail.com"

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

print_header() {
    echo -e "${BLUE}============================================${NC}"
    echo -e "${BLUE}  Trump Pardons Database - Setup Complete  ${NC}"
    echo -e "${BLUE}============================================${NC}"
    echo ""
}

# Check if we're in the project directory
check_project_directory() {
    if [[ ! -d "$PROJECT_DIR" ]]; then
        print_error "Project directory not found: $PROJECT_DIR"
        print_error "Please run the GitHub setup script first"
        exit 1
    fi
    
    cd "$PROJECT_DIR"
    
    if [[ ! -f "trump_pardons_csv.txt" ]] || [[ ! -f "trump_pardons_database.html" ]]; then
        print_error "Required project files not found"
        exit 1
    fi
    
    print_status "Project directory validated"
}

# Update README with current information
update_readme() {
    print_status "Updating README.md with current project information..."
    
    # Update the live demo URL placeholder
    sed -i 's|https://your-domain.com/trump_pardons_database.html|https://codeddarkness.github.io/taco_pardons/trump_pardons_database.html|g' README.md
    
    # Update the record count based on actual CSV data
    RECORD_COUNT=$(tail -n +2 trump_pardons_csv.txt | wc -l)
    sed -i "s/286+/$RECORD_COUNT/g" README.md
    
    # Update the last updated date
    sed -i "s/June 2025/$CURRENT_DATE/g" README.md
    sed -i "s/June 9, 2025/$CURRENT_DATE/g" README.md
    
    print_status "README.md updated with current data"
}

# Create updated .gitignore
create_updated_gitignore() {
    print_status "Creating comprehensive .gitignore..."
    
    cat > .gitignore << 'EOF'
# System files
.DS_Store
.DS_Store?
._*
.Spotlight-V100
.Trashes
ehthumbs.db
Thumbs.db

# Editor files
.vscode/
.idea/
*.swp
*.swo
*~
.sublime-*

# Logs
*.log
logs/
npm-debug.log*
yarn-debug.log*
yarn-error.log*

# Temporary files
*.tmp
*.temp
temp/
.cache/

# Backup files
backups/
*.backup
*.bak

# Environment and config files
.env
.env.local
.env.development.local
.env.test.local
.env.production.local
config.local.js
secrets.json

# Dependencies (if we add any)
node_modules/
bower_components/

# Build outputs (if we add build process)
dist/
build/
out/

# Server-specific files
.htaccess
error_log
access_log
*.pid

# Large files
*.zip
*.tar.gz
*.iso
*.dmg

# Personal notes and drafts
notes.md
draft_*
TODO.private
NOTES.private

# Testing files
test_data/
*.test.html
EOF

    print_status ".gitignore updated"
}

# Create CHANGELOG.md
create_changelog() {
    print_status "Creating CHANGELOG.md..."
    
    cat > CHANGELOG.md << EOF
# Changelog

All notable changes to the Trump Pardons Database project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [2.1.0] - $CURRENT_DATE

### Added
- Comprehensive pardons database with $RECORD_COUNT individual records
- Mobile-responsive web interface with advanced filtering
- January 6th defendants demographics analysis from Seton Hall University research
- Real-time statistics and data visualization
- CSV-based data storage for easy updates
- Automated update scripts for adding new pardons
- Professional documentation with installation guides
- MIT License for open source distribution

### Features
- **Search & Filter**: Advanced filtering by name, offense, category, date, political party, and restitution amount
- **Mobile Design**: Fully responsive interface optimized for all devices
- **Demographics Dashboard**: Interactive charts showing January 6th defendant characteristics
- **Data Export**: CSV format for easy analysis and integration
- **Real-time Stats**: Live calculation of totals and breakdowns

### Data Sources
- Department of Justice Office of the Pardon Attorney
- White House Presidential Actions
- Federal court records and FBI documentation
- Seton Hall University Center for Policy & Research
- Multiple verified news sources and legal publications

### Technical Implementation
- Pure HTML/CSS/JavaScript (no dependencies)
- Client-side CSV parsing and filtering
- Progressive enhancement for accessibility
- Touch-friendly interface for mobile devices
- Optimized performance for large datasets

## [1.0.0] - Initial Release

### Added
- Basic database structure
- Initial data collection
- Core HTML interface
EOF

    print_status "CHANGELOG.md created"
}

# Create CONTRIBUTING.md
create_contributing_guide() {
    print_status "Creating CONTRIBUTING.md..."
    
    cat > CONTRIBUTING.md << EOF
# Contributing to Trump Pardons Database

Thank you for your interest in contributing to this project! This database aims to provide accurate, transparent information about presidential clemency actions.

## How to Contribute

### Data Contributions

#### Adding New Pardons/Commutations
1. **Verify Sources**: Only submit data with official documentation
   - DOJ press releases
   - White House announcements
   - Court documents
   - Verified news reports from credible sources

2. **Follow CSV Format**: Match the existing schema exactly:
   \`\`\`
   Name,Date,Type,Category,Offense,Original_Sentence,Restitution_Amount,Political_Party,Court,Notes
   \`\`\`

3. **Data Quality Standards**:
   - Use YYYY-MM-DD format for dates
   - Include complete offense descriptions
   - Verify restitution amounts from court documents
   - Provide detailed, factual notes with context

#### Data Verification Process
- Cross-reference multiple sources
- Include source links in pull request descriptions
- Verify accuracy of financial amounts
- Confirm court jurisdictions and case details

### Code Contributions

#### Frontend Improvements
- Mobile responsiveness enhancements
- Performance optimizations
- Accessibility improvements
- New filtering or visualization features

#### Development Setup
\`\`\`bash
# Clone the repository
git clone https://github.com/codeddarkness/taco_pardons.git
cd taco_pardons

# Test locally with a web server
python -m http.server 8000
# Navigate to http://localhost:8000/trump_pardons_database.html
\`\`\`

#### Code Style Guidelines
- Use semantic HTML5
- Follow mobile-first responsive design
- Maintain vanilla JavaScript (no dependencies)
- Include comments for complex logic
- Test on multiple browsers and devices

### Documentation Contributions

#### README Updates
- Fix typos or unclear explanations
- Add new installation methods
- Update source links and references
- Improve data analysis descriptions

#### Adding Screenshots
See the [Screenshot Guide](#screenshot-capture-instructions) below for requirements.

## Submission Process

### Pull Request Guidelines
1. **Fork the repository** and create a feature branch
2. **Make your changes** following the guidelines above
3. **Test thoroughly** - verify the website works correctly
4. **Write clear commit messages** describing your changes
5. **Submit a pull request** with:
   - Clear description of changes
   - Links to source documentation (for data additions)
   - Screenshots (for UI changes)
   - Testing notes

### Issue Reporting
- Use GitHub Issues for bug reports and feature requests
- Include browser version and device type for UI issues
- Provide steps to reproduce problems
- Suggest specific improvements with rationale

## Data Standards

### Accuracy Requirements
- All data must be verifiable through official sources
- Financial amounts must be confirmed through court documents
- Dates must be accurate to the day when available
- Political affiliations should be based on documented evidence

### Source Priority (Highest to Lowest)
1. Official government announcements (DOJ, White House)
2. Court documents and legal filings
3. Major news organizations (AP, Reuters, NPR, etc.)
4. Legal trade publications (Lawfare, etc.)
5. Academic research and analysis

### Prohibited Sources
- Social media posts without official verification
- Unverified blogs or opinion sites
- Partisan political websites without fact-checking
- Sources with known accuracy issues

## Communication

### Getting Help
- Open a GitHub Issue for questions
- Review existing issues before creating new ones
- Be respectful and constructive in all interactions

### Response Times
- Data corrections: Within 48 hours
- Feature requests: Within 1 week
- Bug reports: Within 24 hours (critical), 1 week (non-critical)

## Legal and Ethical Guidelines

### Data Usage
- This is factual, public information compiled for transparency
- All data should be verifiable and accurate
- Respect privacy of individuals when possible
- Maintain political neutrality in data presentation

### Copyright Compliance
- Never copy large sections of text from sources
- Use brief quotes with proper attribution
- Link to original sources rather than reproducing content
- Respect copyright and fair use principles

## Recognition

Contributors will be acknowledged in:
- README.md contributor section
- CHANGELOG.md for significant contributions
- GitHub contributor statistics

## Code of Conduct

### Expected Behavior
- Be respectful and professional
- Focus on factual accuracy over political opinions
- Provide constructive feedback
- Help maintain project quality standards

### Unacceptable Behavior
- Personal attacks or harassment
- Spreading misinformation
- Partisan political arguments
- Disruptive or offensive communication

## Contact

- **Project Maintainer**: Raymond Scheel
- **Email**: ray.scheel@gmail.com
- **GitHub Issues**: [Report issues here](https://github.com/codeddarkness/taco_pardons/issues)

Thank you for helping make government data more accessible and transparent!
EOF

    print_status "CONTRIBUTING.md created"
}

# Create screenshot capture instructions
create_screenshot_instructions() {
    print_status "Creating screenshot capture instructions..."
    
    cat > screenshots/CAPTURE_INSTRUCTIONS.md << EOF
# Screenshot Capture Instructions

## Required Screenshots

### 1. Desktop Main Interface (\`desktop-view.png\`)
**Dimensions**: 1920x1080 or 2560x1440
**Content**: Main database interface showing:
- Header with title and navigation
- Statistics cards with current data
- Filter panel with some options selected
- Data table with multiple pardon records visible
- Clean, professional appearance

**Capture Steps**:
1. Open \`trump_pardons_database.html\` in Chrome/Firefox
2. Set browser window to full screen (F11)
3. Wait for data to load completely
4. Ensure all UI elements are visible
5. Take screenshot using browser tools or OS capture

### 2. Mobile Interface (\`mobile-view.png\`)
**Dimensions**: 375x812 (iPhone 13) or 393x851 (Pixel 7)
**Content**: Mobile-responsive design showing:
- Stacked layout with proper scaling
- Touch-friendly buttons and inputs
- Readable text and proper spacing
- Navigation working correctly

**Capture Steps**:
1. Open browser developer tools (F12)
2. Enable device simulation/responsive mode
3. Select iPhone 13 or similar mobile device
4. Refresh page to load mobile layout
5. Scroll to show different sections
6. Capture multiple shots if needed, combine vertically

### 3. Advanced Filtering (\`desktop-filters.png\`)
**Dimensions**: 1920x1080
**Content**: Filtering interface in action:
- Multiple filters applied (e.g., "January 6", "Republican", date range)
- Results showing filtered data
- Statistics updated to reflect filtered results
- Clear demonstration of filtering capabilities

**Capture Steps**:
1. Open desktop interface
2. Apply 2-3 different filters
3. Ensure results update properly
4. Show filtered count in results info
5. Capture with filters clearly visible

### 4. Demographics Dashboard (\`demographics-dashboard.png\`)
**Dimensions**: 1920x1080
**Content**: January 6th demographics analysis page showing:
- Chart visualizations with data
- Information cards with statistics
- Source attribution
- Professional data presentation

**Capture Steps**:
1. Click "Demographics & Analysis" navigation
2. Wait for page to load completely
3. Scroll to show multiple chart sections
4. Ensure all text is readable
5. Capture full dashboard or create composite image

## Technical Requirements

### Image Quality
- **Format**: PNG (preferred) or high-quality JPG
- **Compression**: Minimal - prioritize clarity
- **Color**: Full color, accurate representation
- **Text**: All text must be clearly readable

### Browser Settings
- **Zoom**: 100% (default zoom level)
- **Browser**: Chrome or Firefox (latest versions)
- **Extensions**: Disable ad blockers and extensions that modify appearance
- **Cache**: Clear cache before capturing if needed

### Content Guidelines
- **Data**: Use actual project data, not placeholder text
- **UI State**: Show active/engaged interface, not empty states
- **Responsiveness**: Demonstrate mobile-first design working properly
- **Professional**: Clean, polished appearance for README display

## Capture Tools

### Recommended Tools

#### Browser Built-in
- **Chrome**: Developer Tools → Device Mode → Capture screenshot
- **Firefox**: Developer Tools → Responsive Design → Screenshot

#### Operating System
- **Windows**: Snipping Tool, Win + Shift + S
- **macOS**: Cmd + Shift + 4, Screenshot app
- **Linux**: GNOME Screenshot, Spectacle, Flameshot

#### Professional Tools
- **LightShot**: Browser extension and desktop app
- **Greenshot**: Open source screenshot tool
- **Snagit**: Professional screenshot and editing

### Mobile Capture
For actual mobile device screenshots:
1. Use device's built-in screenshot function
2. Transfer to computer via email/cloud storage
3. Resize if necessary to standard dimensions
4. Ensure image quality is maintained

## File Naming and Organization

### File Names
- Use exact names specified: \`desktop-view.png\`, \`mobile-view.png\`, etc.
- No spaces or special characters
- Use lowercase with hyphens

### File Sizes
- **Desktop**: Aim for 200-800KB per image
- **Mobile**: Aim for 100-400KB per image
- Balance quality with file size for web display

### Folder Structure
\`\`\`
screenshots/
├── desktop-view.png
├── mobile-view.png
├── desktop-filters.png
├── demographics-dashboard.png
├── CAPTURE_INSTRUCTIONS.md
└── README.md
\`\`\`

## Quality Checklist

Before submitting screenshots:

- [ ] All text is clearly readable
- [ ] Colors are accurate and vibrant
- [ ] No browser UI visible (unless intentional)
- [ ] Proper dimensions for target use
- [ ] File size optimized for web
- [ ] Content shows actual project data
- [ ] Mobile screenshots show responsive design
- [ ] All required UI elements are visible
- [ ] Professional appearance suitable for README

## Updating Screenshots

### When to Update
- Major UI changes or redesigns
- New features added to interface
- Significant data updates
- Improved mobile responsiveness
- Better visual design elements

### Update Process
1. Capture new screenshots following these instructions
2. Replace old files with same names
3. Test that README.md displays correctly
4. Commit and push changes to GitHub
5. Verify GitHub displays images properly

## Troubleshooting

### Common Issues
- **Blurry text**: Check zoom level, use higher resolution
- **Cut off content**: Adjust browser window size
- **Wrong colors**: Check browser color profile settings
- **Large file size**: Use PNG optimization or quality adjustment

### Browser-Specific Tips
- **Chrome**: Use device simulation for consistent mobile shots
- **Firefox**: Responsive design mode works well for mobile
- **Safari**: May need manual window resizing for best results

## Examples and Reference

For inspiration, look at other professional project screenshots:
- Clean, minimal design focus
- Actual data rather than Lorem ipsum
- Good contrast and readability
- Proper spacing and layout
- Professional color schemes

Remember: These screenshots represent the project publicly - make them count!
EOF

    print_status "Screenshot capture instructions created"
}

# Create GitHub Actions workflow for automated deployment
create_github_actions() {
    print_status "Creating GitHub Actions for automated deployment..."
    
    mkdir -p .github/workflows
    
    cat > .github/workflows/deploy.yml << EOF
name: Deploy to GitHub Pages

on:
  push:
    branches: [ main ]
  pull_request:
    branches: [ main ]

permissions:
  contents: read
  pages: write
  id-token: write

concurrency:
  group: "pages"
  cancel-in-progress: false

jobs:
  deploy:
    environment:
      name: github-pages
      url: \${{ steps.deployment.outputs.page_url }}
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v4
      
      - name: Setup Pages
        uses: actions/configure-pages@v4
      
      - name: Upload artifact
        uses: actions/upload-pages-artifact@v3
        with:
          path: '.'
      
      - name: Deploy to GitHub Pages
        id: deployment
        uses: actions/deploy-pages@v4
EOF

    print_status "GitHub Actions workflow created"
}

# Update author information in files
update_author_info() {
    print_status "Updating author information..."
    
    # Update LICENSE
    sed -i "s/Copyright (c) 2025 Trump Pardons Database Project/Copyright (c) 2025 $AUTHOR_NAME/" LICENSE
    
    # Add author info to README if not present
    if ! grep -q "$AUTHOR_NAME" README.md; then
        sed -i "/### Project Maintainer/a\\- **Author**: $AUTHOR_NAME\\n- **Email**: $AUTHOR_EMAIL" README.md
    fi
    
    print_status "Author information updated"
}

# Create development setup script
create_dev_setup() {
    print_status "Creating development setup script..."
    
    cat > setup_dev.sh << EOF
#!/bin/bash

# Development Environment Setup
# Quick setup for local development and testing

echo "Setting up Trump Pardons Database development environment..."

# Check if we have the required files
if [[ ! -f "trump_pardons_csv.txt" ]] || [[ ! -f "trump_pardons_database.html" ]]; then
    echo "Error: Required project files not found"
    echo "Make sure trump_pardons_csv.txt and trump_pardons_database.html exist"
    exit 1
fi

# Check for Python (for local server)
if command -v python3 &> /dev/null; then
    PYTHON_CMD="python3"
elif command -v python &> /dev/null; then
    PYTHON_CMD="python"
else
    echo "Warning: Python not found. You'll need a web server to test locally."
    PYTHON_CMD=""
fi

echo "Development environment ready!"
echo ""
echo "To start local development server:"
if [[ -n "\$PYTHON_CMD" ]]; then
    echo "  \$PYTHON_CMD -m http.server 8000"
    echo "  Then visit: http://localhost:8000/trump_pardons_database.html"
else
    echo "  Use any web server to serve the files"
    echo "  The application requires HTTP (not file://) to load CSV data"
fi
echo ""
echo "Project structure:"
echo "  trump_pardons_database.html - Main application"
echo "  trump_pardons_csv.txt       - Data file"
echo "  README.md                   - Documentation"
echo "  screenshots/                - UI screenshots"
echo ""
echo "To add new pardons:"
echo "  1. Edit trump_pardons_csv.txt following the existing format"
echo "  2. Test the changes locally"
echo "  3. Commit and push to update the live site"
EOF

    chmod +x setup_dev.sh
    print_status "Development setup script created"
}

# Validate project files
validate_project() {
    print_status "Validating project files and data..."
    
    # Check CSV format
    local csv_lines=$(wc -l < trump_pardons_csv.txt)
    local csv_fields=$(head -n 1 trump_pardons_csv.txt | tr ',' '\n' | wc -l)
    
    print_status "CSV validation:"
    echo "  - Total lines: $csv_lines"
    echo "  - Header fields: $csv_fields"
    echo "  - Data records: $((csv_lines - 1))"
    
    # Check HTML file
    if grep -q "trump_pardons_csv.txt" trump_pardons_database.html; then
        print_status "HTML file correctly references CSV"
    else
        print_warning "HTML file may not be loading CSV correctly"
    fi
    
    # Check for proper UTF-8 encoding
    if file trump_pardons_csv.txt | grep -q "UTF-8"; then
        print_status "CSV file has correct UTF-8 encoding"
    else
        print_warning "CSV file encoding may cause issues"
    fi
}

# Commit all changes
commit_updates() {
    print_status "Committing project completion updates..."
    
    # Add all new and modified files
    git add .
    
    # Create comprehensive commit
    git commit -m "Complete baseline project setup

- Updated README.md with current data and live demo links
- Created comprehensive CONTRIBUTING.md with guidelines
- Added CHANGELOG.md documenting project evolution
- Enhanced .gitignore for better project maintenance
- Created screenshot capture instructions
- Added GitHub Actions workflow for automated deployment
- Updated author information and licensing
- Created development setup script
- Validated $(($(wc -l < trump_pardons_csv.txt) - 1)) pardon records in database

Author: $AUTHOR_NAME <$AUTHOR_EMAIL>
Date: $CURRENT_DATE"

    print_status "Changes committed successfully"
}

# Push updates to GitHub
push_updates() {
    print_status "Pushing updates to GitHub..."
    
    # Push to main branch
    git push origin main
    
    print_status "Updates pushed to GitHub"
    print_status "GitHub Pages will automatically deploy the updates"
}

# Generate project summary
generate_summary() {
    local record_count=$(($(wc -l < trump_pardons_csv.txt) - 1))
    
    echo ""
    echo -e "${GREEN}========================================${NC}"
    echo -e "${GREEN}     PROJECT COMPLETION SUMMARY        ${NC}"
    echo -e "${GREEN}========================================${NC}"
    echo ""
    echo -e "${BLUE}Project Details:${NC}"
    echo "  Repository: https://github.com/codeddarkness/taco_pardons"
    echo "  Live Demo: https://codeddarkness.github.io/taco_pardons/trump_pardons_database.html"
    echo "  Author: $AUTHOR_NAME <$AUTHOR_EMAIL>"
    echo "  Completion Date: $CURRENT_DATE"
    echo ""
    echo -e "${BLUE}Database Statistics:${NC}"
    echo "  Total Records: $record_count"
    echo "  Data Format: CSV with 9 fields"
    echo "  Categories: January 6, Political, Business, Corruption, Drug, Celebrity, etc."
    echo ""
    echo -e "${BLUE}Technical Features:${NC}"
    echo "  ✓ Mobile-responsive design"
    echo "  ✓ Advanced search and filtering"
    echo "  ✓ Real-time statistics"
    echo "  ✓ Demographics analysis dashboard"
    echo "  ✓ GitHub Pages deployment"
    echo "  ✓ Automated CI/CD pipeline"
    echo ""
    echo -e "${BLUE}Documentation Created:${NC}"
    echo "  ✓ README.md - Comprehensive project documentation"
    echo "  ✓ CONTRIBUTING.md - Contributor guidelines"
    echo "  ✓ CHANGELOG.md - Version history"
    echo "  ✓ LICENSE - MIT License"
    echo "  ✓ Screenshot instructions"
    echo ""
    echo -e "${BLUE}Next Steps:${NC}"
    echo "  1. Add screenshots to screenshots/ directory"
    echo "  2. Enable GitHub Pages in repository settings"
    echo "  3. Monitor for new pardon announcements"
    echo "  4. Update data using provided scripts"
    echo ""
    echo -e "${GREEN}Project baseline complete and ready for public use!${NC}"
    echo ""
}

# Main execution
main() {
    print_header
    
    check_project_directory
    update_readme
    create_updated_gitignore
    create_changelog
    create_contributing_guide
    create_screenshot_instructions
    create_github_actions
    update_author_info
    create_dev_setup
    validate_project
    commit_updates
    push_updates
    generate_summary
    
    print_status "Project completion script finished successfully!"
}

# Run main function
main "$@"
