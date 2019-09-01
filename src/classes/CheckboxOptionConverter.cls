public class CheckboxOptionConverter {

	public CheckboxOption[] toCheckboxOptions(String family, String[] values) {
		CheckboxOption[] result = new List<CheckboxOption>();
		for (String next : values) {
			result.add(new CheckboxOption(family, next));
		}
		return result;
	}
}