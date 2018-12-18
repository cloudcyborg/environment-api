@isTest
public class Environment_Test {

    @testSetup
    static void setupTestData() {
        createEnvironmentSetting();
    }
    
    
    @isTest
    static void testEnvironmentClass() {
        
        Test.startTest();
        System.assertEquals(Environment.name(), 'Test');
        System.assertEquals(Environment.isSandbox(), true);
        Test.stopTest();
    }
	
	//Put this method in your test data factory class
	public static void createEnvironmentSetting() {
        Environment__c env = new Environment__c();
        env.Name = 'ENV';
        env.Environment_Name__c = 'Test';
        env.Is_Sandbox__c = true;
        insert env;
    }
    
}