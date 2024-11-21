class DonationRequest {
  final int categoryId;
  final String description;
  final double price;
  final String? imageUrl;
  final String details;

  DonationRequest({
    required this.categoryId,
    required this.description,
    required this.price,
    this.imageUrl,
    required this.details,
  });

  Map<String, dynamic> toJson() {
    return {
      'catigory_id': categoryId,
      'dec': description,
      'price': price,
      'img': imageUrl,
      'des': details,
    };
  }
}
