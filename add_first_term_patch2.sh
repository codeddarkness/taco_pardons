#!/bin/bash
# Script 2 (continued): Complete the HTML update

cat >> trump_pardons_database.html << 'EOF'
: 10px;">
                               Extremist groups: Proud Boys, Oath Keepers, Three Percenters
                           </div>
                       </div>
                   </div>

                   <!-- Employment Status Chart -->
                   <div class="demo-card">
                       <h4>Employment Status (430 verified)</h4>
                       <div class="chart-container">
                           <div class="chart-bar">
                               <div class="chart-label">Business Owners</div>
                               <div class="chart-bar-fill" style="width: 25%; background: #3182ce;"></div>
                               <div class="chart-value">24.7% (106)</div>
                           </div>
                           <div class="chart-bar">
                               <div class="chart-label">Blue Collar</div>
                               <div class="chart-bar-fill" style="width: 17%; background: #48bb78;"></div>
                               <div class="chart-value">17.2% (74)</div>
                           </div>
                           <div class="chart-bar">
                               <div class="chart-label">White Collar</div>
                               <div class="chart-bar-fill" style="width: 9%; background: #805ad5;"></div>
                               <div class="chart-value">8.8% (38)</div>
                           </div>
                           <div class="chart-bar">
                               <div class="chart-label">Unemployed</div>
                               <div class="chart-bar-fill" style="width: 8%; background: #6b7280;"></div>
                               <div class="chart-value">8.1% (35)</div>
                           </div>
                           <div class="info-card-content" style="margin-top: 10px;">
                               Note: Employment data missing for 39.9% (286) of defendants
                           </div>
                       </div>
                   </div>

                   <!-- Financial Problems Chart -->
                   <div class="demo-card">
                       <h4>Financial Hardships (140 of 716)</h4>
                       <div class="chart-container">
                           <div class="chart-bar">
                               <div class="chart-label">Bankruptcies</div>
                               <div class="chart-bar-fill" style="width: 10%; background: #e53e3e;"></div>
                               <div class="chart-value">9.8% (70)</div>
                           </div>
                           <div class="chart-bar">
                               <div class="chart-label">Judgments/Liens</div>
                               <div class="chart-bar-fill" style="width: 16%; background: #f6ad55;"></div>
                               <div class="chart-value">16.3% (117)</div>
                           </div>
                           <div class="chart-bar">
                               <div class="chart-label">Foreclosures</div>
                               <div class="chart-bar-fill" style="width: 15%; background: #ed8936;"></div>
                               <div class="chart-value">15.5% (111)</div>
                           </div>
                           <div class="chart-bar">
                               <div class="chart-label">Any Hardship</div>
                               <div class="chart-bar-fill" style="width: 19%; background: #c53030;"></div>
                               <div class="chart-value">19.6% (140)</div>
                           </div>
                           <div class="info-card-content" style="margin-top: 10px;">
                               42% of financially distressed defendants engaged in violence
                           </div>
                       </div>
                   </div>

                   <!-- Demographics Chart -->
                   <div class="demo-card">
                       <h4>Demographics (716 total)</h4>
                       <div class="chart-container">
                           <div style="margin-bottom: 15px;">
                               <div style="font-weight: 600; margin-bottom: 8px; color: #ffffff;">Gender Distribution</div>
                               <div class="chart-bar">
                                   <div class="chart-label">Men</div>
                                   <div class="chart-bar-fill" style="width: 81%; background: #3182ce;"></div>
                                   <div class="chart-value">81.3% (625)</div>
                               </div>
                               <div class="chart-bar">
                                   <div class="chart-label">Women</div>
                                   <div class="chart-bar-fill" style="width: 13%; background: #805ad5;"></div>
                                   <div class="chart-value">12.7% (91)</div>
                               </div>
                           </div>
                           <div>
                               <div style="font-weight: 600; margin-bottom: 8px; color: #ffffff;">Race/Ethnicity</div>
                               <div class="chart-bar">
                                   <div class="chart-label">White</div>
                                   <div class="chart-bar-fill" style="width: 92%; background: #3182ce;"></div>
                                   <div class="chart-value">92% (659)</div>
                               </div>
                               <div class="chart-bar">
                                   <div class="chart-label">Other</div>
                                   <div class="chart-bar-fill" style="width: 8%; background: #805ad5;"></div>
                                   <div class="chart-value">8% (57)</div>
                               </div>
                               <div class="info-card-content" style="margin-top: 8px;">
                                   Other: Hispanic (39), Black (10), Asian (7), Native American (1)
                               </div>
                           </div>
                       </div>
                   </div>

                   <!-- Geographic Distribution -->
                   <div class="demo-card">
                       <h4>Geographic Distribution</h4>
                       <div class="chart-container">
                           <div class="chart-bar">
                               <div class="chart-label">Florida</div>
                               <div class="chart-bar-fill" style="width: 12%; background: #e53e3e;"></div>
                               <div class="chart-value">11.5% (82)</div>
                           </div>
                           <div class="chart-bar">
                               <div class="chart-label">Pennsylvania</div>
                               <div class="chart-bar-fill" style="width: 9%; background: #f6ad55;"></div>
                               <div class="chart-value">8.9% (64)</div>
                           </div>
                           <div class="chart-bar">
                               <div class="chart-label">Texas</div>
                               <div class="chart-bar-fill" style="width: 8%; background: #3182ce;"></div>
                               <div class="chart-value">8.8% (63)</div>
                           </div>
                           <div class="chart-bar">
                               <div class="chart-label">New York</div>
                               <div class="chart-bar-fill" style="width: 7%; background: #48bb78;"></div>
                               <div class="chart-value">7.4% (53)</div>
                           </div>
                           <div class="chart-bar">
                               <div class="chart-label">California</div>
                               <div class="chart-bar-fill" style="width: 7%; background: #805ad5;"></div>
                               <div class="chart-value">7.3% (52)</div>
                           </div>
                           <div class="info-card-content" style="margin-top: 8px;">
                               47 states represented (missing: North Dakota, Nebraska, Vermont)
                           </div>
                       </div>
                   </div>

                   <!-- Criminal History -->
                   <div class="demo-card">
                       <h4>Criminal History & Violence</h4>
                       <div class="chart-container">
                           <div class="info-card" style="background: rgba(229, 62, 62, 0.2); border-left-color: #e53e3e;">
                               <div class="info-card-title">Prior Criminal Records</div>
                               <div class="info-card-content">22.2% (159 of 716) had criminal history before January 6th</div>
                           </div>
                           <div class="info-card" style="background: rgba(246, 173, 85, 0.2); border-left-color: #f6ad55;">
                               <div class="info-card-title">Armed Defendants</div>
                               <div class="info-card-content">25% came armed to the Capitol on January 6th</div>
                           </div>
                           <div class="info-card" style="background: rgba(49, 130, 206, 0.2); border-left-color: #3182ce;">
                               <div class="info-card-title">Law Enforcement/Military Background</div>
                               <div class="info-card-content">18.5% had law enforcement (28) or military (105) background</div>
                           </div>
                           <div class="info-card" style="background: rgba(72, 187, 120, 0.2); border-left-color: #48bb78;">
                               <div class="info-card-title">Identification Method</div>
                               <div class="info-card-content">72% (517 of 716) identified through tipsters and informants</div>
                           </div>
                       </div>
                   </div>

               </div>

               <!-- Additional detailed characteristics -->
               <div class="demographics-grid">
                   <div class="info-card">
                       <div class="info-card-title">Conviction Success Rate</div>
                       <div class="info-card-content">DOJ achieved 99.4% conviction rate (529 of 532 completed cases). Only 1 acquittal, 2 voluntary dismissals. More defendants died (5) or fled (4) than won in court (3).</div>
                   </div>
                   <div class="info-card">
                       <div class="info-card-title">Tipster Network</div>
                       <div class="info-card-content">72% identified through tips including 40 co-workers, 39 family members, 31 friends, 30 classmates, and 17 other insurrectionists who turned each other in.</div>
                   </div>
                   <div class="info-card">
                       <div class="info-card-title">Educational Attainment</div>
                       <div class="info-card-content">Of 224 with verified education: 82 college degrees, 52 some college, 68 high school diplomas, 20 post-graduate education - consistent with US population.</div>
                   </div>
                   <div class="info-card">
                       <div class="info-card-title">Conspiracy Charges</div>
                       <div class="info-card-content">100% conviction rate for conspiracy charges. Oath Keepers focused on seditious conspiracy, Proud Boys on conspiracy to obstruct election certification.</div>
                   </div>
                   <div class="info-card">
                       <div class="info-card-title">Violence Correlation</div>
                       <div class="info-card-content">42% of financially distressed defendants engaged in violence vs. overall violence rate. Financial hardship was a significant predictor of violent behavior.</div>
                   </div>
                   <div class="info-card">
                       <div class="info-card-title">Nationwide Reach</div>
                       <div class="info-card-content">Defendants from 47 states (only North Dakota, Nebraska, Vermont unrepresented). Top 5 states accounted for 44% of cases, showing broad geographic distribution.</div>
                   </div>
               </div>
               
               <!-- Source Attribution -->
               <div class="source-attribution">
                   <div>
                       <strong>Source:</strong> "The January 6 Insurrectionists: Who They Are and What They Did"<br>
                       Seton Hall University Center for Policy & Research, July 26, 2023<br>
                       Analysis by Professor Mark Denbeaux and research team
                   </div>
               </div>
           </div>
       </div>
   </div>

   <script>
       let pardonsData = [];
       let filteredData = [];
       let firstTermData = [];
       let filteredFirstTermData = [];
       let currentView = 'main';

       // Initialize the application
       async function init() {
           try {
               await loadCSVData();
               await loadFirstTermData();
               renderTable();
               updateStats();
               setupEventListeners();
               document.getElementById('loading').style.display = 'none';
               document.getElementById('tableContainer').style.display = 'block';
               updateResultsInfo();
               setActiveTab('mainTab');
           } catch (error) {
               console.error('Error loading data:', error);
               showError('Failed to load pardon data. Please check that the CSV files are in the same directory.');
           }
       }

       // Load second term CSV data using fetch API
       async function loadCSVData() {
           try {
               const response = await fetch('trump_pardons_csv.txt');
               if (!response.ok) {
                   throw new Error(`HTTP error! status: ${response.status}`);
               }
               const csvContent = await response.text();
               
               const lines = csvContent.trim().split('\n');
               if (lines.length < 2) {
                   throw new Error('CSV file appears to be empty or invalid');
               }
               
               const headers = parseCSVLine(lines[0]);
               console.log('CSV Headers found:', headers);
               
               pardonsData = [];
               
               for (let i = 1; i < lines.length; i++) {
                   const values = parseCSVLine(lines[i]);
                   if (values.length >= headers.length && values[0].trim()) {
                       const record = {};
                       headers.forEach((header, index) => {
                           record[header] = values[index] ? values[index].trim() : '';
                       });
                       
                       const processedRecord = {
                           date: record.Date || '',
                           name: record.Name || '',
                           type: record.Type || '',
                           category: record.Category || '',
                           offense: record.Offense || '',
                           sentence: record.Original_Sentence || '',
                           restitution: parseInt(record.Restitution_Amount) || 0,
                           politicalParty: record.Political_Party || 'Unknown',
                           notes: record.Notes || ''
                       };
                       
                       pardonsData.push(processedRecord);
                   }
               }
               
               filteredData = [...pardonsData];
               console.log(`Successfully loaded ${pardonsData.length} second-term records from CSV`);
               
           } catch (error) {
               console.error('Error reading second-term CSV file:', error);
               throw new Error(`Could not load second-term CSV data: ${error.message}`);
           }
       }

       // Load first term CSV data
       async function loadFirstTermData() {
           try {
               const response = await fetch('trump_pardons_first_term_csv.txt');
               if (!response.ok) {
                   throw new Error(`HTTP error! status: ${response.status}`);
               }
               const csvContent = await response.text();
               
               const lines = csvContent.trim().split('\n');
               if (lines.length < 2) {
                   throw new Error('First-term CSV file appears to be empty or invalid');
               }
               
               const headers = parseCSVLine(lines[0]);
               console.log('First-term CSV Headers found:', headers);
               
               firstTermData = [];
               
               for (let i = 1; i < lines.length; i++) {
                   const values = parseCSVLine(lines[i]);
                   if (values.length >= headers.length && values[0].trim()) {
                       const record = {};
                       headers.forEach((header, index) => {
                           record[header] = values[index] ? values[index].trim() : '';
                       });
                       
                       const processedRecord = {
                           date: record.Date || '',
                           name: record.Name || '',
                           type: record.Type || '',
                           category: record.Category || '',
                           offense: record.Offense || '',
                           sentence: record.Original_Sentence || '',
                           restitution: parseInt(record.Restitution_Amount) || 0,
                           politicalParty: record.Political_Party || 'Unknown',
                           notes: record.Notes || ''
                       };
                       
                       firstTermData.push(processedRecord);
                   }
               }
               
               filteredFirstTermData = [...firstTermData];
               console.log(`Successfully loaded ${firstTermData.length} first-term records from CSV`);
               
           } catch (error) {
               console.error('Error reading first-term CSV file:', error);
               throw new Error(`Could not load first-term CSV data: ${error.message}`);
           }
       }

       // Parse CSV line handling commas within quotes
       function parseCSVLine(line) {
           const result = [];
           let current = '';
           let inQuotes = false;
           
           for (let i = 0; i < line.length; i++) {
               const char = line[i];
               
               if (char === '"') {
                   inQuotes = !inQuotes;
               } else if (char === ',' && !inQuotes) {
                   result.push(current);
                   current = '';
               } else {
                   current += char;
               }
           }
           
           result.push(current);
           return result.map(field => field.replace(/^"|"$/g, ''));
       }

       // Show error message
       function showError(message) {
           const loading = document.getElementById('loading');
           if (loading) {
               loading.innerHTML = `<div class="error">${message}</div>`;
           }
       }

       // Setup event listeners for filters
       function setupEventListeners() {
           // Second term filters
           document.getElementById('search').addEventListener('input', filterData);
           document.getElementById('clemencyType').addEventListener('change', filterData);
           document.getElementById('category').addEventListener('change', filterData);
           document.getElementById('politicalParty').addEventListener('change', filterData);
           document.getElementById('dateRange').addEventListener('change', filterData);
           document.getElementById('restitutionAmount').addEventListener('change', filterData);

           // First term filters
           document.getElementById('firstTermSearch').addEventListener('input', filterFirstTermData);
           document.getElementById('firstTermClemencyType').addEventListener('change', filterFirstTermData);
           document.getElementById('firstTermCategory').addEventListener('change', filterFirstTermData);
           document.getElementById('firstTermPoliticalParty').addEventListener('change', filterFirstTermData);
           document.getElementById('firstTermDateRange').addEventListener('change', filterFirstTermData);
           document.getElementById('firstTermRestitutionAmount').addEventListener('change', filterFirstTermData);
       }

       // Filter data based on current filter values (second term)
       function filterData() {
           const search = document.getElementById('search').value.toLowerCase();
           const clemencyType = document.getElementById('clemencyType').value;
           const category = document.getElementById('category').value;
           const politicalParty = document.getElementById('politicalParty').value;
           const dateRange = document.getElementById('dateRange').value;
           const restitutionAmount = document.getElementById('restitutionAmount').value;

           filteredData = pardonsData.filter(item => {
               if (search && !item.name.toLowerCase().includes(search) && 
                   !item.offense.toLowerCase().includes(search) && 
                   !item.notes.toLowerCase().includes(search)) {
                   return false;
               }

               if (clemencyType && item.type !== clemencyType) {
                   return false;
               }

               if (category && item.category !== category) {
                   return false;
               }

               if (politicalParty && item.politicalParty !== politicalParty) {
                   return false;
               }

               if (dateRange && !item.date.startsWith(dateRange)) {
                   return false;
               }

               if (restitutionAmount) {
                   const restitution = item.restitution;
                   switch (restitutionAmount) {
                       case 'high':
                           if (restitution < 10000000) return false;
                           break;
                       case 'medium':
                           if (restitution < 1000000 || restitution >= 10000000) return false;
                           break;
                       case 'low':
                           if (restitution >= 1000000 || restitution === 0) return false;
                           break;
                       case 'none':
                           if (restitution !== 0) return false;
                           break;
                   }
               }

               return true;
           });

           renderTable();
           updateStats();
           updateResultsInfo();
       }

       // Filter first term data
       function filterFirstTermData() {
           const search = document.getElementById('firstTermSearch').value.toLowerCase();
           const clemencyType = document.getElementById('firstTermClemencyType').value;
           const category = document.getElementById('firstTermCategory').value;
           const politicalParty = document.getElementById('firstTermPoliticalParty').value;
           const dateRange = document.getElementById('firstTermDateRange').value;
           const restitutionAmount = document.getElementById('firstTermRestitutionAmount').value;

           filteredFirstTermData = firstTermData.filter(item => {
               if (search && !item.name.toLowerCase().includes(search) && 
                   !item.offense.toLowerCase().includes(search) && 
                   !item.notes.toLowerCase().includes(search)) {
                   return false;
               }

               if (clemencyType && item.type !== clemencyType) {
                   return false;
               }

               if (category && item.category !== category) {
                   return false;
               }

               if (politicalParty && item.politicalParty !== politicalParty) {
                   return false;
               }

               if (dateRange && !item.date.startsWith(dateRange)) {
                   return false;
               }

               if (restitutionAmount) {
                   const restitution = item.restitution;
                   switch (restitutionAmount) {
                       case 'high':
                           if (restitution < 10000000) return false;
                           break;
                       case 'medium':
                           if (restitution < 1000000 || restitution >= 10000000) return false;
                           break;
                       case 'low':
                           if (restitution >= 1000000 || restitution === 0) return false;
                           break;
                       case 'none':
                           if (restitution !== 0) return false;
                           break;
                   }
               }

               return true;
           });

           renderFirstTermTable();
           updateFirstTermStats();
           updateFirstTermResultsInfo();
       }

       // Render the table with filtered data (second term)
       function renderTable() {
           const tbody = document.getElementById('tableBody');
           tbody.innerHTML = '';

           filteredData.forEach(item => {
               const row = document.createElement('tr');
               row.innerHTML = `
                   <td><span class="date">${formatDate(item.date)}</span></td>
                   <td><strong>${escapeHtml(item.name)}</strong></td>
                   <td><span class="tag ${item.type.toLowerCase()}">${escapeHtml(item.type)}</span></td>
                   <td><span class="tag ${getCategoryClass(item.category)}">${escapeHtml(item.category)}</span></td>
                   <td>${escapeHtml(item.offense)}</td>
                   <td>${escapeHtml(item.sentence)}</td>
                   <td><span class="amount">${formatCurrency(item.restitution)}</span></td>
                   <td><span class="tag ${getPartyClass(item.politicalParty)}">${escapeHtml(item.politicalParty)}</span></td>
                   <td>${escapeHtml(item.notes)}</td>
               `;
               tbody.appendChild(row);
           });
       }

       // Render first term table
       function renderFirstTermTable() {
           const tbody = document.getElementById('firstTermTableBody');
           tbody.innerHTML = '';

           filteredFirstTermData.forEach(item => {
               const row = document.createElement('tr');
               row.innerHTML = `
                   <td><span class="date">${formatDate(item.date)}</span></td>
                   <td><strong>${escapeHtml(item.name)}</strong></td>
                   <td><span class="tag ${item.type.toLowerCase()}">${escapeHtml(item.type)}</span></td>
                   <td><span class="tag ${getCategoryClass(item.category)}">${escapeHtml(item.category)}</span></td>
                   <td>${escapeHtml(item.offense)}</td>
                   <td>${escapeHtml(item.sentence)}</td>
                   <td><span class="amount">${formatCurrency(item.restitution)}</span></td>
                   <td><span class="tag ${getPartyClass(item.politicalParty)}">${escapeHtml(item.politicalParty)}</span></td>
                   <td>${escapeHtml(item.notes)}</td>
               `;
               tbody.appendChild(row);
           });
       }

       // Escape HTML to prevent XSS
       function escapeHtml(text) {
           const map = {
               '&': '&amp;',
               '<': '&lt;',
               '>': '&gt;',
               '"': '&quot;',
               "'": '&#039;'
           };
           return text.replace(/[&<>"']/g, function(m) { return map[m]; });
       }

       // Update statistics (second term)
       function updateStats() {
           const pardons = filteredData.filter(item => item.type === 'Pardon').length;
           const commutations = filteredData.filter(item => item.type === 'Commutation').length;
           const totalRestitution = filteredData.reduce((sum, item) => sum + item.restitution, 0);
           
           document.getElementById('pardonCount').textContent = pardons;
           document.getElementById('commutationCount').textContent = commutations;
           document.getElementById('restitutionTotal').textContent = formatCurrency(totalRestitution);
           document.getElementById('totalCount').textContent = filteredData.length > 1500 ? '1,500+' : filteredData.length;
       }

       // Update first term statistics
       function updateFirstTermStats() {
           const pardons = filteredFirstTermData.filter(item => item.type === 'Pardon').length;
           const commutations = filteredFirstTermData.filter(item => item.type === 'Commutation').length;
           const totalRestitution = filteredFirstTermData.reduce((sum, item) => sum + item.restitution, 0);
           
           document.getElementById('firstTermPardonCount').textContent = pardons;
           document.getElementById('firstTermCommutationCount').textContent = commutations;
           document.getElementById('firstTermRestitutionTotal').textContent = formatCurrency(totalRestitution);
           document.getElementById('firstTermTotalCount').textContent = filteredFirstTermData.length;
       }

       // Update results info (second term)
       function updateResultsInfo() {
           const total = pardonsData.length;
           const filtered = filteredData.length;
           const resultsInfo = document.getElementById('resultsInfo');
           
           if (filtered === total) {
               resultsInfo.textContent = `Showing all ${total} records`;
           } else {
               resultsInfo.textContent = `Showing ${filtered} of ${total} records`;
           }
       }

       // Update first term results info
       function updateFirstTermResultsInfo() {
           const total = firstTermData.length;
           const filtered = filteredFirstTermData.length;
           const resultsInfo = document.getElementById('firstTermResultsInfo');
           
           if (filtered === total) {
               resultsInfo.textContent = `Showing all ${total} records`;
           } else {
               resultsInfo.textContent = `Showing ${filtered} of ${total} records`;
           }
       }

       // Clear all filters (second term)
       function clearAllFilters() {
           document.getElementById('search').value = '';
           document.getElementById('clemencyType').value = '';
           document.getElementById('category').value = '';
           document.getElementById('politicalParty').value = '';
           document.getElementById('dateRange').value = '';
           document.getElementById('restitutionAmount').value = '';
           
           filteredData = [...pardonsData];
           renderTable();
           updateStats();
           updateResultsInfo();
       }

       // Clear first term filters
       function clearFirstTermFilters() {
           document.getElementById('firstTermSearch').value = '';
           document.getElementById('firstTermClemencyType').value = '';
           document.getElementById('firstTermCategory').value = '';
           document.getElementById('firstTermPoliticalParty').value = '';
           document.getElementById('firstTermDateRange').value = '';
           document.getElementById('firstTermRestitutionAmount').value = '';
           
           filteredFirstTermData = [...firstTermData];
           renderFirstTermTable();
           updateFirstTermStats();
           updateFirstTermResultsInfo();
       }

       // Navigation functions
       function showMainView() {
           document.getElementById('mainView').style.display = 'block';
           document.getElementById('firstTermView').style.display = 'none';
           document.getElementById('demographicsView').style.display = 'none';
           currentView = 'main';
           setActiveTab('mainTab');
       }

       function showFirstTermView() {
           document.getElementById('mainView').style.display = 'none';
           document.getElementById('firstTermView').style.display = 'block';
           document.getElementById('demographicsView').style.display = 'none';
           currentView = 'firstterm';
           setActiveTab('firstTermTab');
           
           // Initialize first term view if not already done
           if (document.getElementById('firstTermLoading').style.display !== 'none') {
               renderFirstTermTable();
               updateFirstTermStats();
               updateFirstTermResultsInfo();
               document.getElementById('firstTermLoading').style.display = 'none';
               document.getElementById('firstTermTableContainer').style.display = 'block';
           }
       }

       function showDemographics() {
           document.getElementById('mainView').style.display = 'none';
           document.getElementById('firstTermView').style.display = 'none';
           document.getElementById('demographicsView').style.display = 'block';
           currentView = 'demographics';
           setActiveTab('demographicsTab');
       }

       function setActiveTab(activeTabId) {
           // Remove active class from all tabs
           document.getElementById('mainTab').classList.remove('active');
           document.getElementById('firstTermTab').classList.remove('active');
           document.getElementById('demographicsTab').classList.remove('active');
           
           // Add active class to the selected tab
           document.getElementById(activeTabId).classList.add('active');
       }

       // Utility functions
       function formatDate(dateString) {
           if (!dateString) return 'N/A';
           try {
               const date = new Date(dateString);
               return date.toLocaleDateString('en-US', { 
                   year: 'numeric', 
                   month: 'short', 
                   day: 'numeric' 
               });
           } catch (e) {
               return dateString;
           }
       }

       function formatCurrency(amount) {
           if (
