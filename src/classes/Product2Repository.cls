public class Product2Repository {

	public List<Product2> findAllByIds(List<String> ids) {
		return [
				select Id,
						Name,
						Description,
						Family
				from Product2
				where Id in :ids
		];
	}
}