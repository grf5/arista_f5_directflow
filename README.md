# arista_f5_directflow
Direct Flow integration with F5 BIG-IP's AFM module

# Setup Instructions

 1. Provision LTM, AFM and ILX on your BIG-IP.
 2. Create an iRulesLX workspace titled "arista_directflow_create" or something similar.
 3. Create the iRule in the workspace by copying the contents of the .tcl script and saving.
 4. Create an extension titled "arista_directflow_create".
 
