public class CartItemDtoConverter {

	public CartItemDto[] fromProducts(Product2[] products) {
		List<CartItemDto> result = new List<CartItemDto>();
		for (Product2 next : products) {
			CartItemDto dto = new CartItemDto(next.Id, next.Name);
			dto.description = next.Description;
			dto.currencyCode = next.CurrencyIsoCode;
			result.add(dto);
		}

		System.debug('[result::List<CartItemDto>]:watches' + JSON.serialize(result));
		return result;
	}
}