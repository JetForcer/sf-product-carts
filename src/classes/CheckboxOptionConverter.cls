public class CheckboxOptionConverter {

	public CheckboxOption[] toCheckboxOptions(String[] values) {
		CheckboxOption[] result = new List<CheckboxOption>();
		for (String next : values) {
			result.add(new CheckboxOption(next));
		}
		return result;
	}
}