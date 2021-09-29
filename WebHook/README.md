# DevOps
# WebHook
---------------------------------------
 1. Prerequisite
    - Create a github repo on which you want to create a webhook
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
    
    - Installation steps if not installed already (Refer details on jenkins installation and configuration)
      - Click on Managed Jenkins
      - Click on Manage Plugins
      - Click on Available plugins tab
      - Search for "webhook"
      - Click on Generic Webhook Trigger Plugin and install``
      
 5. Create a jenkins pipeline
     Click on the new item from the jenkins Dashboard
        ![alt text](../images/Manage.png)
 6.  Enter a name of pipeline and Create a jenkins freestyle project    
        ![alt text](FreeStyleProject.png)  
 7. Select the Github project and enter the repository URL
        ![alt text](WebHookJenkinsURL.png)
 8. Enter the github repository name in github SCM section of jenkins(Source code management).
        ![alt text](JenkinsGithub.png)
 9. Leave branch to build as empty and enter credentials if required.
        ![alt text](JenkinsBranchToBuild.png) 
 10. Enable the github web hook from build triggers
        ![alt text](BuildTriggers.png)
 11. Select execute shell as build steps.      
        ![alt text](JenkinsBuildSteps.png) 
 12. Enter any command in build steps
        ![alt text](BuildSteps.png)
 13. Pipeline is ready, you can test the pipeline with a sample commit.       
         ![alt text](BuildPipelineReady.png)
 14. Check logs of github payload delivery
         ![alt text](PayloadDelivery.png)
 15. Check the status and console output log.
         ![alt text](BuilDStatus.png)
         ![alt text](ConsoleLog.png)       
---------------------------------------
