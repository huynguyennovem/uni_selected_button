import 'package:flutter/material.dart';

/// Parent widget for a group of buttons.
/// This organizes the buttons in a horizontal or vertical layout with [axis] parameter.
class UniButtonGroup extends StatefulWidget {
  const UniButtonGroup({
    super.key,
    required this.children,
    this.axis = Axis.horizontal,
    this.showScrollbar = false,
    this.spacing = 8.0,
  });

  // The axis of the layout. It can be horizontal (Row) or vertical (Column).
  final Axis axis;

  // List of buttons to be organized.
  final List<Widget> children;

  // By default, SingleChildScrollView will has a scrollbar.
  // Use this parameter to show or hide the scrollbar.
  final bool showScrollbar;

  // Spacing between children.
  final double spacing;

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
        child: Row(spacing: widget.spacing, children: widget.children),
      );

  // When the axis is vertical, the buttons are organized in a column.
  buildVerticalLayout() => SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(spacing: widget.spacing, children: widget.children),
      );
}
