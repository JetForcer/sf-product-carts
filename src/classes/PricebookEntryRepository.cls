public class PricebookEntryRepository {

    public OpportunityRepository opportunityRepository = new OpportunityRepository();

    public List<PricebookEntry> findByOpportunityId(Id opportunityId) {
        Opportunity targetOpportunity = opportunityRepository.findById(opportunityId);
        return [
                select Id,
                        CurrencyIsoCode,
                        UnitPrice,
                        Product2Id,
                        Pricebook2Id
                from PricebookEntry
                where CurrencyIsoCode = :targetOpportunity.CurrencyIsoCode
                and Pricebook2Id = :targetOpportunity.Pricebook2Id
        ];
    }
}