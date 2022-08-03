import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.onTap,
    this.icon,
    this.text,
    this.color,
    this.iconColor,
  });

  final VoidCallback onTap;
  final IconData? icon;
  final String? text;
  final Color? color;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 20.75.w,
      height: 20.75.w,
      child: Card(
        color: color,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(100),
          onTap: () async {
            await HapticFeedback.vibrate();
            onTap();
          },
          child: Center(
            widthFactor: 1,
            child: text != null
                ? Text(
                    text!,
                    style: TextStyle(
                      fontSize: 24,
                      color: iconColor,
                    ),
                  )
                : Icon(
                    icon ?? Icons.add,
                    color: iconColor,
                  ),
          ),
        ),
      ),
    );
  }
}
