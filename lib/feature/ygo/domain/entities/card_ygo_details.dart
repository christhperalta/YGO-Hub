class CardYgoDetails {
  final int? id;
  final String? name;
  final String? desc;
  final String? type;
  final int? atk;
  final int? def;
  final int? level;
  final String? attribute;
  final String? race;
  final String? cardmarketPrice;
  final String? imageUrl;

  CardYgoDetails({
    required this.id,
    required this.name,
    this.type,
    required this.desc,
    required this.attribute,
    required this.cardmarketPrice,
    this.atk,
    this.def,
    this.level,
    this.imageUrl, 
    this.race, 
    
  });
}
