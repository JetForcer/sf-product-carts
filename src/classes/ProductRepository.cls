public class ProductRepository {

	public List<Product__c> getProducts() {
		return [
				select Id,
						Name,
						Price__c,
						Description__c,
						IconLink__c,
						ProductLink__c,
						ProductFamily__r.Name,
						ProductType__r.Name
				from Product__c
		];
	}
}