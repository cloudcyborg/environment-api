@isTest
public class SandboxPostRefreshConfig_Test {

    @isTest
    static void testPopulateEnv() {
        
        Test.startTest();
		// If you already have a 'sandbox post refresh config' class, then replace the 'SandboxPostRefreshConfig'
		// with that class name
        Test.testSandboxPostCopyScript(new SandboxPostRefreshConfig(), UserInfo.getOrganizationId(), 
            UserInfo.getOrganizationId(), UserInfo.getOrganizationName());
        Test.stopTest();
    }
}