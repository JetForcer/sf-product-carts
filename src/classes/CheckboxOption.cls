public class CheckboxOption {

	public static final String FILTER_SEPARATOR = ':';

	@AuraEnabled
	public String label {
		get; set;
	}

	@AuraEnabled
	public String value {
		get; set;
	}

	public ProductFilter filter {
		get; private set;
	}

	public CheckboxOption(ProductFilter filterType, String value) {
		this.label = value;
		this.value = filterType.name + FILTER_SEPARATOR + value;
		this.filter = filterType;
	}

	public static CheckboxOption fromValue(String value) {
		String val = value.substringAfter(FILTER_SEPARATOR);
		ProductFilter filter = ProductFilter.fromName(value.substringBefore(FILTER_SEPARATOR));
		return new CheckboxOption(filter, val);
	}
}