import 'package:flutter/material.dart';

///Custom button widget
class SendButton extends StatelessWidget {
  ///Widget constructor
  const SendButton({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: const Color(0xff986D8E),
        borderRadius: BorderRadius.circular(30),
      ),
      child: const SizedBox(
        height: 55,
        width: double.infinity,
        child: Align(
          child: Text('Send',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
