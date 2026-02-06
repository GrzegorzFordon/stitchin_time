
extension Add on (int, int) {
  (int, int) operator +((int, int) other) => ($1 + other.$1, $2 + other.$2);
}

extension Subtract on (int, int) {
  (int, int) operator -((int, int) other) => ($1 - other.$1, $2 - other.$2);
}
