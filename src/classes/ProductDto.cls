public class ProductDto {

	@AuraEnabled
	public String name {
		get; private set;
	}

	@AuraEnabled
	public String productLink {
		get; set;
	}

	@AuraEnabled
	public String description{
		get; set;
	}

	@AuraEnabled
	public String iconLink{
		get; set;
	}

	public ProductDto(String name) {
		this.name = name;
	}
}