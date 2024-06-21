import 'package:awsmorty/features/characters/domain/character_model.dart';
import 'package:awsmorty/features/characters/presentation/bloc/character_bloc.dart';
import 'package:awsmorty/features/characters/presentation/bloc/character_event.dart';
import 'package:awsmorty/features/characters/presentation/bloc/character_state.dart';
import 'package:awsmorty/features/common/widgets/primary_button.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CharacterDetail extends StatefulWidget {
  final CharacterModel character;
  const CharacterDetail({super.key, required this.character});

  @override
  State<CharacterDetail> createState() => _CharacterDetailState();
}

class _CharacterDetailState extends State<CharacterDetail> {
  bool showTextField = false;

  late TextEditingController _textController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final state = context.watch<CharacterBloc>().state;
    debugPrint("Status ${state.characterStatus == CharacterStatus.loading}");
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            context.pop();
          },
          child: Icon(
            Icons.arrow_back_ios,
            size: 35,
            color: Theme.of(context).scaffoldBackgroundColor,
          ),
        ),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Stack(
            children: [
              Hero(
                tag: "characterProfilePicture${widget.character.id}",
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: CachedNetworkImage(
                      imageUrl: widget.character.urlImage,
                      height: size.height * 0.7,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned.fill(
                child: TweenAnimationBuilder(
                    tween: Tween<double>(begin: 0.0, end: 1.0),
                    duration: const Duration(milliseconds: 1000),
                    builder: (context, value, child) {
                      return Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.black.withOpacity(
                                  value), // Adjust opacity and colors as needed
                            ],
                          ),
                        ),
                      );
                    }),
              ),
              Positioned(
                bottom: 10,
                right: 0,
                left: 14,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    showTextField
                        ? SizedBox(
                            width: 300,
                            child: TextField(
                              controller: _textController,
                              decoration: InputDecoration(
                                hintText: state.characterName!.length > 15
                                    ? '${widget.character.name.substring(0, 15)}...'
                                    : state.characterName!,
                                labelStyle: const TextStyle(color: Colors.grey),
                                enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                              ),
                            ),
                          )
                        : Text(
                            state.characterName!.length > 15
                                ? '${state.characterName!.substring(0, 15)}...'
                                : state.characterName!,
                            style: const TextStyle(
                              fontSize: 40,
                            ),
                          ),
                    showTextField
                        ? IconButton(
                            icon: const Icon(Icons.arrow_circle_right_rounded),
                            onPressed: () {
                              context.read<CharacterBloc>().add(ChangeName(
                                  name: _textController.text,
                                  id: widget.character.id,
                                  fromHome: false));
                              setState(() {
                                showTextField = false;
                              });
                            },
                            color: Colors.white,
                            iconSize: 50,
                          )
                        : IconButton(
                            onPressed: () {
                              setState(() {
                                showTextField = true;
                              });
                            },
                            icon: const Icon(
                              Icons.edit,
                              size: 30,
                              color: Colors.white,
                            )),
                  ],
                ),
              )
            ],
          ),
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 14,
                  left: 14,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(widget.character.state,
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                        )),
                    Text(widget.character.gender,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        )),
                    Text("Currently in ${widget.character.location}",
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w200,
                        )),
                    Text(widget.character.species,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w200,
                        )),
                    Text("From ${widget.character.origin}",
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        )),
                    Text(
                        "Appeared in ${widget.character.episodesNumber} episodes",
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w100,
                        )),
                  ],
                ),
              ),
              Positioned(
                top: 10,
                right: 0,
                child: IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) =>
                              DeleteConfirmatino(size: size, widget: widget));
                    },
                    icon: const Icon(
                      Icons.delete,
                      size: 50,
                      color: Colors.white,
                    )),
              )
            ],
          )
        ]),
      ),
    );
  }
}

class DeleteConfirmatino extends StatefulWidget {
  const DeleteConfirmatino({
    super.key,
    required this.size,
    required this.widget,
  });

  final Size size;
  final CharacterDetail widget;

  @override
  State<DeleteConfirmatino> createState() => _DeleteConfirmatinoState();
}

class _DeleteConfirmatinoState extends State<DeleteConfirmatino> {
  @override
  Widget build(BuildContext context) {
    final state = context.watch<CharacterBloc>().state;
    return Container(
      margin: const EdgeInsets.all(20),
      width: widget.size.width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Are you sure?",
            style: TextStyle(color: Colors.black, fontSize: 40),
          ),
          const SizedBox(
            height: 60,
          ),
          const SizedBox(
            height: 10,
          ),
          state.characterStatus == CharacterStatus.loading
              ? Padding(
                  padding: EdgeInsets.all(widget.size.width * 0.02),
                  child: const CircularProgressIndicator(
                    color: Colors.blue,
                  ),
                )
              : PrimaryButton(
                  title: "Delete",
                  onPressed: () {
                    context.read<CharacterBloc>().add(DeleteCharacter(
                        id: widget.widget.character.id,
                        onSuccess: () {
                          context.pop();
                          context.pop();
                        }));
                  }),
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () => context.pop(),
            child: const Text(
              "Cancel",
              style: TextStyle(color: Colors.black, fontSize: 15),
            ),
          ),
          const SizedBox(
            height: 120,
          )
        ],
      ),
    );
  }
}
