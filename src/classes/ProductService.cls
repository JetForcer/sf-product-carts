public class ProductService {

	public static ProductService instance {
		get {
			return new ProductService();
		}
		private set;
	}

	private final ProductRepository productRepository;
	private final ProductCartConverter converter;

	private ProductService() {
		this.productRepository = new ProductRepository();
		this.converter = new ProductCartConverter();
	}

	public ProductCartInfo[] getFilteredProducts() {
		List<Product__c> products = productRepository.getProducts();
		return converter.fromProductEntities(products);
	}
}