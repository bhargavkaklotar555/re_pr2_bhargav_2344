class ProductModal {
  final String title;
  final String descprition;
  final String brand;
  final String category;
  final String thumbnail;
  final int price;
  final int stock;
  final int id;
  int quantity = 1;

  ProductModal({
    required this.descprition,
    required this.brand,
    required this.category,
    required this.thumbnail,
    required this.price,
    required this.stock,
    required this.id,
    required this.title,
    this.quantity = 1,
  });

  factory ProductModal.fromMap({required Map data}) {
    return ProductModal(
        descprition: data['description'],
        brand: data['brand'],
        category: data['category'],
        thumbnail: data['thumbnail'],
        price: data['price'],
        stock: data['stock'],
        id: data['id'],
        title: data['title'],
        quantity: 1);
  }
}
