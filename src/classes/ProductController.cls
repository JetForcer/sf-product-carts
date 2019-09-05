public class ProductController {

	public static ProductService productsService;
	public static ProductCheckboxOptionService checkboxOptionService;

	static {
		productsService = ProductService.instance;
		checkboxOptionService = ProductCheckboxOptionService.instance;
	}

	@AuraEnabled
	public static ProductDto[] getFilteredProducts(Id opportunityId,
												   String textToSearch,
												   String[] selectedFamilies) {

		System.debug('[opportunityId::Id]:watches' + JSON.serialize(opportunityId));
		System.debug('[textToSearch::String]:watches' + JSON.serialize(textToSearch));
		System.debug('[familiesFilters::List<String>]:watches' + JSON.serialize(selectedFamilies));

		return productsService.getFilteredProducts(opportunityId, textToSearch, selectedFamilies);
	}

	@AuraEnabled
	public static CheckboxOption[] getFamiliesOptions(Id opportunityId) {
		return checkboxOptionService.getFamiliesOptions(opportunityId);
	}
}