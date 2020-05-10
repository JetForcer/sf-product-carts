public class OpportunityRepository {

    public Opportunity findById(Id id) {
        return [
                select Id,
                        Pricebook2Id,
                        CurrencyIsoCode
                from Opportunity
                where Id = :id
        ];
    }
}