public class ProductTypeRepository {

	public List<ProductType__c> getProductTypes() {
		return [
				select Id,
						Name
				from ProductType__c
		];
	}

	public List<String> getTypesNames() {
		List<String> result = new List<String>();
		for (ProductType__c next : getProductTypes()) {
			result.add(next.Name);
		}
		return result;
	}
}