public class ProductDtoConverter {

	public ProductDto[] fromEntities(Product2[] products) {
		List<ProductDto> result = new List<ProductDto>();
		for (Product2 next : products) {
			ProductDto dto = new ProductDto(next.Name, next.Id);
			dto.description = next.Description;
			dto.iconLink = next.IconLink__c;
			result.add(dto);
		}

		return result;
	}
}