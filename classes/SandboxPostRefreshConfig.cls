//If you already have a post refresh config class, then copy the methods here into that class. 
global class SandboxPostRefreshConfig implements SandboxPostCopy {
    
    global void runApexClass(SandboxContext sc) {
        populateEnvironmentSettings(sc);
    }
    
    private void populateEnvironmentSettings(SandboxContext sc) {
        Environment__c env = new Environment__c();
        env.Name = 'ENV';
        env.Is_Sandbox__c = true;
        env.Environment_Name__c = sc.sandboxName();
        insert env;
    }
    
}