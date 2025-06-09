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
if [[ -n "$PYTHON_CMD" ]]; then
    echo "  $PYTHON_CMD -m http.server 8000"
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
