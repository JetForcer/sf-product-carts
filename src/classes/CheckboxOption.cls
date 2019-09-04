public class CheckboxOption {

	@AuraEnabled
	public String label {
		get; set;
	}

	@AuraEnabled
	public String value {
		get; set;
	}

	public CheckboxOption(String value) {
		this.label = value;
		this.value = value;
	}
}