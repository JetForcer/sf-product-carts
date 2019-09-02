public class ProductController {

	public static ProductFilterService filterService;
	public static ProductService productsService;

	static {
		filterService = ProductFilterService.instance;
		productsService = ProductService.instance;
	}

	@AuraEnabled
	public static ProductFilterInfo[] getProductFilters() {
		return filterService.getFilters();
	}

	@AuraEnabled
	public static ProductCartInfo[] getFilteredProducts(String textToSearch, String[] selectedFilters) {
		System.debug('[textToSearch::String]:watches' + JSON.serialize(textToSearch));
		System.debug('[selectedFilters::List<String>]:watches' + JSON.serialize(selectedFilters));
		return productsService.getFilteredProducts(textToSearch, selectedFilters);
	}
}