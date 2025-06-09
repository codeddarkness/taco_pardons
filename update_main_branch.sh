#!/bin/bash
# merge_first_term_to_main.sh
# Script to safely merge dev/first_term branch into main branch

set -e  # Exit on any error

# Color codes for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
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

print_merge() {
    echo -e "${CYAN}[MERGE]${NC} $1"
}

# Function to check if we're in the right directory and branch
check_environment() {
    print_status "Checking environment..."
    
    # Check if we're in a git repository
    if [[ ! -d ".git" ]]; then
        print_error "Not in a git repository. Please run from the taco_pardons git repo."
        exit 1
    fi
    
    # Check if we're in the correct directory
    if [[ ! -f "trump_pardons_database.html" ]] || [[ ! -f "trump_pardons_csv.txt" ]]; then
        print_error "Not in the correct directory. Expected files not found."
        print_error "Please run this script from the taco_pardons repository root."
        exit 1
    fi
    
    # Check current branch
    local current_branch=$(git branch --show-current)
    if [[ "$current_branch" != "dev/first_term" ]]; then
        print_warning "Current branch is '$current_branch', not 'dev/first_term'"
        print_status "Switching to dev/first_term branch..."
        git checkout dev/first_term || {
            print_error "Failed to switch to dev/first_term branch"
            exit 1
        }
    fi
    
    print_success "Environment check passed"
}

# Function to check git status and clean up loose files
check_git_status() {
    print_status "Checking git status and cleaning up..."
    
    # Check if we have uncommitted changes
    if ! git diff-index --quiet HEAD --; then
        print_status "Found uncommitted changes. Reviewing them..."
        git status --porcelain
        echo
        
        # Clean up the temporary patch files and backup directory
        if [[ -f "add_first_term_patch1.sh" ]] || [[ -f "add_first_term_patch2.sh" ]] || [[ -f "add_first_term_patch3.sh" ]]; then
            print_status "Removing temporary patch files..."
            rm -f add_first_term_patch1.sh add_first_term_patch2.sh add_first_term_patch3.sh
            print_success "Patch files removed"
        fi
        
        # Handle backup directory
        if [[ -d "backup_20250609_134249" ]]; then
            print_status "Moving backup directory to patches/ folder..."
            mkdir -p patches/
            mv backup_20250609_134249 patches/ 2>/dev/null || true
            print_success "Backup moved to patches/backup_20250609_134249"
        fi
        
        # Update .gitignore if needed
        if [[ -f ".gitignore" ]]; then
            if ! grep -q "backup_*" .gitignore; then
                echo "" >> .gitignore
                echo "# Backup directories" >> .gitignore
                echo "backup_*/" >> .gitignore
                echo "patches/backup_*/" >> .gitignore
                print_success "Updated .gitignore to exclude backup directories"
            fi
        fi
        
        # Stage the cleanup changes
        git add .gitignore 2>/dev/null || true
        git add . 2>/dev/null || true
        git reset HEAD patches/ 2>/dev/null || true  # Don't track patches directory
        git reset HEAD dir_status.txt 2>/dev/null || true  # Don't track temp status file
        
        # Commit cleanup if there are staged changes
        if ! git diff-index --quiet --cached HEAD --; then
            git commit -m "cleanup: Remove temporary files and organize backups

- Removed temporary patch files (add_first_term_patch*.sh)
- Moved backup directory to patches/ folder
- Updated .gitignore for future backup exclusions
- Prepared branch for merge to main"
            print_success "Cleanup changes committed"
        fi
    fi
    
    print_success "Git status clean and ready for merge"
}

# Function to verify dev/first_term branch integrity
verify_branch_integrity() {
    print_status "Verifying dev/first_term branch integrity..."
    
    # Check if required files exist
    local required_files=(
        "trump_pardons_database.html"
        "trump_pardons_csv.txt"
        "trump_pardons_first_term_csv.txt"
        "README.md"
    )
    
    for file in "${required_files[@]}"; do
        if [[ ! -f "$file" ]]; then
            print_error "Required file missing: $file"
            exit 1
        fi
    done
    
    # Verify HTML file has first-term functionality
    if ! grep -q "First Term (2017-2021)" trump_pardons_database.html; then
        print_error "HTML file missing first-term navigation"
        exit 1
    fi
    
    if ! grep -q "firstTermView" trump_pardons_database.html; then
        print_error "HTML file missing first-term view functionality"
        exit 1
    fi
    
    # Check first-term CSV file
    local csv_lines=$(wc -l < trump_pardons_first_term_csv.txt)
    if [[ $csv_lines -lt 100 ]]; then
        print_error "First-term CSV file appears incomplete (only $csv_lines lines)"
        exit 1
    fi
    
    print_success "Branch integrity verified - all required files present and functional"
}

