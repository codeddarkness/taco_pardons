#!/bin/bash
# Script 2: Update HTML to add first-term pardons subpage

# Create backup
cp trump_pardons_database.html trump_pardons_database.html.bak

# Update the HTML file
cat > trump_pardons_database.html << 'EOF'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes">
    <title>Trump Second Presidency Pardons Database</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
            background: linear-gradient(135deg, #1a1a1a 0%, #2d3748 50%, #1a202c 100%);
            min-height: 100vh;
            color: #ffffff;
            padding: 10px;
            font-size: 16px;
            line-height: 1.5;
        }

        .container {
            max-width: 1400px;
            margin: 0 auto;
            background: rgba(45, 55, 72, 0.95);
            border-radius: 15px;
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.5);
            padding: 20px;
            backdrop-filter: blur(10px);
            border: 1px solid rgba(74, 85, 104, 0.3);
        }

        .header {
            text-align: center;
            margin-bottom: 25px;
        }

        .header h1 {
            color: #ffffff;
            font-size: clamp(1.8rem, 4vw, 2.5rem);
            margin-bottom: 10px;
            font-weight: 700;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
            line-height: 1.2;
        }

        .header p {
            color: #a0aec0;
            font-size: clamp(0.9rem, 2.5vw, 1.1rem);
            padding: 0 10px;
        }

        .nav-links {
            text-align: center;
            margin-bottom: 20px;
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 10px;
        }

        .nav-links a {
            color: #3182ce;
            text-decoration: none;
            padding: 12px 16px;
            border: 2px solid #3182ce;
            border-radius: 8px;
            transition: all 0.3s ease;
            font-size: 14px;
            font-weight: 500;
            min-height: 44px;
            display: flex;
            align-items: center;
            justify-content: center;
            flex: 1;
            min-width: 140px;
            max-width: 200px;
        }

        .nav-links a:hover, .nav-links a:active {
            background: #3182ce;
            color: white;
            transform: translateY(-1px);
        }

        .nav-links a.active {
            background: #3182ce;
            color: white;
        }

        .stats-overview {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
            gap: 15px;
            margin-bottom: 25px;
        }

        .stat-card {
            background: linear-gradient(135deg, #2b6cb0, #3182ce);
            color: white;
            padding: 20px 15px;
            border-radius: 12px;
            text-align: center;
            box-shadow: 0 6px 12px rgba(43, 108, 176, 0.3);
            border: 1px solid rgba(49, 130, 206, 0.3);
            min-height: 100px;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .stat-card h3 {
            font-size: clamp(1.5rem, 4vw, 2rem);
            margin-bottom: 5px;
            font-weight: 700;
        }

        .stat-card p {
            opacity: 0.9;
            font-size: clamp(0.8rem, 2vw, 1rem);
        }

        .filters {
            background: #2d3748;
            padding: 20px;
            border-radius: 12px;
            margin-bottom: 25px;
            border: 2px solid #4a5568;
        }

        .filter-grid {
            display: grid;
            grid-template-columns: 1fr;
            gap: 15px;
            margin-bottom: 20px;
        }

        .filter-group {
            display: flex;
            flex-direction: column;
        }

        .filter-group label {
            font-weight: 600;
            margin-bottom: 8px;
            color: #ffffff;
            font-size: 14px;
        }

        .filter-group select, .filter-group input {
            padding: 14px 12px;
            border: 2px solid #4a5568;
            border-radius: 8px;
            font-size: 16px;
            background: #1a202c;
            color: #ffffff;
            transition: all 0.3s ease;
            min-height: 48px;
            -webkit-appearance: none;
            appearance: none;
        }

        .filter-group select:focus, .filter-group input:focus {
            outline: none;
            border-color: #3182ce;
            box-shadow: 0 0 0 3px rgba(49, 130, 206, 0.2);
        }

        .search-box input {
            width: 100%;
            padding: 16px 12px;
            font-size: 16px;
            border: 2px solid #4a5568;
            border-radius: 10px;
            background: #1a202c;
            color: #ffffff;
        }

        .clear-filters {
            background: #e53e3e;
            color: white;
            border: none;
            padding: 14px 24px;
            border-radius: 8px;
            cursor: pointer;
            font-weight: 600;
            font-size: 16px;
            transition: all 0.3s ease;
            min-height: 48px;
            width: 100%;
        }

        .clear-filters:hover, .clear-filters:active {
            background: #c53030;
            transform: translateY(-1px);
        }

        .results-info {
            margin: 20px 0;
            padding: 15px;
            background: #2f855a;
            border-radius: 8px;
            border-left: 4px solid #48bb78;
            color: #ffffff;
            font-size: 14px;
        }

        .table-container {
            overflow-x: auto;
            border-radius: 12px;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.3);
            -webkit-overflow-scrolling: touch;
        }

        table {
            width: 100%;
            min-width: 800px;
            border-collapse: collapse;
            background: #2d3748;
        }

        th {
            background: linear-gradient(135deg, #1a202c, #2d3748);
            color: white;
            padding: 12px 8px;
            text-align: left;
            font-weight: 600;
            position: sticky;
            top: 0;
            z-index: 10;
            border-bottom: 2px solid #4a5568;
            font-size: 14px;
            white-space: nowrap;
        }

        td {
            padding: 12px 8px;
            border-bottom: 1px solid #4a5568;
            vertical-align: top;
            color: #e2e8f0;
            font-size: 13px;
            word-wrap: break-word;
            max-width: 200px;
        }

        tr:hover {
            background: #374151;
        }

        tr:nth-child(even) {
            background: rgba(45, 55, 72, 0.5);
        }

        .tag {
            display: inline-block;
            padding: 4px 8px;
            border-radius: 12px;
            font-size: 11px;
            font-weight: 600;
            margin: 2px;
            white-space: nowrap;
        }

        .tag.pardon { background: #2f855a; color: #f0fff4; }
        .tag.commutation { background: #d69e2e; color: #fffbeb; }
        .tag.jan6 { background: #e53e3e; color: #fed7d7; }
        .tag.political { background: #3182ce; color: #ebf8ff; }
        .tag.business { background: #6b7280; color: #f9fafb; }
        .tag.drug { background: #b91c1c; color: #fee2e2; }
        .tag.corruption { background: #ea580c; color: #fed7aa; }
        .tag.white-collar { background: #1e40af; color: #dbeafe; }
        .tag.celebrity { background: #7c3aed; color: #ede9fe; }
        .tag.anti-abortion { background: #be185d; color: #fce7f3; }
        .tag.law-enforcement { background: #059669; color: #d1fae5; }

        .amount {
            font-weight: 600;
            color: #f56565;
        }

        .date {
            font-weight: 600;
            color: #68d391;
        }

        .loading {
            text-align: center;
            padding: 40px 20px;
            font-size: 1.1rem;
            color: #a0aec0;
        }

        .error {
            background: #e53e3e;
            color: white;
            padding: 20px;
            border-radius: 10px;
            margin: 20px 0;
            text-align: center;
        }

        /* Demographics View Improvements */
        #demographicsView {
            padding: 10px 0;
        }

        .demographics h3 {
            font-size: clamp(1.5rem, 4vw, 2rem);
            margin-bottom: 20px;
            text-align: center;
            color: #ffffff;
        }

        .demographics-grid {
            display: grid;
            grid-template-columns: 1fr;
            gap: 20px;
            margin-bottom: 25px;
        }

        .demo-card {
            background: #2d3748;
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.3);
            border: 1px solid #4a5568;
        }

        .demo-card h4 {
            text-align: center;
            margin-bottom: 15px;
            color: #ffffff;
            font-size: clamp(1.1rem, 3vw, 1.3rem);
        }

        .chart-container {
            display: flex;
            flex-direction: column;
            gap: 8px;
        }

        .chart-bar {
            display: flex;
            align-items: center;
            gap: 10px;
            margin-bottom: 8px;
        }

        .chart-label {
            min-width: 80px;
            font-size: 12px;
            color: #e2e8f0;
            text-align: left;
        }

        .chart-bar-fill {
            height: 20px;
            border-radius: 10px;
            position: relative;
            transition: all 0.3s ease;
        }

        .chart-value {
            font-size: 12px;
            font-weight: 600;
            color: #ffffff;
            min-width: 60px;
            text-align: right;
        }

        .info-card {
            background: rgba(49, 130, 206, 0.1);
            padding: 15px;
            border-radius: 10px;
            border-left: 4px solid #3182ce;
            margin-bottom: 15px;
        }

        .info-card-title {
            font-weight: 600;
            color: #ffffff;
            margin-bottom: 8px;
            font-size: 13px;
        }

        .info-card-content {
            color: #e2e8f0;
            font-size: 12px;
            line-height: 1.4;
        }

        .source-attribution {
            background: #1a202c;
            padding: 20px;
            border-radius: 10px;
            margin-top: 30px;
            border: 1px solid #4a5568;
            text-align: center;
        }

        .source-attribution div {
            font-size: 14px;
            color: #a0aec0;
            line-height: 1.5;
        }

        .source-attribution strong {
            color: #ffffff;
        }

        /* Tablet Styles */
        @media (min-width: 600px) {
            .container {
                padding: 25px;
            }
            
            .filter-grid {
                grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            }
            
            .demographics-grid {
                grid-template-columns: repeat(auto-fit, minmax(350px, 1fr));
            }
            
            .chart-label {
                min-width: 100px;
            }
        }

        /* Desktop Styles */
        @media (min-width: 1024px) {
            .container {
                padding: 30px;
            }
            
            .filter-grid {
                grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            }
            
            .demographics-grid {
                grid-template-columns: repeat(auto-fit, minmax(400px, 1fr));
            }
            
            .nav-links {
                flex-wrap: nowrap;
            }
            
            .nav-links a {
                flex: 0 1 auto;
            }
        }

        /* Touch-friendly improvements */
        @media (hover: none) and (pointer: coarse) {
            .nav-links a,
            .clear-filters,
            .filter-group select,
            .filter-group input {
                min-height: 48px;
            }
            
            .tag {
                min-height: 32px;
                display: inline-flex;
                align-items: center;
            }
        }

        /* High DPI displays */
        @media (-webkit-min-device-pixel-ratio: 2), (min-resolution: 192dpi) {
            .header h1 {
                text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.5);
            }
        }

        /* Dark mode support for devices that prefer it */
        @media (prefers-color-scheme: dark) {
            body {
                background: linear-gradient(135deg, #0f0f0f 0%, #1a202c 50%, #111827 100%);
            }
        }

        /* Reduced motion support */
        @media (prefers-reduced-motion: reduce) {
            * {
                animation-duration: 0.01ms !important;
                animation-iteration-count: 1 !important;
                transition-duration: 0.01ms !important;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>Trump Pardons Database</h1>
            <p>Comprehensive analysis of executive clemency grants</p>
        </div>

        <div class="nav-links">
            <a href="#main" onclick="showMainView()" id="mainTab">Second Term (2025+)</a>
            <a href="#firstterm" onclick="showFirstTermView()" id="firstTermTab">First Term (2017-2021)</a>
            <a href="#demographics" onclick="showDemographics()" id="demographicsTab">Demographics & Analysis</a>
        </div>

        <div id="mainView">
            <div class="header">
                <h2>Second Presidency Pardons Database</h2>
                <p>Executive clemency grants (January 2025 - Present)</p>
            </div>

            <div class="stats-overview">
                <div class="stat-card">
                    <h3 id="totalCount">Loading...</h3>
                    <p>Total Recipients</p>
                </div>
                <div class="stat-card">
                    <h3 id="pardonCount">0</h3>
                    <p>Full Pardons</p>
                </div>
                <div class="stat-card">
                    <h3 id="commutationCount">0</h3>
                    <p>Commutations</p>
                </div>
                <div class="stat-card">
                    <h3 id="restitutionTotal">$0</h3>
                    <p>Restitution Waived</p>
                </div>
            </div>

            <div class="filters">
                <div class="filter-grid">
                    <div class="filter-group search-box">
                        <label for="search">Search Names, Offenses, or Notes</label>
                        <input type="text" id="search" placeholder="Enter search terms...">
                    </div>
                    
                    <div class="filter-group">
                        <label for="clemencyType">Clemency Type</label>
                        <select id="clemencyType">
                            <option value="">All Types</option>
                            <option value="Pardon">Pardons</option>
                            <option value="Commutation">Commutations</option>
                        </select>
                    </div>

                    <div class="filter-group">
                        <label for="category">Category</label>
                        <select id="category">
                            <option value="">All Categories</option>
                            <option value="January 6">January 6 Cases</option>
                            <option value="Political">Political Figures</option>
                            <option value="Business">Business/White-Collar</option>
                            <option value="Drug">Drug-Related</option>
                            <option value="Corruption">Corruption</option>
                            <option value="Celebrity">Celebrity/High-Profile</option>
                            <option value="Anti-Abortion">Anti-Abortion Activists</option>
                            <option value="Law Enforcement">Law Enforcement/Military</option>
                        </select>
                    </div>

                    <div class="filter-group">
                        <label for="politicalParty">Political Affiliation</label>
                        <select id="politicalParty">
                            <option value="">All Parties</option>
                            <option value="Republican">Republican</option>
                            <option value="Democrat">Democrat</option>
                            <option value="Unknown">Unknown/Not Applicable</option>
                        </select>
                    </div>

                    <div class="filter-group">
                        <label for="dateRange">Date Range</label>
                        <select id="dateRange">
                            <option value="">All Dates</option>
                            <option value="2025-01">January 2025</option>
                            <option value="2025-02">February 2025</option>
                            <option value="2025-03">March 2025</option>
                            <option value="2025-04">April 2025</option>
                            <option value="2025-05">May 2025</option>
                        </select>
                    </div>

                    <div class="filter-group">
                        <label for="restitutionAmount">Restitution Amount</label>
                        <select id="restitutionAmount">
                            <option value="">All Amounts</option>
                            <option value="high">$10M+ (High)</option>
                            <option value="medium">$1M-$10M (Medium)</option>
                            <option value="low">Under $1M (Low)</option>
                            <option value="none">No Restitution</option>
                        </select>
                    </div>
                </div>
                <button class="clear-filters" onclick="clearAllFilters()">Clear All Filters</button>
            </div>

            <div class="results-info" id="resultsInfo">
                Loading data...
            </div>

            <div class="loading" id="loading">
                Loading pardon data from CSV...
            </div>

            <div class="table-container" id="tableContainer" style="display: none;">
                <table id="pardonsTable">
                    <thead>
                        <tr>
                            <th>Date</th>
                            <th>Name</th>
                            <th>Type</th>
                            <th>Category</th>
                            <th>Offense</th>
                            <th>Original Sentence</th>
                            <th>Restitution</th>
                            <th>Political Party</th>
                            <th>Notes</th>
                        </tr>
                    </thead>
                    <tbody id="tableBody">
                    </tbody>
                </table>
            </div>
        </div>

        <div id="firstTermView" style="display: none;">
            <div class="header">
                <h2>First Presidency Pardons Database</h2>
                <p>Executive clemency grants (January 2017 - January 2021)</p>
            </div>

            <div class="stats-overview">
                <div class="stat-card">
                    <h3 id="firstTermTotalCount">Loading...</h3>
                    <p>Total Recipients</p>
                </div>
                <div class="stat-card">
                    <h3 id="firstTermPardonCount">0</h3>
                    <p>Full Pardons</p>
                </div>
                <div class="stat-card">
                    <h3 id="firstTermCommutationCount">0</h3>
                    <p>Commutations</p>
                </div>
                <div class="stat-card">
                    <h3 id="firstTermRestitutionTotal">$0</h3>
                    <p>Restitution Waived</p>
                </div>
            </div>

            <div class="filters">
                <div class="filter-grid">
                    <div class="filter-group search-box">
                        <label for="firstTermSearch">Search Names, Offenses, or Notes</label>
                        <input type="text" id="firstTermSearch" placeholder="Enter search terms...">
                    </div>
                    
                    <div class="filter-group">
                        <label for="firstTermClemencyType">Clemency Type</label>
                        <select id="firstTermClemencyType">
                            <option value="">All Types</option>
                            <option value="Pardon">Pardons</option>
                            <option value="Commutation">Commutations</option>
                        </select>
                    </div>

                    <div class="filter-group">
                        <label for="firstTermCategory">Category</label>
                        <select id="firstTermCategory">
                            <option value="">All Categories</option>
                            <option value="Political">Political Figures</option>
                            <option value="Business">Business/White-Collar</option>
                            <option value="Drug">Drug-Related</option>
                            <option value="Military">Military</option>
                            <option value="Celebrity">Celebrity/High-Profile</option>
                            <option value="Law Enforcement">Law Enforcement</option>
                            <option value="Historical">Historical</option>
                            <option value="Other">Other</option>
                        </select>
                    </div>

                    <div class="filter-group">
                        <label for="firstTermPoliticalParty">Political Affiliation</label>
                        <select id="firstTermPoliticalParty">
                            <option value="">All Parties</option>
                            <option value="Republican">Republican</option>
                            <option value="Democrat">Democrat</option>
                            <option value="Unknown">Unknown/Not Applicable</option>
                        </select>
                    </div>

                    <div class="filter-group">
                        <label for="firstTermDateRange">Date Range</label>
                        <select id="firstTermDateRange">
                            <option value="">All Dates</option>
                            <option value="2017">2017</option>
                            <option value="2018">2018</option>
                            <option value="2019">2019</option>
                            <option value="2020">2020</option>
                            <option value="2021">2021</option>
                        </select>
                    </div>

                    <div class="filter-group">
                        <label for="firstTermRestitutionAmount">Restitution Amount</label>
                        <select id="firstTermRestitutionAmount">
                            <option value="">All Amounts</option>
                            <option value="high">$10M+ (High)</option>
                            <option value="medium">$1M-$10M (Medium)</option>
                            <option value="low">Under $1M (Low)</option>
                            <option value="none">No Restitution</option>
                        </select>
                    </div>
                </div>
                <button class="clear-filters" onclick="clearFirstTermFilters()">Clear All Filters</button>
            </div>

            <div class="results-info" id="firstTermResultsInfo">
                Loading data...
            </div>

            <div class="loading" id="firstTermLoading">
                Loading first-term pardon data from CSV...
            </div>

            <div class="table-container" id="firstTermTableContainer" style="display: none;">
                <table id="firstTermPardonsTable">
                    <thead>
                        <tr>
                            <th>Date</th>
                            <th>Name</th>
                            <th>Type</th>
                            <th>Category</th>
                            <th>Offense</th>
                            <th>Original Sentence</th>
                            <th>Restitution</th>
                            <th>Political Party</th>
                            <th>Notes</th>
                        </tr>
                    </thead>
                    <tbody id="firstTermTableBody">
                    </tbody>
                </table>
            </div>
        </div>

        <div id="demographicsView" style="display: none;">
            <div class="demographics">
                <h3>January 6th Defendants Demographics & Characteristics</h3>
                
                <!-- Dataset Information -->
                <div class="demo-card">
                    <h4>About This Analysis</h4>
                    <div class="demographics-grid">
                        <div class="info-card">
                            <div class="info-card-title">Database Scope</div>
                            <div class="info-card-content">
                                • <strong>Total Database:</strong> All Trump second-term pardons & commutations (1,500+ recipients)<br>
                                • <strong>This Analysis:</strong> January 6th defendants only (~1,500 people)<br>
                                • <strong>Source:</strong> Seton Hall University Center for Policy & Research
                            </div>
                        </div>
                        <div class="info-card">
                            <div class="info-card-title">Dataset Parameters</div>
                            <div class="info-card-content">
                                • <strong>Study Period:</strong> First year after January 6, 2021<br>
                                • <strong>Sample Size:</strong> 716 defendants (first wave prosecutions)<br>
                                • <strong>Conviction Rate:</strong> 99.4% (529 of 532 completed cases)
                            </div>
                        </div>
                        <div class="info-card">
                            <div class="info-card-title">Important Notes</div>
                            <div class="info-card-content">
                                • Demographics below reflect prosecuted defendants, not all attendees<br>
                                • Data sourced from FBI statements, court filings, and legal documents<br>
                                • All January 6th cases were pardoned by Trump on January 20, 2025
                            </div>
                        </div>
                    </div>
                </div>
                
                <!-- Demographics Charts -->
                <div class="demographics-grid">
                    
                    <!-- Political Affiliation Chart -->
                    <div class="demo-card">
                        <h4>Group Affiliations (716 defendants)</h4>
                        <div class="chart-container">
                            <div class="chart-bar">
                                <div class="chart-label">Went Alone</div>
                                <div class="chart-bar-fill" style="width: 35%; background: #e53e3e;"></div>
                                <div class="chart-value">35% (251)</div>
                            </div>
                            <div class="info-card-content" style="margin-left: 10px; margin-bottom: 10px;">
                                251 of 716 defendants traveled to Capitol alone
                            </div>
                            <div class="chart-bar">
                                <div class="chart-label">With Family</div>
                                <div class="chart-bar-fill" style="width: 20%; background: #f6ad55;"></div>
                                <div class="chart-value">20%</div>
                            </div>
                            <div class="chart-bar">
                                <div class="chart-label">With Friends</div>
                                <div class="chart-bar-fill" style="width: 45%; background: #48bb78;"></div>
                                <div class="chart-value">45%</div>
                            </div>
                            <div class="info-card-content" style="margin-left
