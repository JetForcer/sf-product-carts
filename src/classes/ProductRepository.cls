public class ProductRepository {

	public List<Product__c> getProductsWhere(String descriptionPattern,
											 List<String> familiesNames,
											 List<String> typesNames) {

		String queryBuilder =
				'select Id,' +
				' Name,' +
				' Price__c,' +
				' Description__c,' +
				' IconLink__c,' +
				' ProductLink__c,' +
				' ProductFamily__r.Name,' +
				' ProductType__r.Name ' +
				'from Product__c';

		List<String> whereClauses = new List<String>();
		if (Util.notEmpty(descriptionPattern)) {
			// prevent SOQL injections
			String normalized = String.escapeSingleQuotes(descriptionPattern);
			whereClauses.add('Description__c like \'%' + normalized + '%\'');
		}

		if (Util.notEmpty(familiesNames)) {
			whereClauses.add('ProductFamily__r.Name in :familiesNames');
		}

		if (Util.notEmpty(typesNames)) {
			whereClauses.add('ProductType__r.Name in : typesNames');
		}

		if (!whereClauses.isEmpty()) {
			queryBuilder = queryBuilder + ' where ' + String.join(whereClauses, ' and ');
		}

		System.debug('[queryBuilder::String]:watches' + JSON.serialize(queryBuilder));
		return Database.query(queryBuilder);
	}
}