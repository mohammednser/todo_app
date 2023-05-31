import 'package:flutter/material.dart';

class OriginalButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;
  final Color textColor;

  const OriginalButton({Key key, this.text, this.onPressed, this.color, this.textColor}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      width: double.infinity,
      child: ElevatedButton(
  onPressed: onPressed,
  style: ElevatedButton.styleFrom(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(25),
    ),
    primary: color,
  ),
  child: Text(
    text,
    style: TextStyle(color: textColor, fontSize: 18),
  ),
)
    );
  }
}