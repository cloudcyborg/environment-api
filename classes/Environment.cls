public class Environment {

    private static Environment__c env;
    
    static {
        env = Environment__c.getInstance('ENV');
    }
    
    public static String name() {
        return env.Environment_Name__c;
    }
    
    public static Boolean isSandbox() {
        return env.Is_Sandbox__c;
    }
}