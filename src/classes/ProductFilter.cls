public class ProductFilter {

	public static final ProductFilter FAMILY = new ProductFilter('Family');
	public static final ProductFilter PRODUCT_TYPE = new ProductFilter('Product Type');

	public String name {
		get; private set;
	}

	private ProductFilter(String name) {
		this.name = name;
	}

	public static ProductFilter fromName(String name) {
		if (FAMILY.name.equals(name)) {
			return FAMILY;
		} else if (PRODUCT_TYPE.name.equals(name)) {
			return PRODUCT_TYPE;
		} else {
			throw new UnsupportedOperationException('Unsupported Filter: ' + name);
		}
	}
}