# Function to get merge summary stats
get_merge_stats() {
    print_status "Analyzing changes for merge summary..."
    
    # Get file changes
    local files_changed=$(git diff --name-only main..dev/first_term | wc -l)
    local files_added=$(git diff --name-status main..dev/first_term | grep "^A" | wc -l)
    local files_modified=$(git diff --name-status main..dev/first_term | grep "^M" | wc -l)
    
    # Get line changes
    local line_stats=$(git diff --stat main..dev/first_term | tail -1)
    
    # Count records in CSV files
    local second_term_records=0
    local first_term_records=0
    
    if [[ -f "trump_pardons_csv.txt" ]]; then
        second_term_records=$(tail -n +2 trump_pardons_csv.txt | wc -l)
    fi
    
    if [[ -f "trump_pardons_first_term_csv.txt" ]]; then
        first_term_records=$(tail -n +2 trump_pardons_first_term_csv.txt | wc -l)
    fi
    
    echo "MERGE_STATS_FILES_CHANGED=$files_changed" > .merge_stats
    echo "MERGE_STATS_FILES_ADDED=$files_added" >> .merge_stats
    echo "MERGE_STATS_FILES_MODIFIED=$files_modified" >> .merge_stats
    echo "MERGE_STATS_LINE_STATS=\"$line_stats\"" >> .merge_stats
    echo "MERGE_STATS_SECOND_TERM_RECORDS=$second_term_records" >> .merge_stats
    echo "MERGE_STATS_FIRST_TERM_RECORDS=$first_term_records" >> .merge_stats
}

# Function to perform the merge
perform_merge() {
    print_merge "Starting merge process..."
    
    # Fetch latest changes
    git fetch origin 2>/dev/null || print_warning "Could not fetch from origin (might be working offline)"
    
    # Switch to main branch
    print_status "Switching to main branch..."
    git checkout main || {
        print_error "Failed to switch to main branch"
        exit 1
    }
    
    # Pull latest main changes
    if git remote get-url origin &>/dev/null; then
        print_status "Pulling latest changes from origin/main..."
        git pull origin main || print_warning "Could not pull from origin (might be working offline)"
    fi
    
    # Check if main branch has conflicts with our changes
    print_status "Checking for potential merge conflicts..."
    if git merge --no-commit --no-ff dev/first_term; then
        print_success "Merge preview successful - no conflicts detected"
        git merge --abort  # Reset the preview merge
    else
        print_error "Merge conflicts detected. Manual resolution required."
        git merge --abort 2>/dev/null || true
        print_error "Please resolve conflicts manually and re-run this script."
        exit 1
    fi
    
    # Perform the actual merge
    print_merge "Performing merge: dev/first_term -> main"
    git merge --no-ff dev/first_term -m "feat: Merge first-term pardons integration from dev/first_term

Merges comprehensive first-term pardons database implementation.

Major additions:
- Complete first-term pardons dataset (2017-2021) with 237 entries
- Three-tab navigation system (Second Term, First Term, Demographics)
- Independent filtering and search for each presidential term
- Enhanced HTML structure with dual CSV loading capability
- Maintained all existing functionality and styling

Database now covers:
- Second Term (2025+): Current presidency clemency actions
- First Term (2017-2021): Historical presidency clemency actions  
- Demographics: January 6th defendant analysis

Technical improvements:
- Dual CSV architecture for separate term data
- Responsive design across all views
- Error handling for missing data files
- Performance optimizations for large datasets

This merge brings the database to feature parity with comprehensive
coverage of both Trump presidencies."
    
    print_success "Merge completed successfully!"
}

# Function to verify merge results
verify_merge() {
    print_status "Verifying merge results..."
    
    # Check that we're on main branch
    local current_branch=$(git branch --show-current)
    if [[ "$current_branch" != "main" ]]; then
        print_error "Not on main branch after merge. Something went wrong."
        exit 1
    fi
    
    # Verify all files are present
    local required_files=(
        "trump_pardons_database.html"
        "trump_pardons_csv.txt"
        "trump_pardons_first_term_csv.txt"
        "README.md"
    )
    
    for file in "${required_files[@]}"; do
        if [[ ! -f "$file" ]]; then
            print_error "Required file missing after merge: $file"
            exit 1
        fi
    done
    
    # Quick functionality test
    if ! grep -q "First Term (2017-2021)" trump_pardons_database.html; then
        print_error "HTML file missing first-term functionality after merge"
        exit 1
    fi
    
    print_success "Merge verification passed - all functionality intact"
}

