public virtual class ProductDto {

	@AuraEnabled
	public Id id {
		get; private set;
	}

	@AuraEnabled
	public String name {
		get; private set;
	}

	@AuraEnabled
	public String productLink {
		get; private set;
	}

	@AuraEnabled
	public String description{
		get; set;
	}

	@AuraEnabled
	public String iconLink{
		get; set;
	}

	public ProductDto(String name, String id) {
		this.id = id;
		this.name = name;
		this.productLink = '/lightning/r/' + id + '/view';
	}
}