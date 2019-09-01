public class CheckboxOption {

	public static final String FAMILY_VALUE_SEPARATOR = ':';

	@AuraEnabled
	public String label {
		get; set;
	}

	@AuraEnabled
	public String value {
		get; set;
	}

	public CheckboxOption(String family, String value) {
		this.label = value;
		this.value = family + FAMILY_VALUE_SEPARATOR + value;
	}
}