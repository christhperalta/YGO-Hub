class CardYgoDetails {
  final int? id;
  final String name;
  final String desc;
  final int? atk = 0;
  final int? def = 0;
  final int? level = 0;
  final String? attribute;
  final double? cardmarketPrice;
  final String? imageUrl;

  CardYgoDetails({
    required this.id,
    required this.name,
    required this.desc,
    required this.attribute,
    required this.cardmarketPrice,
    this.imageUrl,
  });
}
