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
								 PricebookEntry.Product2.Family,
								 PricebookEntry.Product2.Description
						from OpportunityLineItems)
				from Opportunity
				where Id = :opportunityId
		];

		System.debug('[opportunities::Opportunity]:watches' + JSON.serialize(found));

		List<ProductDto> result = new List<ProductDto>();
		for (OpportunityLineItem next : found.OpportunityLineItems) {
			ProductDto dto = new ProductDto(next.PricebookEntry.Name);
			dto.description = next.PricebookEntry.Product2.Description;
			result.add(dto);
		}

		return result;
	}
}