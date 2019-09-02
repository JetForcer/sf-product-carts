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

	public ProductCartInfo[] getFilteredProducts(String textToSearch, List<String> selectedFilters) {
		Map<String, List<String>> valuesByFilter = buildValuesByFilter(selectedFilters);

		List<String> familiesNames = valuesByFilter.get(ProductFilter.FAMILY.name);
		List<String> typesNames = valuesByFilter.get(ProductFilter.PRODUCT_TYPE.name);

		List<Product__c> products = productRepository.getProductsWhere(
				textToSearch, familiesNames, typesNames
		);

		return converter.fromProductEntities(products);
	}

	private Map<String, List<String>> buildValuesByFilter(List<String> selected) {
		Map<String, List<String>> result = new Map<String, List<String>>();

		System.debug('[selected::List<String>]:watches' + JSON.serialize(selected));
		for (String next : selected) {
			CheckboxOption option = CheckboxOption.fromValue(next);
			getOrDefault(result, option.filter.name, new List<String>())
					.add(option.label);
		}

		return result;
	}

	private List<String> getOrDefault(Map<String, List<String>> m, String key, List<String> def) {
		List<String> value = m.get(key);
		if (value == null) {
			m.put(key, def);
			value = def;
		}
		return value;
	}
}