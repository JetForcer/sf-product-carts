public class ProductFamilyRepository {

	public List<ProductFamily__c> getProductFamilies() {
		return [
				select Id,
						Name
				from ProductFamily__c
		];
	}

	public List<String> getFamiliesNames() {
		List<String> result = new List<String>();
		for (ProductFamily__c next : getProductFamilies()) {
			result.add(next.Name);
		}
		return result;
	}
}