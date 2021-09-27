# DevOps
# WebHook
---------------------------------------
 1. Prerequisite
    - Create a github repo on which you want to create a webhook. Or any exiting repository will be sufficient.
    - Jenkins must be installed and configured
    - Jenkins UI is accessible.
    - Github repository admin permission.
    - Create any pipeline(scripted or declarative)
 
 2. Open github settings page (Needs repository admin permission)
     ![alt text](Github.png)
 3. Copy Jenkins URL and Paste in the Payload URL of Github webhook section.
       - Content type - application/json
       - SSL verification - Enable
       - Send me everything.
       - Active
       - Add Webhook
         
 4. Make sure that github webhook plugin is installed in jenkins
    ![alt text](hook.png)
    
    Installation steps (Refer details on jenkins installation and configuration)
      - Click on Managed Jenkins
      - Click on Manage Plugins
      - Click on Available plugins tab
      - Search for "webhook"
      - Click on Generic Webhook Trigger Plugin and install``
      
 5. Enter the github repository name in github SCM section of jenkins(Source code management).
     ![alt text](JenkinsGithub.png)
 
 6. Enable the github web hook from build triggers
     ![alt text](BuildTriggers.png)   
 
---------------------------------------
