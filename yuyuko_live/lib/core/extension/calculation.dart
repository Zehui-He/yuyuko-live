/// A wrapper for [num] to provide some calculation methods which supports null
mixin Calculation {
  num? divide(num? a, num? b) {
    if (a == null || b == null) {
      return null;
    }
    return a / b;
  }

  num? multiply(num? a, num? b) {
    if (a == null || b == null) {
      return null;
    }
    return a * b;
  }
}
