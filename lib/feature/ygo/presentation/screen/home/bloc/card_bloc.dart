import 'package:ygo_hub/feature/ygo/domain/use_case/get_card_ygo_use_case.dart';
import 'package:ygo_hub/feature/ygo/presentation/screen/home/bloc/card_event.dart';
import 'package:ygo_hub/feature/ygo/presentation/screen/home/bloc/card_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardBloc extends Bloc<CardEvent, CardState> {
  final GetCardYgoUseCase _getCardYgoUseCase;

  CardBloc(this._getCardYgoUseCase) : super(CardInitial()) {
    on<LoadCardsEvent>((event, emit) async {
      emit(CardLoading());
      try {
        final cards = await _getCardYgoUseCase();
        final filteredList = cards;
        emit(CardLoaded(cards, filteredList));
      } catch (e) {
        emit(CardError(e.toString()));
      }
    });

    on<SearchCardEvent>((event, emit) {
      final currentState = state;

      if (currentState is CardLoaded) {
        if (event.name.isEmpty) {
          emit(CardLoaded(currentState.cards, currentState.cards));
          return;
        }

        final searchTerm = event.name.toLowerCase();

        final filteredList = currentState.cards.where((card) {
          return card.name.toLowerCase().contains(searchTerm);
        }).toList();

        emit(CardLoaded(currentState.cards, filteredList));
      }
    });
  }
}
