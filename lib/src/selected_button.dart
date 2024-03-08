import 'package:flutter/material.dart';

/// Represents a selectable button with an icon and a label.
///
/// The button can be selected or unselected.
/// The button is selectable if the [groupValue] is different from the [value].
class SelectedButton<T> extends StatefulWidget {
  const SelectedButton({
    super.key,
    required this.label,
    required this.icon,
    required this.value,
    required this.groupValue,
    this.borderColor = Colors.black45,
    this.hoverColor = Colors.black26,
    this.backgroundColor = Colors.black54,
    this.selectedBorderColor = Colors.cyan,
    this.borderRadius = 4.0,
    this.borderWidth = 1.4,
    this.iconLabelDistance = 4.0,
    this.width = 100.0,
    this.height = 40.0,
    this.padding = const EdgeInsets.all(8.0),
    this.onPressed,
    this.boxShadows,
    this.alignment = Alignment.center,
    this.syncBoxShadowsWithBorder = false,
  }) : assert(
          boxShadows == null || !syncBoxShadowsWithBorder,
          'Cannot use boxShadows and syncBoxShadowsWithBorder at the same time.',
        );

  // The icon and label of the button.
  // They are in a row inside the button and are separated by [iconLabelDistance].
  final Widget icon;
  final Widget label;

  // Generic value of the button.
  // Comparing these values will determine if the button is selected or not.
  final T value;
  final T groupValue;

  // Border color is updated when the button is selected.
  final Color borderColor;

  // When the mouse is over the button, the background color is updated.
  final Color hoverColor;
  final Color backgroundColor;

  // Highlighted border color when the button is selected.
  final Color selectedBorderColor;

  // The border radius/width of the button.
  final double borderRadius;
  final double borderWidth;

  // The width between the icon and the label.
  final double iconLabelDistance;

  // The width and height of the button.
  final double width;
  final double height;

  // The padding from the border to the content of the button.
  final EdgeInsets padding;

  // The callback when the button is pressed.
  final Function(T)? onPressed;

  // The box shadows of the button.
  // If [syncBoxShadowsWithBorder] is true, the box shadows are synchronized with [borderColor]
  final List<BoxShadow>? boxShadows;
  final bool syncBoxShadowsWithBorder;

  // How the icon and label are aligned inside the button.
  final Alignment alignment;

  @override
  State<SelectedButton<T>> createState() => _SelectedButtonState<T>();
}

class _SelectedButtonState<T> extends State<SelectedButton<T>> {
  late Color _backgroundColor;
  late Color _borderColor;
  late bool _selectable;

  @override
  void initState() {
    super.initState();
    _backgroundColor = widget.backgroundColor;
  }

  @override
  Widget build(BuildContext context) {
    // other buttons than the selected one are selectable
    _selectable = widget.groupValue != widget.value;
    // change the border color if the button is selected
    _borderColor =
        !_selectable ? widget.selectedBorderColor : widget.borderColor;
    // on Desktop, change the background color when the mouse is over the button
    // the cursor changes to a hand when the mouse is over the button
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (event) {
        setState(() {
          _backgroundColor = widget.hoverColor;
        });
      },
      onExit: (event) {
        setState(() {
          _backgroundColor = widget.backgroundColor;
        });
      },
      child: GestureDetector(
        onTap: _onPressed,
        child: Container(
          alignment: widget.alignment,
          width: widget.width,
          height: widget.height,
          padding: widget.padding,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            border: Border.all(
              color: _borderColor,
              width: widget.borderWidth,
            ),
            color: _backgroundColor,
            boxShadow: widget.syncBoxShadowsWithBorder
                ? [
                    BoxShadow(
                      color: _borderColor,
                      blurRadius: 4.0,
                      spreadRadius: 0.0,
                      offset: const Offset(0.0, 0.0),
                    ),
                  ]
                : widget.boxShadows,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              widget.icon,
              SizedBox(width: widget.iconLabelDistance),
              widget.label,
            ],
          ),
        ),
      ),
    );
  }

  // Change the state of the button and call the onPressed callback.
  void _onPressed() {
    if (!_selectable) {
      return;
    }
    setState(() {});
    if (widget.onPressed != null) {
      widget.onPressed!(widget.value);
    }
  }
}
