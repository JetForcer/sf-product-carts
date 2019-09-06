public class CartItemDto {

	@AuraEnabled
	public String product2Id {
		get; set;
	}

	@AuraEnabled
	public String name {
		get; set;
	}

	@AuraEnabled
	public String description {
		get; set;
	}

	@AuraEnabled
	public String currencyCode {
		get; set;
	}

	public CartItemDto() {
		// for serialization
	}

	public CartItemDto(Id product2Id, String name) {
		this.product2Id = product2Id;
		this.name = name;
	}
}