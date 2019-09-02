public class ProductFilterInfo {

	@AuraEnabled
	public String filterGroupName{
		get; private set;
	}

	@AuraEnabled
	public CheckboxOption[] options{
		get; private set;
	}

	public ProductFilterInfo(String filterGroupName, CheckboxOption[] options) {
		this.filterGroupName = filterGroupName;
		this.options = options;
	}
}