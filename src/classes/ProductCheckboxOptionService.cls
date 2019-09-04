public class ProductCheckboxOptionService {

	public static ProductCheckboxOptionService instance {
		get {
			return new ProductCheckboxOptionService();
		}
		private set;
	}

	private ProductCheckboxOptionService() {
	}

	public CheckboxOption[] getFamiliesOptions(Id opportunityId) {
		return new List<CheckboxOption>();
	}
}