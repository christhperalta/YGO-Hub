




import 'package:ygo_hub/feature/ygo/domain/entities/card_ygo_details.dart';

abstract class DetailsState {}

class DetailsInitial extends DetailsState {}

class DetailsLoading extends DetailsState {}

class DetailsLoaded extends DetailsState {
  final CardYgoDetails cardDetails;

  DetailsLoaded({required this.cardDetails}); 
  
}

class DetailsError extends DetailsState {
   final String message;

  DetailsError({required this.message});
}