# DevOps
# WebHook
---------------------------------------
 
 1. Open github settings page (Needs repository admin permission)
     ![alt text](Github.png)
 2. Copy Jenkins URL and Paste in the Payload URL of Github webhook section.
       - Content type - application/json
       - SSL verification - Enable
       - Send me everything.
       - Active
       - Add Webhook
         
 3. Make sure that github webhook plugin is installed in jenkins
    ![alt text](hook.png)
 
 4. Enter the github repository name in github SCM section of jenkins(Source code management).
     ![alt text](JenkinsGithub.png)
 
 5. Enable the github web hook from build triggers
     ![alt text](BuildTriggers.png)   
 
---------------------------------------
