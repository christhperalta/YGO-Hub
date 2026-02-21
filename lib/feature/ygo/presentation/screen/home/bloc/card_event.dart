


abstract class CardEvent {}


class LoadCardsEvent extends CardEvent{}


class SearchCardEvent extends CardEvent {
  final String name;

  SearchCardEvent({required this.name}); 
  
}



