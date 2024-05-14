class ShopCategory {
  final String categoryId;
  final String title;
  final String image;
  final int quantity;
  ShopCategory(this.categoryId, this.title, this.image, this.quantity);

  factory ShopCategory.fromJson(Map<String, dynamic> json) {
    return ShopCategory(
        json['categoryId'], json['title'], json['image'], json['quantity']);
  }
}
