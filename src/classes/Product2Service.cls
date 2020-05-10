public class Product2Service {

    public PricebookEntryRepository pricebookEntryRepository = new PricebookEntryRepository();
    public Product2Repository product2Repository = new Product2Repository();
    public CartItemRepository cartItemRepository = new CartItemRepository();

    public Product2 getById(Id id) {
        return product2Repository.findById(id);
    }

    public Product2[] getProductsByCartItems(ProductCartItem__c[] items) {
        List<String> productIds = new List<String>();
        for (ProductCartItem__c next : items) {
            productIds.add(next.Product__c);
        }

        return product2Repository.findAllByIds(productIds);
    }

    public Product2[] getFilteredProducts(Id opportunityId,
                                          String description,
                                          Set<String> familiesOptions) {

        List<Product2> result = new List<Product2>();
        List<ProductCartItem__c> alreadyRegistered = cartItemRepository.finAllBy(opportunityId);

        for (Product2 next : findByOpportunityId(opportunityId)) {
            if (isDescriptionMatched(next, description) &&
                    isFamiliesMatched(next, familiesOptions) &&
                    !isAlreadyInCart(alreadyRegistered, next.Id)
            ) {

                result.add(next);
            }
        }

        return result;
    }

    public List<Product2> findByOpportunityId(Id opportunityId) {
        List<PricebookEntry> relatedEntries = pricebookEntryRepository.findByOpportunityId(opportunityId);

        List<String> relatedProductIds = new List<String>();
        for (PricebookEntry next : relatedEntries) {
            relatedProductIds.add(next.Product2Id);
        }

        return product2Repository.findAllByIds(relatedProductIds);
    }

    private Boolean isFamiliesMatched(Product2 prod, Set<String> families) {
        return families == null || families.isEmpty() ||
                families.contains(prod.Family);
    }

    private Boolean isDescriptionMatched(Product2 prod, String description) {
        return Util.isEmpty(description) ||
                (Util.notEmpty(prod.Description) && prod.Description.contains(description));
    }

    private Boolean isAlreadyInCart(List<ProductCartItem__c> items, Id productId) {
        for (ProductCartItem__c next : items) {
            if (next.Product__c.equals(productId)) {
                return true;
            }
        }
        return false;
    }
}