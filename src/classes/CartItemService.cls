public class CartItemService {

	private final CartItemRepository cartItemRepository = new CartItemRepository();

	public void addCartItem(Id opportunityId, Id productId) {
		cartItemRepository.create(opportunityId, productId);
	}
}