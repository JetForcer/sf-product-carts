public class ProductCartConverter {

	public List<ProductCartInfo> fromProductEntities(List<Product__c> products) {
		List<ProductCartInfo> result = new List<ProductCartInfo>();
		for (Product__c next : products) {
			ProductCartInfo cartInfo = new ProductCartInfo(next.Name);
			cartInfo.iconLink = next.IconLink__c;
			cartInfo.description = next.Description__c;
			cartInfo.productLink = next.ProductLink__c;
			result.add(cartInfo);
		}
		return result;
	}
}