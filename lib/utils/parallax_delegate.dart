import 'package:flutter/material.dart';

class ParallaxFlowDelegate extends FlowDelegate {
  final ScrollableState scrollable;
  final BuildContext itemContext;
  final GlobalKey keyImage;
  final bool isListVertical;
  ParallaxFlowDelegate(
      {required this.scrollable,
      required this.itemContext,
      required this.keyImage,
      this.isListVertical = false})
      : super(repaint: scrollable.position);
  @override
  BoxConstraints getConstraintsForChild(int i, BoxConstraints constraints) {
    return BoxConstraints.tightFor(
        width: isListVertical ? constraints.maxWidth : null,
        height: isListVertical ? null : constraints.maxHeight);
  }

  @override
  void paintChildren(FlowPaintingContext context) {
    final scrollableBox = scrollable.context.findRenderObject() as RenderBox;
    final itemBox = itemContext.findRenderObject() as RenderBox;
    final itemOffset = itemBox.localToGlobal(
      itemBox.size.center(Offset.zero),
      ancestor: scrollableBox,
    );
    final viewportDimension = scrollable.position.viewportDimension;
    final scrollFraction =
        (isListVertical ? itemOffset.dy : itemOffset.dx / viewportDimension)
            .clamp(0, 1);
    final verticalAlignment = isListVertical
        ? Alignment(0.0, scrollFraction * 2 - 1)
        : Alignment(scrollFraction * 2 - 1, 0);
    final imageBox = keyImage.currentContext!.findRenderObject() as RenderBox;
    final childRect =
        verticalAlignment.inscribe(imageBox.size, Offset.zero & context.size);

    context.paintChild(
      0,
      transform: Transform.translate(
        offset: isListVertical
            ? Offset(
                0,
                childRect.top,
              )
            : Offset(
                childRect.left,
                0,
              ),
      ).transform,
    );
  }

  @override
  bool shouldRepaint(ParallaxFlowDelegate oldDelegate) {
    return scrollable != oldDelegate.scrollable ||
        itemContext != oldDelegate.itemContext ||
        keyImage != oldDelegate.keyImage;
  }
}

class ParallaxFlowDelegateVertical extends FlowDelegate {
  ParallaxFlowDelegateVertical({
    required this.scrollable,
    required this.listItemContext,
    required this.backgroundImageKey,
  }) : super(repaint: scrollable.position);

  final ScrollableState scrollable;
  final BuildContext listItemContext;
  final GlobalKey backgroundImageKey;

  @override
  BoxConstraints getConstraintsForChild(int i, BoxConstraints constraints) {
    return BoxConstraints.tightFor(
      width: constraints.maxWidth,
    );
  }

  @override
  void paintChildren(FlowPaintingContext context) {
    final scrollableBox = scrollable.context.findRenderObject() as RenderBox;
    final listItemBox = listItemContext.findRenderObject() as RenderBox;
    final listItemOffset = listItemBox.localToGlobal(
        listItemBox.size.centerLeft(Offset.zero),
        ancestor: scrollableBox);
    final viewportDimension = scrollable.position.viewportDimension;
    final scrollFraction =
        (listItemOffset.dy / viewportDimension).clamp(0.0, 1.0);
    final verticalAlignment = Alignment(0.0, scrollFraction * 2 - 1);
    final backgroundSize =
        (backgroundImageKey.currentContext!.findRenderObject() as RenderBox)
            .size;
    final listItemSize = context.size;
    final childRect =
        verticalAlignment.inscribe(backgroundSize, Offset.zero & listItemSize);
    context.paintChild(
      0,
      transform: Transform.translate(
        offset: Offset(0.0, childRect.top),
      ).transform,
    );
  }

  @override
  bool shouldRepaint(ParallaxFlowDelegateVertical oldDelegate) {
    return scrollable != oldDelegate.scrollable ||
        listItemContext != oldDelegate.listItemContext ||
        backgroundImageKey != oldDelegate.backgroundImageKey;
  }
}
