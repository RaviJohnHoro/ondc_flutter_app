class CartItem {
  final String itemId;
  final String name;
  final String imageUrl;

  const CartItem(
      {required this.itemId, required this.name, required this.imageUrl});

  CartItem copyWith({
    String? itemId,
    String? name,
    String? imageUrl,
  }) {
    return CartItem(
      itemId: itemId ?? this.itemId,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }
}
