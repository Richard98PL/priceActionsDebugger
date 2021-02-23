delete [SELECT ID,NAME,sbqq__formula__c FROM SBQQ__PRICEaCTION__C where createdDate = today and Name != '487' order by createdDate desc];

List<SBQQ__PriceRule__c> priceRules = [select id,Name from sbqq__priceRule__c];

List<SBQQ__PriceAction__c> actions = new List<SBQQ__PriceAction__c>();

for(SBQQ__PriceRule__c x : priceRules){
    SBQQ__PriceAction__c y = new SBQQ__PriceAction__c();
    y.SBQQ__Rule__c = x.Id;
    y.SBQQ__TargetObject__c = 'Quote Line';
    y.SBQQ__Field__c = 'Debugger__c';
    y.SBQQ__Formula__c = 'Debugger__c & ' + '\'\\r\\n  \' & \'' + x.Name + '\'' ;
    actions.add(y);
}
insert actions;
