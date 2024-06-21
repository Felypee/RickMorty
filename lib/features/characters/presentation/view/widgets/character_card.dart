import 'package:awsmorty/features/characters/domain/character_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CharacterCard extends StatefulWidget {
  final double? cardHeight;
  final double? cardWidth;
  final CharacterModel character;
  const CharacterCard({
    super.key,
    this.cardHeight,
    this.cardWidth,
    required this.character,
  });

  @override
  State<CharacterCard> createState() => _CharacterCardState();
}

class _CharacterCardState extends State<CharacterCard> {
  EdgeInsetsGeometry originalMargin = const EdgeInsets.all(0.0);
  EdgeInsetsGeometry increasedMargin = const EdgeInsets.all(12.0);
  bool isMarginIncreased = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
        onTap: () {
          setState(() {
            if (!isMarginIncreased) {
              isMarginIncreased = true;
              Future.delayed(const Duration(milliseconds: 100), () {
                if (mounted) {
                  setState(() {
                    isMarginIncreased = false;
                  });
                }
              });
              context.push("/character/detail", extra: widget.character);
            }
          });
        },
        child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            margin: isMarginIncreased ? increasedMargin : originalMargin,
            clipBehavior: Clip.hardEdge,
            height: widget.cardHeight,
            width: widget.cardWidth,
            decoration: BoxDecoration(
              color: Theme.of(context).indicatorColor,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 4,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Hero(
                  tag: "characterProfilePicture${widget.character.id}",
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: CachedNetworkImage(
                      imageUrl: widget.character.urlImage,
                      height: size.height * 0.5,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Text(
                    widget.character.name,
                    style: TextStyle(
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 12.0,
                    right: 12.0,
                    bottom: 12.0,
                  ),
                  child: Text(widget.character.state,
                      style: Theme.of(context).textTheme.bodySmall),
                ),
              ],
            )));
  }
}
