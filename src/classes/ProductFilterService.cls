public class ProductFilterService {

	private final ProductFamilyRepository productFamilyRepository;
	private final ProductTypeRepository productTypeRepository;
	private final ProductFilterInfoConverter converter;

	public static ProductFilterService instance {
		get {
			return new ProductFilterService(
					new ProductFamilyRepository(),
					new ProductTypeRepository(),
					new ProductFilterInfoConverter()
			);
		}
		private set;
	}

	private ProductFilterService(ProductFamilyRepository familyRepository,
								 ProductTypeRepository typeRepository,
								 ProductFilterInfoConverter converter) {
		this.converter = converter;
		this.productFamilyRepository = familyRepository;
		this.productTypeRepository = typeRepository;
	}

	public ProductFilterInfo[] getFilters() {
		List<String> familiesNames = productFamilyRepository.getFamiliesNames();
		List<String> typesNames = productTypeRepository.getTypesNames();

		return new ProductFilterInfo[] {
				converter.fromTypeAndValues(ProductFilter.FAMILY, familiesNames),
				converter.fromTypeAndValues(ProductFilter.PRODUCT_TYPE, typesNames)
				};
	}
}