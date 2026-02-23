


import 'package:ygo_hub/feature/ygo/domain/entities/card_ygo.dart';

abstract class CardState {}

class CardInitial extends CardState {}

class CardLoading extends CardState {}

class CardLoaded extends CardState {
  final List<CardYgo> cards;
  final List<CardYgo> filteredList;
  CardLoaded(this.cards,this.filteredList);
}

class CardError extends CardState {
  final String message;
  CardError(this.message);
}