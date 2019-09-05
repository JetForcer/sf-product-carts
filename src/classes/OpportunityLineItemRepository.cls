public class OpportunityLineItemRepository {

	public OpportunityLineItem[] findAllById(Id opportunityId) {
		if (opportunityId == null) {
			throw new UnsupportedOperationException('Opportunity Id must not be null');
		}

		Opportunity found = [
				select Id,
						Name,
						(select PricebookEntry.Name,
								 PricebookEntry.Product2.Family
						from OpportunityLineItems)
				from Opportunity
				where Id = :opportunityId
		];

		if (found == null) {
			return new List<OpportunityLineItem>();
		}

		return found.OpportunityLineItems;
	}

	public OpportunityLineItem[] findAllBy(Id opportunityId, String description, List<String> familiesNames) {

		String subQueryBuilder =
				'select Id, ' +
				' PricebookEntry.Name, ' +
				' PricebookEntry.Product2.Family, ' +
				' PricebookEntry.Product2.Description ' +
				'from OpportunityLineItems';

		List<String> whereClauses = new List<String>();
		if (Util.notEmpty(familiesNames)) {
			whereClauses.add('PricebookEntry.Product2.Family in :familiesNames');
		}

		if (!whereClauses.isEmpty()) {
			subQueryBuilder = subQueryBuilder + ' where ' + String.join(whereClauses, ' and ');
		}

		String queryBuilder =
				'select Id, ' +
				' Name, ' +
				' (' + subQueryBuilder + ') ' +
				'from Opportunity ' +
				'where Id = :opportunityId';

		System.debug('[queryBuilder::String]:watches' + JSON.serialize(queryBuilder));

		Opportunity queried = Database.query(queryBuilder);

		System.debug('[queried.OpportunityLineItems::OpportunityLineItem[]]:watches' +
				JSON.serialize(queried.OpportunityLineItems));

		return queried.OpportunityLineItems;
	}
}