public class Product2Repository {

	public List<Product2> findAllByIds(List<String> ids) {
		return [
				select Id,
						Name,
						Description,
						Family,
						IconLink__c,
						CurrencyIsoCode
				from Product2
				where Id in :ids
		];
	}

	public Product2 findById(Id id) {
		return [
				select Id,
						Name,
						Description,
						Family,
						CurrencyIsoCode,
						IsActive,
						ProductCode
				from Product2
				where Id = :id
		];
	}
}