# Environment API

This is a micro-api that will provide you the details of the current environment to your apex code.
Currently it provides the environment name, and whether or not its a sandbox.

This comes in handy when you have environment specific logic. Eg. a different logic for a sandbox
and a different one for Production. Or, maybe differnt URLs from a custom setting based on 
whether you're in a UAT sandbox, or a DEV sandbox. Instead of manually hardcoding environment names
or writing queries, you can use this API.

## Usage

This API currently provides two methods

* name

	This gives you the name of the sandbox. This will give you the sandbox name, if you're in a 
	sandbox. Else, if you are in a Production environment, it will give you 'Production' as the name.
	You can of course, change this name to any other, as per your requirement. See the configuration
	section below for more details.
	
	Example:
	
	```java
	String envName = Environment.name();
	```

* isSandbox

	This gives you a Boolean state, whether or not its a sandbox. 

	```java
	if(Environment.isSandbox()) {
		// execute sandbox-related logic
	}
	else{
		// execute production-related logic
	}
	```



