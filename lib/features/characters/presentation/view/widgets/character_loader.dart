import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CharactersLoader extends StatelessWidget {
  const CharactersLoader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Center(
        child: Shimmer.fromColors(
            baseColor: Colors.grey.withOpacity(0.6),
            highlightColor: Colors.grey.withOpacity(0.5),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: Container(
                        height: size.height * 0.5,
                        decoration: BoxDecoration(
                          color: Theme.of(context).indicatorColor,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 4,
                              offset: const Offset(
                                  0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            )));
  }
}
