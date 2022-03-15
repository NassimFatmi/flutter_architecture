import 'package:flutter/material.dart';

class GacelaButton extends StatelessWidget {
  final void Function()? onPressed;
  final Widget? child;
  const GacelaButton({Key? key, required this.child, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
      child: child,
      onPressed: onPressed,
    );
  }
}
