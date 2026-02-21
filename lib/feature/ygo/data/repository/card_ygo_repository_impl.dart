


import 'package:ygo_hub/feature/ygo/data/datasource/remote_card_ygo_datasource.dart';
import 'package:ygo_hub/feature/ygo/domain/entities/card_ygo.dart';
import 'package:ygo_hub/feature/ygo/domain/repository/card_ygo_repository.dart';

class CardYgoRepositoryImpl implements CardYgoRepository {
  final  CardYgoDatasource cardYgoDatasource;

  CardYgoRepositoryImpl({required this.cardYgoDatasource});
  
  @override
  Future<List<CardYgo>> getCards() {
    return cardYgoDatasource.getCards();
  }
  
}