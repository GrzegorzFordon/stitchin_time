import 'package:flutter/material.dart';

class BaseButton extends StatelessWidget {
  final bool isActive;
  final ThemeData themeData;
  final VoidCallback tapCallback;
  final VoidCallback? longPressCallback;
  final IconData iconData;
  final int? size;
  final bool tapOnLongPress;
  final String tooltipText;

  const BaseButton({
    super.key,
    required this.isActive,
    required this.themeData,
    required this.tapCallback,
    this.longPressCallback,
    required this.iconData,
    this.size,
    this.tapOnLongPress = true,
    this.tooltipText="",
  });

  @override
  Widget build(BuildContext context) {
    (Color, Color) buttonTheme = isActive
        ? (themeData.colorScheme.primary, themeData.colorScheme.onPrimary)
        : (themeData.colorScheme.secondaryContainer, themeData.colorScheme.onSecondaryContainer);
    return GestureDetector(
      onLongPress: () {
        if (longPressCallback != null) longPressCallback!();
        if (tapOnLongPress) tapCallback();
      },
      child: Container(
        width: (size ?? 64).toDouble(),
        height: (size ?? 64).toDouble(),
        decoration: BoxDecoration(color: buttonTheme.$1, borderRadius: BorderRadius.circular(5)),
        child: IconButton(
          onPressed: tapCallback,
          icon: Icon(iconData, color: buttonTheme.$2),
          tooltip: tooltipText,
        ),
      ),
    );
  }
}
