import 'package:ygo_hub/feature/ygo/domain/entities/card_ygo_details.dart';

class CardYgoDetailsModels extends CardYgoDetails {
  CardYgoDetailsModels({
    required super.id,
    required super.name,
    required super.desc,
    required super.type,
    required super.atk,
    required super.def,
    required super.attribute,
    required super.level,
    required super.cardmarketPrice,
    required super.imageUrl,
  });

  factory CardYgoDetailsModels.fromJson(Map<String, dynamic> json) {
    final prices = json['card_prices'] as List;
    final images = json['card_images'] as List;

    return CardYgoDetailsModels(
      id: json['id'],
      name: json['name'],
      type: json['type'],
      desc: json['desc'],
      attribute: json['attribute'],
      atk: json['atk'],
      def: json['def'],

      cardmarketPrice: prices.isNotEmpty
          ? prices[0]['cardmarket_price']
          : "0.00",
      imageUrl: images.isNotEmpty ? images[0]['image_url'] : '',
      level: json['level'],
    );
  }
}
