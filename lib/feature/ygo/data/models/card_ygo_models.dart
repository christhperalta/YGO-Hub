import 'package:ygo_hub/feature/ygo/domain/entities/card_ygo.dart';

class CardYgoModels extends CardYgo {
  CardYgoModels({
    required super.id,
    required super.name,
    required super.type,
    required super.imageUrl,
  });


  factory CardYgoModels.fromJson(Map <String , dynamic> json ) {
    return CardYgoModels(
    id: json['id'], 
    name: json['name'], 
    type: json['type'], 
    imageUrl: json['card_images'][0]['image_url_cropped']
    );
  }
}




