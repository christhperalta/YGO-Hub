import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:ygo_hub/di/di.dart';
import 'package:ygo_hub/feature/ygo/presentation/screen/home/bloc/card_bloc.dart';
import 'package:ygo_hub/feature/ygo/presentation/screen/home/bloc/card_event.dart';

import 'feature/ygo/presentation/screen/home/home_screen.dart';

void main() async  {
  init(); 
  runApp(MyApp());
  
  }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create:(context) => GetIt.instance.get<CardBloc>()..add(LoadCardsEvent()),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'TGO HUB',
        home: HomeScreen()
      ),
    );
  }
}
