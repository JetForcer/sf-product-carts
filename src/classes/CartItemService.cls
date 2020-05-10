public class CartItemService {

    private final CartItemRepository cartItemRepository = new CartItemRepository();
    private final PricebookEntryRepository pricebookEntryRepository = new PricebookEntryRepository();

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

    public void checkoutCartItems(Id opportunityId, CartItemDto[] cartItems) {
        if (opportunityId == null) {
            throw new UnsupportedOperationException('Opportunity Id must not be null');
        }

        List<PricebookEntry> opportunityEntries = pricebookEntryRepository.findByOpportunityId(opportunityId);

        List<OpportunityLineItem> opportunityLineItems = new List<OpportunityLineItem >();
        for (PriceBookEntry priceBookEntry : opportunityEntries) {

            if (isInCart(priceBookEntry, cartItems)) {
                opportunityLineItems.add(new OpportunityLineItem(
                        UnitPrice = priceBookEntry.UnitPrice,
                        Quantity = 1,
                        OpportunityId = opportunityId,
                        PriceBookEntryId = priceBookEntry.Id
                ));
            }
        }

        insert opportunityLineItems;

        removeCartItems(opportunityId, cartItems);
    }

    private void removeCartItems(Id opportunityId, CartItemDto[] dtos) {
        List<String> product2Ids = new List<String>();
        for (CartItemDto next : dtos) {
            product2Ids.add(next.product2Id);
        }

        List<ProductCartItem__c> items = cartItemRepository.finAllBy(opportunityId, product2Ids);

        delete items;
    }

    private Boolean isInCart(PricebookEntry pricebookEntry, CartItemDto[] cartItems) {
        for (CartItemDto next : cartItems) {
            if (priceBookEntry.Product2Id == next.product2Id) {
                return true;
            }
        }
        return false;
    }
}