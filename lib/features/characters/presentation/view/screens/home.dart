import 'dart:ui';

import 'package:awsmorty/features/characters/domain/character_model.dart';
import 'package:awsmorty/features/characters/presentation/bloc/character_bloc.dart';
import 'package:awsmorty/features/characters/presentation/bloc/character_event.dart';
import 'package:awsmorty/features/common/widgets/primary_button.dart';
import 'package:awsmorty/utils/parallax_delegate.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  late PageController _pageController;
  double currentPage = 0.0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<CharacterBloc>().add(GetCharacters());
    });
    _pageController = PageController(viewportFraction: 0.6);
    _pageController.addListener(listenPageScroll);
  }

  void listenPageScroll() {
    currentPage = _pageController.page ?? 0.0;
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();

    _pageController.removeListener(listenPageScroll);
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final state = context.watch<CharacterBloc>();
    return Scaffold(
        body: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              stops: [0.0, 0.4, 0.6, 1],
              colors: [
                Color.fromARGB(255, 5, 14, 21),
                Color.fromARGB(255, 63, 119, 165),
                Color.fromARGB(255, 51, 98, 137),
                Color.fromARGB(255, 5, 14, 21),
              ],
            )),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Image.asset("assets/rickmorty.png")),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  state.state.characterList.isEmpty
                      ? const SizedBox()
                      : SizedBox(
                          height: size.height * 0.41,
                          child: PageView.builder(
                            clipBehavior: Clip.none,
                            controller: _pageController,
                            itemCount: state.state.characterList.length,
                            itemBuilder: (context, index) {
                              return Transform.scale(
                                  scale: 1.2 -
                                      0.2 *
                                          (currentPage - index.toDouble())
                                              .abs(),
                                  child: ParallaxCard(
                                    character: state.state.characterList[index],
                                  ));
                            },
                          ),
                        ),
                ],
              ),
            )));
  }
}

class ParallaxCard extends StatelessWidget {
  const ParallaxCard({Key? key, required this.character}) : super(key: key);

  final CharacterModel character;

  @override
  Widget build(BuildContext context) {
    final state = context.watch<CharacterBloc>();
    final GlobalKey backgroundImageKey = GlobalKey();
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        context.read<CharacterBloc>().add(
            ChangeName(name: character.name, id: character.id, fromHome: true));
        context.push("/character/detail", extra: character);
      },
      child: Container(
          height: size.height * 0.32,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                color: const Color.fromARGB(255, 107, 40, 40).withOpacity(0.2),
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.all(18),
                        child: Hero(
                          tag: "characterProfilePicture${character.id}",
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                              child: Flow(
                                delegate: ParallaxFlowDelegate(
                                  scrollable: Scrollable.of(context),
                                  itemContext: context,
                                  keyImage: backgroundImageKey,
                                ),
                                children: [
                                  CachedNetworkImage(
                                    key: backgroundImageKey,
                                    fit: BoxFit.cover,
                                    imageUrl: character.urlImage,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Text(character.name),
                    Text(character.state),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
