public class Util {

	public static Boolean notEmpty(Object obj) {
		return !isEmpty(obj);
	}

	public static Boolean isEmpty(Object obj) {
		if (obj == null) {
			return true;
		} else if (obj instanceof String) {
			String trimmed = ((String)obj).trim();
			return String.isEmpty(trimmed);
		} else if (obj instanceof List<Object>) {
			return ((List<Object>)obj).isEmpty();
		} else {
			throw new UnsupportedOperationException('Not supported type ' + obj);
		}
	}
}