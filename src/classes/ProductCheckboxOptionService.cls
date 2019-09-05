public class ProductCheckboxOptionService {

	public static ProductCheckboxOptionService instance {
		get {
			return new ProductCheckboxOptionService(
				new OpportunityLineItemRepository()
			);
		}
		private set;
	}

	private final OpportunityLineItemRepository opportunityLineItemRepository;

	private ProductCheckboxOptionService(OpportunityLineItemRepository opportunityLineItemRepository) {
		this.opportunityLineItemRepository = opportunityLineItemRepository;
	}

	public CheckboxOption[] getFamiliesOptions(Id opportunityId) {
		List<CheckboxOption> result = new List<CheckboxOption>();
		OpportunityLineItem[] found = opportunityLineItemRepository.findAllById(opportunityId);

		Set<String> alreadyRegistered = new Set<String>();
		for (OpportunityLineItem next : found) {
			String family = next.PricebookEntry.Product2.Family;
			if (family != null && !alreadyRegistered.contains(family)) {
				alreadyRegistered.add(family);
				result.add(new CheckboxOption(family));
			}
		}

		System.debug('[result::List<CheckboxOption>]:watches' + JSON.serialize(result));

		return result;
	}
}