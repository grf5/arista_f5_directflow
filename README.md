# arista_f5_directflow
Direct Flow integration with F5 BIG-IP's AFM module

# Setup Instructions

 1. Provision LTM, AFM and ILX on your BIG-IP.
 2. Create an iRulesLX workspace titled "arista_directflow_create".
 3. Create the iRule in the workspace by copying the contents of the .tcl script and saving.
 4. Create an extension titled "arista_directflow_create".
 5. Copy the contents of index.js to the newly created index.js file, overwriting all existing contents. Save.
 6. Create a new extension file titled "directflow.js" and paste the contents from this repo. Save.
 7. '/var/ilx/workspaces/Common/arista_directflow_create/extensions/arista_directflow_create/'
 8. 'npm install node-json-rpc2'
 9. **MOST IMPORTANT: review the files and update IP addresses, ports and user credentials as necessary.**
 10. Assign your iRule to AFM rule(s).
