public class ProductDetailsController {

    public static Product2Service product2Service = new Product2Service();
    public static ProductDetailsDtoConverter converter = new ProductDetailsDtoConverter();

    @AuraEnabled
    public static ProductDetailsDto getDetails(Id product2Id) {
        Product2 found = product2Service.getById(product2Id);
        return converter.fromEntity(found);
    }
}