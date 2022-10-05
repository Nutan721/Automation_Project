# Automation_Project

Repository for upGrad DevOps Assignment 1

The project is divided in 3 Tasks.

Task 1: To create IAM role, Security Group , EC2 instance and S3 bucket. EC2 bucket will act as a WebServer with Apache2 installed and ready. S3 bucket is used for storing the WebServer error and access logs.

Task 2: It involves creating a Bash Script in which we install Apache2 for Creating a WebServer. Check and keep the apache2 service running on the WebServer. We also archive the apache2 logs and upload it to the S3 bucket. Script named automation.sh is created for it. It should be placed in /root/Automation_Project/ with. The script is to be given execution permission (chmod +x /root/Automation_Project/automation.sh) and run with root user privileges(sudo su). This is end of Task 2 script. The version at this point is tagged Automation-v0.1

Task 3: This involves in creating a Inventory of logs file and making it visible by inventory.html Also we need to make this automatically run daily by adding it to cron jobs. This is end of Task 3 script. The version at this point is tagged Automation-v0.2
