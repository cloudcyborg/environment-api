# Environment API

This is a micro-api that will provide you the details of the current environment to your apex code.
Currently it provides the environment name, and whether or not its a sandbox.

This comes in handy when you have environment specific logic. Eg. a different logic for a sandbox
and a different one for Production. Or, maybe differnt URLs from a custom setting based on 
whether you're in a UAT sandbox, or a DEV sandbox. Instead of manually hardcoding environment names
or writing queries, you can use this API.

## Usage

This API currently provides two methods

* name()

	This gives you the name of the Environment. This will give you the sandbox name, if you're in a 
	sandbox. Else, if you are in a Production environment, it will give you *Production* as the name.
	You can of course, change this name to any other, as per your requirement. See the configuration
	section below for more details.
	
	Example:
	
	```java
	String envName = Environment.name();
	```

* isSandbox()

	This gives you a Boolean state, whether or not its a sandbox. 

	```java
	if(Environment.isSandbox()) {
		// execute sandbox-related logic
	}
	else{
		// execute production-related logic
	}
	```
	
## Configuration before Usage

On the backend, this package consists of a Custom Setting called Environment__c which will store the
environment releted details. This needs to be populated with just a single record for an environment.

### Configuration in Production Environment

For a Production environment, this record needs to be populated manually. Or you can use this script 
below.

```java
Environment__c env = new Environment__c();
env.Name = 'ENV';
// Change this name if you want. 
env.Environment_Name__c = 'Production';
env.is_Sandbox__c = false;

insert env;

List<Environment__c> envList = [SELECT Name 
                                FROM Environment__c];

// Verify data inserted correctly
System.assertEquals(envList.size(), 1);
System.assertEquals(Environment.name(), 'Production');
System.assertEquals(Environment.isSandbox(), false);

```

Run this script from the Developer Console or any tool you prefer to use. 

### Configuration in existing Sandbox environment

For doing the same in a sandbox environment, you can run the above script in that environment as well, 
provided you need to make changes in the script's data to suit the environment. 

The name needs to store the *sandbox name*, and the isSandbox should return *true*. Make the changes
in the script accordingly, and run it in the sandbox's developer console. 

### Configuring this while creating or refreshing a sandbox

This package includes a class called **SandboxPostRefreshConfig** which implements the **SandboxPostCopy**
interface.

During sandbox creation/refresh, salesforce asks you if you want to execute any class after the operation. 
Enter this class name at this time.

[Image]

The code will automatically set up the data for you. 
You'll need to make sure this is documented as a step in your Sandbox refresh steps.

> NOTE: If you already have a post sandbox refresh class, then copy this code into that class. 











