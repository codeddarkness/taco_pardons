#!/bin/bash
# Script 2 (final continuation): Complete the JavaScript and close the HTML

cat >> trump_pardons_database.html << 'EOF'
amount === 0) return 'None';
           if (amount >= 1000000000) return `$${(amount / 1000000000).toFixed(1)}B`;
           if (amount >= 1000000) return `$${(amount / 1000000).toFixed(1)}M`;
           if (amount >= 1000) return `$${(amount / 1000).toFixed(0)}K`;
           return `$${amount.toLocaleString()}`;
       }

       function getCategoryClass(category) {
           const classMap = {
               'January 6': 'jan6',
               'Political': 'political',
               'Business': 'business',
               'Drug': 'drug',
               'Corruption': 'corruption',
               'Celebrity': 'celebrity',
               'Anti-Abortion': 'anti-abortion',
               'Law Enforcement': 'law-enforcement',
               'Military': 'law-enforcement',
               'Historical': 'business',
               'Other': 'business'
           };
           return classMap[category] || 'business';
       }

       function getPartyClass(party) {
           const classMap = {
               'Republican': 'corruption',
               'Democrat': 'political',
               'Unknown': 'business'
           };
           return classMap[party] || 'business';
       }

       // Initialize the application when the page loads
       document.addEventListener('DOMContentLoaded', init);
   </script>
</body>
</html>
EOF

echo "HTML file updated with first-term pardons subpage"
