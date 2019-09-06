public class CartItemDto {

	@AuraEnabled
	public String product2Id {
		get; private set;
	}

	@AuraEnabled
	public String name {
		get; private set;
	}

	@AuraEnabled
	public String description {
		get; set;
	}

	@AuraEnabled
	public String currencyCode {
		get; set;
	}

	public CartItemDto(Id product2Id, String name) {
		this.product2Id = product2Id;
		this.name = name;
	}
}