import 'package:flutter/material.dart';
import 'flex_with_space.dart';

/// Parent widget for a group of buttons.
/// This organizes the buttons in a horizontal or vertical layout with [axis] parameter.
class UniButtonGroup extends StatefulWidget {
  const UniButtonGroup({
    super.key,
    required this.children,
    this.axis = Axis.horizontal,
    this.showScrollbar = false,
  });

  // The axis of the layout. It can be horizontal (Row) or vertical (Column).
  final Axis axis;

  // List of buttons to be organized.
  final List<Widget> children;

  // By default, SingleChildScrollView will has a scrollbar.
  // Use this parameter to show or hide the scrollbar.
  final bool showScrollbar;

  @override
  State<UniButtonGroup> createState() => _UniButtonGroupState();
}

class _UniButtonGroupState extends State<UniButtonGroup> {
  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context)
          .copyWith(scrollbars: widget.showScrollbar),
      child: widget.axis == Axis.horizontal
          ? buildHorizontalLayout()
          : buildVerticalLayout(),
    );
  }

  // When the axis is horizontal, the buttons are organized in a row.
  buildHorizontalLayout() => SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: FlexWithSpace(axis: Axis.horizontal, children: widget.children)
            .build(),
      );

  // When the axis is vertical, the buttons are organized in a column.
  buildVerticalLayout() => SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: FlexWithSpace(axis: Axis.vertical, children: widget.children)
            .build(),
      );
}
