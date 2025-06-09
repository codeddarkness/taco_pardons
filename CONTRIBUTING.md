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
   ```
   Name,Date,Type,Category,Offense,Original_Sentence,Restitution_Amount,Political_Party,Court,Notes
   ```

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
```bash
# Clone the repository
git clone https://github.com/codeddarkness/taco_pardons.git
cd taco_pardons

# Test locally with a web server
python -m http.server 8000
# Navigate to http://localhost:8000/trump_pardons_database.html
```

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
