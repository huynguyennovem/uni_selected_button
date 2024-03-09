import 'package:flutter/material.dart';

/// Flex (Column/Row) with space between children.
class FlexWithSpace {
  // List children to be spaced.
  final List<Widget> children;

  // Spacing between children.
  final double spacing;

  // It should be a Column or a Row only.
  final Axis axis;

  const FlexWithSpace({
    Key? key,
    required this.children,
    this.spacing = 8.0,
    this.axis = Axis.horizontal,
  });

  // Loop through the children and add a SizedBox between them.
  // If the axis is vertical, return a Column, else return a Row.
  Widget build() {
    final isVertical = axis == Axis.vertical;
    SizedBox sizedBox =
        isVertical ? SizedBox(height: spacing) : SizedBox(width: spacing);
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
