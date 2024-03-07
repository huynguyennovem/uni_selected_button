import 'package:flutter/material.dart';

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

  final Widget icon;
  final Widget label;

  final T value;
  final T groupValue;

  final Color borderColor;
  final Color hoverColor;
  final Color backgroundColor;
  final Color selectedBorderColor;

  final double borderRadius;
  final double borderWidth;
  final double iconLabelDistance;
  final double width;
  final double height;

  final EdgeInsets padding;
  final Function(T)? onPressed;
  final List<BoxShadow>? boxShadows;
  final Alignment alignment;
  final bool syncBoxShadowsWithBorder;

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
    _selectable = widget.groupValue != widget.value;
    _borderColor = !_selectable ? widget.selectedBorderColor : widget.borderColor;
  }

  @override
  Widget build(BuildContext context) {
    _selectable = widget.groupValue != widget.value;
    _borderColor = !_selectable ? widget.selectedBorderColor : widget.borderColor;

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

  void _onPressed() {
    if (!_selectable) {
      return;
    }
    setState(() {
      _borderColor = widget.selectedBorderColor;
    });
    if (widget.onPressed != null) {
      widget.onPressed!(widget.value);
    }
  }
}
