public class ProductController {

	public static ProductFilterService productFilterService = new ProductFilterService(
			new ProductFamilyRepository(),
			new ProductTypeRepository(),
			new CheckboxOptionConverter()
	);

	@AuraEnabled
	public static ProductFilterInfo[] getProductFilters() {
		System.debug('[productFilterService.getFilters()::ProductFilterInfo[]]:watches' +
				JSON.serialize(productFilterService.getFilters()));
		return productFilterService.getFilters();
	}
}