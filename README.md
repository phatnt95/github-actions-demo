# Salesforce CICD pipelines sample.
## Continuous Integration (CI) is not a tool. It is a practice.<br />
- It is a practice for integrating the work of all developers into a common codebase.<br />
- It involves running tests automatically when code is changed.<br />
- It also involves detecting broken build & tests in few seconds to keep process flowing.<br />
## Continuous Delivery (CD) is not a tool. It is a practice.<br />
- It involves propagating changes from DEV to PROD.<br />
- It also involves propagating changes from PROD to DEV to keep orgs in sync.<br /><br />

## Step 1: Certificates and Key (reference)
In your terminal/command prompt, type the following command. This creates the private key named ‘server.key’ <br />
**`openssl genpkey -algorithm RSA -pkeyopt rsa_keygen_bits:2048 -out server.key`** <br />
Next, type the following command in terminal/command prompt to generate the ‘server.csr’ file. <br />
**`openssl req -new -key server.key -out server.csr`** <br />
Now, type the following command in terminal/command prompt for generate the ‘server.crt’ certificate. <br />
**`openssl x509 -req -sha256 -days 365 -in server.csr -signkey server.key -out server.crt`** <br /><br />

## Step 2: Connected App Setup in Salesforce for Devops Process**
In this step, we will create a new connected app for DevOps process to authorize using the certificate that we created earlier. <br /><br />

1. Login in to Salesforce Developer Org
2. Navigate to Setup -> Apps -> App Manager
3. Create a new Connected App with the following details and save it.
- Connected App Name = “DevOps App”
- Contact Email = specify your personal email address
- Enable OAuth Settings = tick mark it to checked state
- Callback URL = http://localhost:1717/OauthRedirect
- Use digital signatures = tick mark it to checked state
Browse and select the server.crt file from your local machine
- Selected OAuth scopes
Access and manage your data (api)
Access your basic information (id, profile, email, address, phone)
Perform requests on your behalf at any time (refresh_token, offline_access)
Provide access to your data via the Web (web)
- Require Secret for Web Server Flow = tick mark it to checked state
4. Click the “Manage” button the connected app, set the following and save.
5. Permitted Users = Admin approved users are pre-authorized
After saving the permitted users, scroll down to “Profiles” related list and click the “Manage Profiles” button. Add the “System Administrator” profile or equivalent profile that your DevOps user is setup with.

Testing <br />
**`sfdx force:auth:jwt:grant --clientid <CONNECTED_APP_CONSUMER_KEY> --jwtkeyfile server.key --username xxx@xxx.com --instanceurl https://login.salesforce.com`**
