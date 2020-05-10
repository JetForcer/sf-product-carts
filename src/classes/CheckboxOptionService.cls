public class CheckboxOptionService {

    private Product2Service product2Service = new Product2Service();

    public CheckboxOption[] getFamiliesOptions(Id opportunityId) {
        List<CheckboxOption> result = new List<CheckboxOption>();
        List<Product2> found = product2Service.findByOpportunityId(opportunityId);

        Set<String> alreadyRegistered = new Set<String>();
        for (Product2 next : found) {
            String family = next.Family;
            if (family != null && !alreadyRegistered.contains(family)) {
                alreadyRegistered.add(family);
                result.add(new CheckboxOption(family));
            }
        }

        System.debug('[result::List<CheckboxOption>]:watches' + JSON.serialize(result));
        return result;
    }
}