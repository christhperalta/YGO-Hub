

import 'package:ygo_hub/feature/ygo/domain/entities/card_ygo.dart';
import 'package:ygo_hub/feature/ygo/domain/entities/card_ygo_details.dart';

abstract class CardYgoRepository {
  Future<List<CardYgo>> getCards();
  Future<CardYgoDetails> getCardById(int id );
}