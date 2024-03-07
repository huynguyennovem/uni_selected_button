import 'package:flutter/material.dart';

class FlexWithSpace {
  final List<Widget> children;
  final double spacing;
  final Axis axis;

  const FlexWithSpace({
    Key? key,
    required this.axis,
    required this.children,
    this.spacing = 8.0,
  });

  Widget build() {
    final isVertical = axis == Axis.vertical;
    SizedBox sizedBox = isVertical ? SizedBox(height: spacing) : SizedBox(width: spacing);
    final spacedChildren = <Widget>[];
    for (int i = 0; i < children.length; i++) {
      spacedChildren.add(children[i]);
      if (i != children.length - 1) {
        spacedChildren.add(sizedBox);
      }
    }
    return isVertical
      ? Column(
          mainAxisSize: MainAxisSize.min,
          children: spacedChildren,
        )
      : Row(
          mainAxisSize: MainAxisSize.min,
          children: spacedChildren,
        );
  }
}
