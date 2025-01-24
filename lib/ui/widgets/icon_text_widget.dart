import 'package:dating_list/utils/extension/extended_context.dart';
import 'package:flutter/material.dart';

class IconTextWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final double fontSize;
  final double iconSize;
  final Color iconColor;

  const IconTextWidget(
      {super.key,
      required this.icon,
      required this.text,
      this.fontSize = 20,
      this.iconColor = Colors.black,
      this.iconSize = 25});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: iconColor,
          size: iconSize,
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          text,
          style: context.textTheme.titleLarge!.copyWith(fontSize: fontSize),
        )
      ],
    );
  }
}
