



import 'package:ygo_hub/feature/ygo/domain/entities/card_ygo.dart';
import 'package:ygo_hub/feature/ygo/domain/repository/card_ygo_repository.dart';

class GetCardYgoUseCase {
  final CardYgoRepository repository;

  GetCardYgoUseCase({required this.repository});
  
  Future<List<CardYgo>> call () {
    return repository.getCards();
  }
}