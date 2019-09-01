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
	public static ProductCartInfo[] getFilteredProducts() {
		return productsService.getFilteredProducts();
	}
}