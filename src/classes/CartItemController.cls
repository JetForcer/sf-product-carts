public class CartItemController {

	public static CartItemService cartItemService = new CartItemService();
	public static Product2Service product2Service = new Product2Service();
	public static CartItemDtoConverter converter = new CartItemDtoConverter();

	@AuraEnabled
	public static CartItemDto[] getCartItemsByOpportunityId(Id opportunityId) {
		ProductCartItem__c[] items = cartItemService.getCartItemsByOpportunityId(opportunityId);
		Product2[] products = product2Service.getProductsByCartItems(items);
		return converter.fromProducts(products);
	}

	@AuraEnabled
	public static void removeCartItem(Id product2Id, Id opportunityId) {
		cartItemService.removeCartItemById(product2Id, opportunityId);
	}

	@AuraEnabled
	public static void checkoutCartItems(Id opportunityId, CartItemDto[] cartItems) {
		System.debug('[cartItems::CartItemDto[]]:watches' + JSON.serialize(cartItems));
		System.debug('[opportunityId::Id]:watches' + JSON.serialize(opportunityId));
		cartItemService.checkoutCartItems(opportunityId, cartItems);
	}
}