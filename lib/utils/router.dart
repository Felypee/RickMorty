import 'package:awsmorty/features/characters/domain/character_model.dart';
import 'package:awsmorty/features/characters/presentation/view/screens/characters_detail_screen.dart';
import 'package:awsmorty/features/characters/presentation/view/screens/characters_screen.dart';
import 'package:awsmorty/features/characters/presentation/view/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:shimmer/main.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomeWidget();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'character',
          builder: (BuildContext context, GoRouterState state) {
            return const Character();
          },
        ),
        GoRoute(
          path: 'character/detail',
          builder: (BuildContext context, GoRouterState state) {
            return CharacterDetail(
              character: state.extra as CharacterModel,
            );
          },
        ),
      ],
    ),
  ],
);
