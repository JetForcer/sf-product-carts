public class ProductDetailsDtoConverter {

    public ProductDetailsDto fromEntity(Product2 product) {
        ProductDetailsDto result = new ProductDetailsDto(product.Name, product.Id);

        result.family = product.Family;
        result.description = product.Description;
        result.currencyCode = product.CurrencyIsoCode;
        result.code = product.ProductCode;
        result.isActive = product.IsActive;

        return result;
    }
}