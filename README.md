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
