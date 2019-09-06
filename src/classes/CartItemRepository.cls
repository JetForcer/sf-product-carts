public class CartItemRepository {

	public void create(Id opportunityId, Id product2Id) {
		ProductCartItem__c cartItem = new ProductCartItem__c(
				Opportunity__c = opportunityId,
				Product__c = product2Id
		);

		// TODO : I guess that we have a better way to prevent duplicates, but this used as a quick workaround
		List<ProductCartItem__c> duplicates = [
				select Id
				from ProductCartItem__c
				where Opportunity__c = :opportunityId
				and Product__c = :product2Id
		];

		if (Util.notEmpty(duplicates)) {
			System.debug(LoggingLevel.ERROR,
							'Prevent attempting to add Cart Item duplication: ' +
							'Opportunity ID = ' + opportunityId + ' Product2 ID = ' + product2Id);
			return;
		}

		insert cartItem;
	}

	public List<ProductCartItem__c> finAllBy(Id opportunityId) {
		return [
				select Id,
						Opportunity__c,
						Product__c
				from ProductCartItem__c
				where Opportunity__c = :opportunityId
		];
	}
}