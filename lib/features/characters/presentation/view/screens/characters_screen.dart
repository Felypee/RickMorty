import 'package:awsmorty/features/characters/presentation/bloc/character_bloc.dart';
import 'package:awsmorty/features/characters/presentation/bloc/character_event.dart';
import 'package:awsmorty/features/characters/presentation/bloc/character_state.dart';
import 'package:awsmorty/features/characters/presentation/view/widgets/character_card.dart';
import 'package:awsmorty/features/characters/presentation/view/widgets/character_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:go_router/go_router.dart';

class Character extends StatefulWidget {
  const Character({super.key});

  @override
  State<Character> createState() => _CharacterState();
}

class _CharacterState extends State<Character> {
  final ScrollController _controller = ScrollController(keepScrollOffset: true);

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<CharacterBloc>().add(CharacterEvent.getCharacters());
    });
    _controller.addListener(getMoreCharacters);
  }

  getMoreCharacters() {
    if (_controller.position.maxScrollExtent == _controller.offset) {
      context.read<CharacterBloc>().add(CharacterEvent.getCharacters());
    }
  }

  @override
  void dispose() {
    super.dispose();
    _controller.removeListener(getMoreCharacters);
  }

  @override
  Widget build(BuildContext context) {
    final status = context.watch<CharacterBloc>();

    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            context.pop();
          },
          child: Icon(
            Icons.arrow_back_ios,
            size: 35,
            color: Theme.of(context).indicatorColor,
          ),
        ),
        title: const Text(
          "Characters",
          style: TextStyle(
            fontSize: 42,
          ),
        ),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      body: Stack(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: status.state.characterStatus == CharacterStatus.loading
                  ? Container()
                  : ListView.builder(
                      controller: _controller,
                      itemCount: status.state.characterList.length + 1,
                      itemBuilder: (context, index) {
                        if (index < status.state.characterList.length) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: CharacterCard(
                              character: status.state.characterList[index],
                            ),
                          );
                        } else {
                          return Center(
                              child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: CircularProgressIndicator(
                              color: Theme.of(context).indicatorColor,
                            ),
                          ));
                        }
                        return null;
                      }),
            ),
          ),
          status.state.characterStatus == CharacterStatus.loading
              ? const CharactersLoader()
              : const SizedBox()
        ],
      ),
    );
  }
}
