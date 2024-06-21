import 'package:awsmorty/features/characters/presentation/bloc/character_bloc.dart';
import 'package:awsmorty/features/characters/service/character_service.dart';
import 'package:awsmorty/utils/dio_config.dart';
import 'package:awsmorty/utils/router.dart';
import 'package:awsmorty/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/main.dart';

void main() {
  DioClient.configure("https://or84rxcafh.execute-api.us-east-1.amazonaws.com");
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CharacterBloc>(
          create: (BuildContext context) => //GEtit for injecting the service
              CharacterBloc(repo: CharacterService()),
        ),
      ],
      child: MaterialApp.router(
        title: 'rickandmorty',
        theme: theme,
        routerConfig: router,
      ),
    );
  }
}
