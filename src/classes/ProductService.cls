public class ProductService {

	public static ProductService instance {
		get {
			return new ProductService(
					new OpportunityLineItemRepository()
			);
		}
		private set;
	}

	private final OpportunityLineItemRepository opportunityLineItemRepository;

	public ProductService(OpportunityLineItemRepository opportunityLineItemRepository) {
		this.opportunityLineItemRepository = opportunityLineItemRepository;
	}

	public ProductDto[] getFilteredProducts(Id opportunityId,
											String textToSearch,
											List<String> familiesOptions) {

		OpportunityLineItem[] found =
				opportunityLineItemRepository.findAllBy(opportunityId, textToSearch, familiesOptions);

		List<ProductDto> result = new List<ProductDto>();
		for (OpportunityLineItem next : found) {
			ProductDto dto = new ProductDto(next.PricebookEntry.Name);
			dto.description = next.PricebookEntry.Product2.Description;
			result.add(dto);
		}

		return result;
	}
}