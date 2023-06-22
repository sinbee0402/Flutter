import 'package:flutter/material.dart';

class ElevatedBtn extends StatefulWidget {
  IconData icon;
  String food;

  ElevatedBtn({
    Key? key,
    required this.icon,
    required this.food,
  }) : super(key: key);

  @override
  State<ElevatedBtn> createState() => _ElevatedBtnState();
}

class _ElevatedBtnState extends State<ElevatedBtn> {
  bool _isPressed = false;

  void _togglePressed() {
    setState(() {
      _isPressed = !_isPressed;
    });
  }

  @override
  Widget build(BuildContext context) {
    // 일정한 크기로 일정하게 서로 간격을 주고싶습니다.
    // padding이랑 Expanded를 써봤는데, Text의 글자가 줄바꿈이 되버리거나
    // button의 크기가 일정하게 주어지지 않습니다..
    return Expanded(
      child: ElevatedButton(
        onPressed: _togglePressed,
        style: ElevatedButton.styleFrom(
          primary: _isPressed ? const Color(0xff6B69C7) : Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Column(
          children: [
            Icon(
              widget.icon,
              size: 32,
            ),
            Text(widget.food),
          ],
        ),
      ),
    );
  }
}
