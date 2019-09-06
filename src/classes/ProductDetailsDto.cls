public class ProductDetailsDto extends ProductDto {

	@AuraEnabled
	public String family {
		get; set;
	}

	@AuraEnabled
	public String code {
		get; set;
	}

	@AuraEnabled
	public String currencyCode {
		get; set;
	}

	@AuraEnabled
	public Boolean isActive {
		get; set;
	}

	public ProductDetailsDto(String name, String id) {
		super(name, id);
	}
}