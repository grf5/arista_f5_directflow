# arista_f5_directflow
Direct Flow integration with F5 BIG-IP's AFM module

# Setup Instructions

 1. Provision LTM, AFM and ILX on your BIG-IP.
 2. Create an iRulesLX workspace titled "arista_directflow_create".
 3. Create the iRule in the workspace by copying the contents of the .tcl script and saving.
 4. Create an extension titled "arista_directflow_create".
 5. Copy the contents of index.js to the newly created index.js file, overwriting all existing contents. Save.
 6. Create a new extension file titled "directflow.js" and paste the contents from this repo. **There are multiple versions as the Arista EOS versions have significant syntax change.** Save.
 7. On the BIG-IP: 'cd /var/ilx/workspaces/Common/arista_directflow_create/extensions/arista_directflow_create/'
 8. On the BIG-IP: 'npm install node-json-rpc2'
 9. **MOST IMPORTANT: review the files and update IP addresses, ports and user credentials as necessary.**
10. Create the LX plug-in called "arista_directflow_create" and assign the new workspace. Save.
11. Assign your iRule to AFM rule(s).

See examples in the **arista** folder.
