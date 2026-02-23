
import 'package:ygo_hub/feature/ygo/data/models/card_ygo_details_models.dart';
import 'package:ygo_hub/feature/ygo/data/models/card_ygo_models.dart';
import 'package:dio/dio.dart';


abstract class CardYgoDatasource {
   Future<List<CardYgoModels>> getCards();
   Future<CardYgoDetailsModels> getCardById(int id );
}

class RemoteCardYgoDatasourceImpl implements CardYgoDatasource {

  final dio = Dio(
  BaseOptions(
    baseUrl: 'https://db.ygoprodeck.com/api/v7/',
    connectTimeout: const Duration(seconds: 5), // Opcional, pero recomendado
    receiveTimeout: const Duration(seconds: 3),
  ),
);

  @override
  Future<List<CardYgoModels>> getCards() async {
   try {
     final response = await dio.get('cardinfo.php');
     List<dynamic> data = response.data['data'];
     return data.map((json)=> CardYgoModels.fromJson(json)).toList();
   } on DioException catch (e) {
     throw Exception('Error en la red ${e.message}');
   } 
  }
  
 @override
Future<CardYgoDetailsModels> getCardById(int id) async {
  try {
    final response = await dio.get(
      'cardinfo.php',
      queryParameters: {'id': id},
    );

    final List<dynamic> data = response.data['data'];
    if (data.isEmpty) {
      throw Exception('Card not found');
    }

    return CardYgoDetailsModels.fromJson(data[0]);

  } on DioException catch (e) {
    throw Exception('Network error: ${e.message}');
  }
}
  
  
}