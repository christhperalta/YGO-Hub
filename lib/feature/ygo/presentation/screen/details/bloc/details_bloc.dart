import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ygo_hub/feature/ygo/domain/use_case/get_card_ygo_by_id_use_case.dart';
import 'package:ygo_hub/feature/ygo/presentation/screen/details/bloc/details_event.dart';
import 'package:ygo_hub/feature/ygo/presentation/screen/details/bloc/details_state.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  final GetCardYgoByIdUseCase _getCardYgoByIdUseCase;

  DetailsBloc(this._getCardYgoByIdUseCase) : super(DetailsInitial()) {
    on<LoadDetailsEvent>((event, emit) async {
      emit(DetailsLoading());
      try {
        final cardDetails = await _getCardYgoByIdUseCase(event.id);
        emit(DetailsLoaded(cardDetails: cardDetails));
      } catch (e) {
        debugPrint(e.toString());
        emit(DetailsError(message: e.toString()));
      }
    });
  }
}
