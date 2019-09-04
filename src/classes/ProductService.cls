public class ProductService {

	public static ProductService instance {
		get {
			return new ProductService();
		}
		private set;
	}

	public ProductDto[] getFilteredProducts(Id opportunityId,
											String textToSearch,
											List<String> familiesOptions) {

		Opportunity found = [
				select Id,
						Name,
						(select PricebookEntry.Name,
								 PricebookEntry.Product2.Family
						from OpportunityLineItems)
				from Opportunity
				where Id = :opportunityId
		];

		System.debug('[opportunities::Opportunity]:watches' + JSON.serialize(found));

		List<ProductDto> result = new List<ProductDto>();
		for (OpportunityLineItem next : found.OpportunityLineItems) {
			result.add(new ProductDto(
					next.PricebookEntry.Name
			));
		}

		return result;
	}
}