import 'package:ygo_hub/feature/ygo/domain/entities/card_ygo_details.dart';
import 'package:ygo_hub/feature/ygo/domain/repository/card_ygo_repository.dart';

class GetCardYgoByIdUseCase {

  final CardYgoRepository repository;

  GetCardYgoByIdUseCase({required this.repository});

  Future<CardYgoDetails> call(int id) {
    return repository.getCardById(id);
  }
}
