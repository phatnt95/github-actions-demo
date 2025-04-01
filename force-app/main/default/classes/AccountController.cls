/**
 * @description       : 
 * @author            : NTPhat
 * @group             : 
 * @last modified on  : 04-01-2025
 * @last modified by  : NTPhat
**/
public with sharing class AccountController {
    public static List<Account> getAccounts() {
        return [SELECT Id, Name FROM Account WITH SECURITY_ENFORCED LIMIT 10];
    }
}