# Bosch AI Talent Accelaraotor Nano Degree
## Project-3: Ensuring Quality Release

[![Build Status](https://dev.azure.com/BoschDevOpsLearning/Project-3/_apis/build/status/toki0709.Project-3-Udacity?branchName=main)](https://dev.azure.com/BoschDevOpsLearning/Project-3/_build/latest?definitionId=6&branchName=main)

### Tools Used
| Tools 	    |  Used for					|
| ----------	| ------------------------:	|
| Terraform		| IaC						|
| Jmeter		| load, Stress Test			|
| Postmann		| API testing				|
| Selenium		| UI testing				|
| Python		| UI test script automation |
| Azure DevOps  | CI/CD pipeline			|
| Azure Logs analytic | Check logs & Alerts |


### Steps
- Create Azure account
- Create a storage account
- Use Azure CLI to get subscription ID, storage account name, key, access key.
- Create service principle with contributor role
	``` az ad sp create-for-rbac --name="Resource-Group-Name" --role="Contributor"  ```
- Create ssh key or use the existing key. 

	```bash 
	ssh-keygen -t rsa 
	```

- By this command you can find the known host which will be required for the azure pipeline. 
	
	```bash 
	ssh-keyscan github.com 
	```

- After completing the above stages, update the following fields in main.tf file.

| parameter| Link |
| ------ | ------ |
| subscription_id | subscription id |
| client_id | service principal client app id |
| client_secret | service principal password |
| tenant_id | service principal tenandt id |
| location | location |
| resource_group | Resource Group |
| application_type | Name of the APP - must be unique |
| virtual_network_name | Name of the VNet |
| packer_image | Packer Image ID  created earlier |
| admin_username | admin username of the VM |
| admin_password | admin password of the VM |
| public_key_path | path of the id_rsa.pub file |

- Login to azure DevOps organization.
- Create a service connection with the GitHub repo which contains the source code from project settings.
- Create a new pipeline.
	- Select you GitHub repository.
	- Select azure pipelines YAML file
	- 
- Create a new environment.
	![image](https://user-images.githubusercontent.com/61994831/192975135-51112f2a-d24c-4537-a663-486e4e1a29e3.png)
- From the environment select the VM created from terraform apply. Log into the VM with 
	```bash 
	ssh username@publicIP 
	```
	paste the registration script 
- From Pipeline you can upload ssh public key, known host key.
	![image](https://user-images.githubusercontent.com/61994831/192975382-a7983e45-e9e6-4471-acf8-b91db86cc0cb.png)

- Run the pipeline.
- Successful pipeline run 
	![image](https://user-images.githubusercontent.com/61994831/192978442-c4672abf-93fe-4bed-ac28-7fa71e3a7392.png)

### Azure Log analytic for monitoring
- In the azure portal go to the app service > Alerts > New Alert Rule. Add an HTTP 404 condition and add a threshold value of 1. This will create an alert if there are two or more consecutive 404 alerts. Click Done. Then create an action group with notification type Email/SMS message/Push/Voice and choose the email option. Set the alert rule name and severity. Wait ten minutes for the alert to take effect. If you then visit the URL of the app service and try to go to a non-existent page more than once it should trigger the email alert. 

- Create a Alert rule for HTTP 404.

	![image](https://user-images.githubusercontent.com/61994831/192983987-625ef247-f11b-49f5-b768-a5fccf4f7fe8.png)

- Create a action group for the alert

	![image](https://user-images.githubusercontent.com/61994831/192984463-01ba259a-44c2-41f5-821b-738a2ae9d21e.png)

- Copy the app service url and https://automate-app-test-azure-project-appservice.azurewebsites.net/gggggg. This will create a 404 error and triger the email.

	![alert-email-1](https://user-images.githubusercontent.com/61994831/192985188-fc98724c-dbf8-4abc-81bd-8975cf46db4d.jpg)

- Set up log analytics workspace properly to get logs:
	Go to Virtual Machines and Connect the VM created on Terraform to the Workspace.

	Set up custom logging , in the log analytics workspace go to. In this case custom log name is **UI_Test_Log_CL**.
	
	Custom Logs > Add + > Choose File. Select the file selenium-test.log > Next >  Put in the following paths as type Linux: /var/log/selenium/selenium-test.log.  
	
	![image](https://user-images.githubusercontent.com/61994831/192987914-7fb1a346-6104-4212-81e4-e3dcf33ad5eb.png)
	
- Go to Log Analytics Workspace , to run the following queries:

	![image](https://user-images.githubusercontent.com/61994831/192988311-e69f4f5c-5608-4dfa-ab6b-c5e63866d190.png)
	
	![image](https://user-images.githubusercontent.com/61994831/192988777-c080415e-c8ac-4f8d-8c28-ff4694f65802.png)


	

