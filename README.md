# Environment API

This is a micro-api that will provide you the details of the current environment to your apex code.
Currently it provides only the environment name (sandbox name, in case of sandbox, and **_Production_**,
if its a production environment), and whether or not its a sandbox.

This comes in handy when you have environment specific logic. Eg. a different logic for a sandbox
and a different one for Production. 


