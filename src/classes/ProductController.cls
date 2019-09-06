/*
 * New UI should provide ability to assign new products to the opportunity
 * in other words our Cart should provide ability to create OpportunityLineItem's
 * <p/>
 * https://www.insightsquared.com/2013/09/why-you-need-product-line-items-in-salesforce/
 * https://www.forcetalks.com/salesforce-topic/relation-between-opportunitylineitem-pricebook-entry/
 */
public class ProductController {

	public static Product2Service productsService = new Product2Service();
	public static CheckboxOptionService checkboxOptionService = new CheckboxOptionService();
	public static ProductDtoConverter converter = new ProductDtoConverter();
	public static CartItemService cartService = new CartItemService();

	@AuraEnabled
	public static ProductDto[] getFilteredProducts(Id opportunityId,
												   String textToSearch,
												   String[] selectedFamilies) {

		System.debug('[opportunityId::Id]:watches' + JSON.serialize(opportunityId));
		System.debug('[textToSearch::String]:watches' + JSON.serialize(textToSearch));
		System.debug('[familiesFilters::List<String>]:watches' + JSON.serialize(selectedFamilies));

		Set<String> familiesSet = Util.isEmpty(selectedFamilies) ? null : new Set<String>(selectedFamilies);
		Product2[] filtered = productsService.getFilteredProducts(
				opportunityId, textToSearch, familiesSet
		);

		return converter.fromEntities(filtered);
	}

	@AuraEnabled
	public static CheckboxOption[] getFamiliesOptions(Id opportunityId) {
		return checkboxOptionService.getFamiliesOptions(opportunityId);
	}

	@AuraEnabled
	public static void createCartItem(Id opportunityId, Id product2Id) {
		cartService.addCartItem(opportunityId, product2Id);
	}
}