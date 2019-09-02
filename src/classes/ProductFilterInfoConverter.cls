public class ProductFilterInfoConverter {

	public ProductFilterInfo fromTypeAndValues(ProductFilter filterType, String[] values) {
		CheckboxOption[] options = new List<CheckboxOption>();
		for (String next : values) {
			options.add(new CheckboxOption(filterType, next));
		}

		return new ProductFilterInfo(filterType.name, options);
	}
}