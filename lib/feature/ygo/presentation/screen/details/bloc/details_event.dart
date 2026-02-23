



abstract class DetailsEvent {}


class LoadDetailsEvent extends DetailsEvent{
  final int id;

  LoadDetailsEvent({required this.id}); 
  
}

