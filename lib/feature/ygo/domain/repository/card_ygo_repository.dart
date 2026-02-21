

import 'package:ygo_hub/feature/ygo/domain/entities/card_ygo.dart';

abstract class CardYgoRepository {
  Future<List<CardYgo>> getCards();

}