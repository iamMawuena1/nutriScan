import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final void Function()? onTap;
  final Widget child;
  const MyButton({
    super.key,
    required this.onTap,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(12.0),
          ),
          padding: const EdgeInsets.all(20.0),
          child: child,
        ),
      ),
    );
  }
}
