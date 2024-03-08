import 'package:flutter/material.dart';
import 'flex_with_space.dart';

class UniButtonGroup extends StatefulWidget {
  const UniButtonGroup({
    super.key,
    required this.children,
    this.axis = Axis.horizontal,
    this.showScrollbar = false,
  });

  final Axis axis;
  final List<Widget> children;
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

  buildHorizontalLayout() => SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: FlexWithSpace(axis: Axis.horizontal, children: widget.children)
            .build(),
      );

  buildVerticalLayout() => SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: FlexWithSpace(axis: Axis.vertical, children: widget.children)
            .build(),
      );
}
