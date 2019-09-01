public class ProductFilterService {

	private final ProductFamilyRepository productFamilyRepository;
	private final ProductTypeRepository productTypeRepository;
	private final CheckboxOptionConverter converter;

	public static ProductFilterService instance {
		get {
			return new ProductFilterService(
					new ProductFamilyRepository(),
					new ProductTypeRepository(),
					new CheckboxOptionConverter()
			);
		}
		private set;
	}

	private ProductFilterService(ProductFamilyRepository familyRepository,
								 ProductTypeRepository typeRepository,
								 CheckboxOptionConverter converter) {
		this.converter = converter;
		this.productFamilyRepository = familyRepository;
		this.productTypeRepository = typeRepository;
	}

	public ProductFilterInfo[] getFilters() {
		List<String> familiesNames = productFamilyRepository.getFamiliesNames();
		List<String> typesNames = productTypeRepository.getTypesNames();

		return new ProductFilterInfo[] {
				new ProductFilterInfo('Family', converter.toCheckboxOptions(familiesNames)),
				new ProductFilterInfo('Product Type', converter.toCheckboxOptions(typesNames))
				};
	}
}