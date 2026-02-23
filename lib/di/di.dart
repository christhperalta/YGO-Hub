import 'package:get_it/get_it.dart';
import 'package:ygo_hub/feature/ygo/data/datasource/remote_card_ygo_datasource.dart';
import 'package:ygo_hub/feature/ygo/data/repository/card_ygo_repository_impl.dart';
import 'package:ygo_hub/feature/ygo/domain/repository/card_ygo_repository.dart';
import 'package:ygo_hub/feature/ygo/domain/use_case/get_card_ygo_by_id_use_case.dart';
import 'package:ygo_hub/feature/ygo/domain/use_case/get_card_ygo_use_case.dart';
import 'package:ygo_hub/feature/ygo/presentation/screen/details/bloc/details_bloc.dart';
import 'package:ygo_hub/feature/ygo/presentation/screen/home/bloc/card_bloc.dart';



final sl = GetIt.instance;


void init () {

    // Bloc
    sl.registerFactory(()=> CardBloc(sl.get()));
    sl.registerFactory(()=> DetailsBloc(sl.get()));
    // UseCases 
    sl.registerLazySingleton(()=> GetCardYgoUseCase(repository: sl()));
    sl.registerLazySingleton(()=> GetCardYgoByIdUseCase(repository: sl()));
    // Repository 
    sl.registerLazySingleton<CardYgoRepository>(()=> CardYgoRepositoryImpl(cardYgoDatasource: sl.get()));
    // Data Soruce
    sl.registerLazySingleton<CardYgoDatasource>(() =>RemoteCardYgoDatasourceImpl() ,);
}