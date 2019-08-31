public class ProductFilterInfo {

	@AuraEnabled
	public String filterGroupName{
		get; set;
	}

	@AuraEnabled
	public CheckboxOption[] options{
		get; set;
	}

	public ProductFilterInfo(String filterGroupName, CheckboxOption[] options) {
		this.filterGroupName = filterGroupName;
		this.options = options;
	}
}