/**
 * @description       : 
 * @author            : NTPhat
 * @group             : 
 * @last modified on  : 04-01-2025
 * @last modified by  : NTPhat
**/
@IsTest
public class AccountControllerTest {
    @IsTest
    static void getAccountsTest1(){
        
        Test.startTest();
        // System.runAs(contextuser){
        // Create test data
        Account acc = new Account(Name = 'Test Account');
        insert acc;
        
        // Call the method to be tested
        List<Account> accounts = AccountController.getAccounts('Test');
        
        // Verify the results
        System.assertEquals(1, accounts.size(), 'Expected one account to be returned');
        System.assertEquals('Test Account', accounts[0].Name, 'Expected account name to match');
        // }
        Test.stopTest();
        
    }
}