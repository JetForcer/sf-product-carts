public class ProductCartInfo {

	@AuraEnabled
	public String productLink {
		get; set;
	}

	@AuraEnabled
	public String name {
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

	public ProductCartInfo(String name) {
		this.name = name;
	}
}