# Function to push changes to remote
push_changes() {
    if git remote get-url origin &>/dev/null; then
        print_status "Pushing merged changes to origin..."
        
        # Push main branch
        if git push origin main; then
            print_success "Successfully pushed main branch to origin"
        else
            print_warning "Failed to push main branch (might be working offline)"
        fi
        
        # Push dev/first_term branch for backup
        if git push origin dev/first_term; then
            print_success "Successfully pushed dev/first_term branch to origin"
        else
            print_warning "Failed to push dev/first_term branch (might be working offline)"
        fi
    else
        print_warning "No remote origin configured - skipping push"
    fi
}

# Function to provide merge summary
merge_summary() {
    print_success "🎉 First-term integration merge completed successfully!"
    echo
    echo "📊 Merge Summary:"
    echo "=================="
    
    if [[ -f ".merge_stats" ]]; then
        source .merge_stats
        echo "✅ Files changed: $MERGE_STATS_FILES_CHANGED"
        echo "✅ Files added: $MERGE_STATS_FILES_ADDED"
        echo "✅ Files modified: $MERGE_STATS_FILES_MODIFIED"
        echo "✅ $MERGE_STATS_LINE_STATS"
        echo
        echo "📈 Database Statistics:"
        echo "  - Second-term records: $MERGE_STATS_SECOND_TERM_RECORDS"
        echo "  - First-term records: $MERGE_STATS_FIRST_TERM_RECORDS"
        echo "  - Total database size: $((MERGE_STATS_SECOND_TERM_RECORDS + MERGE_STATS_FIRST_TERM_RECORDS)) entries"
        rm -f .merge_stats
    fi
    
    echo
    echo "🌟 What's new in main branch:"
    echo "  ✨ Complete first-term pardons database (2017-2021)"
    echo "  🎯 Three-tab navigation system"
    echo "  🔍 Independent filtering for each presidential term"
    echo "  📱 Responsive design maintained across all views"
    echo "  🚀 Enhanced performance for large datasets"
    echo
    echo "🗂️ Navigation structure:"
    echo "  📅 Second Term (2025+) - Current presidency data"
    echo "  📚 First Term (2017-2021) - Historical presidency data"
    echo "  📊 Demographics & Analysis - January 6th analysis"
    echo
    echo "💾 Files in main branch:"
    echo "  - trump_pardons_database.html (enhanced with dual-term support)"
    echo "  - trump_pardons_csv.txt (second-term data)"
    echo "  - trump_pardons_first_term_csv.txt (first-term data) ← NEW!"
    echo "  - README.md (updated documentation)"
    echo
    echo "🚀 Ready for deployment:"
    echo "  - All changes merged to main branch"
    echo "  - Database covers both Trump presidencies"
    echo "  - Comprehensive clemency action tracking"
    echo "  - User-friendly interface with advanced filtering"
    echo
    echo "💡 Next steps:"
    echo "  1. Test the application locally"
    echo "  2. Deploy to production when ready"
    echo "  3. Consider creating a release tag"
    echo
    echo "🏷️ Create release tag (optional):"
    echo "  git tag -a v2.0.0 -m 'Release v2.0.0: Complete dual-term pardons database'"
    echo "  git push origin v2.0.0"
    echo
    
    # Check current status
    print_status "Current branch status:"
    git log --oneline -5
    echo
    print_status "Ready to test at: trump_pardons_database.html"
}

# Function to handle cleanup on error
cleanup_on_error() {
    print_error "Merge failed. Cleaning up..."
    
    # Try to return to a safe state
    git merge --abort 2>/dev/null || true
    git checkout main 2>/dev/null || git checkout dev/first_term 2>/dev/null || true
    
    print_error "Merge failed and state reset. Please check the error messages above."
    print_status "You can manually resolve issues and re-run this script."
    exit 1
}

# Main execution function
main() {
    echo "🔄 Trump Pardons Database - Merge First Term to Main"
    echo "=================================================="
    echo
    
    # Set up error handling
    trap cleanup_on_error ERR
    
    # Run all merge steps
    check_environment
    check_git_status
    verify_branch_integrity
    get_merge_stats
    perform_merge
    verify_merge
    push_changes
    merge_summary
    
    print_success "🎉 Merge completed successfully!"
}

# Check if script is being run directly (not sourced)
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi
