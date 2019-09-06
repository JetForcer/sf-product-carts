public class CartItemService {

	private final CartItemRepository cartItemRepository = new CartItemRepository();

	public void addCartItem(Id opportunityId, Id productId) {
		cartItemRepository.create(opportunityId, productId);
	}

	public ProductCartItem__c[] getCartItemsByOpportunityId(Id opportunityId) {
		return cartItemRepository.finAllBy(opportunityId);
	}

	public void removeCartItemById(Id product2Id, Id opportunityId) {
		ProductCartItem__c found = cartItemRepository.finOneByProductIdAndOpportunityId(product2Id, opportunityId);
		delete found;
	}
}