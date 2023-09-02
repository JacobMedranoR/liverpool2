import 'package:flutter/material.dart';

class puntitos_widget extends StatelessWidget {
  final int position;

  const puntitos_widget({
    super.key,
    required this.position,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 8.0,
          height: 8.0,
          decoration: new BoxDecoration(
            color: position == 1
                ? Color.fromARGB(255, 245, 82, 223)
                : Color.fromARGB(255, 195, 191, 193),
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(
          width: 7,
        ),
        Container(
          width: 8.0,
          height: 8.0,
          decoration: new BoxDecoration(
            color: position == 2
                ? Color.fromARGB(255, 245, 82, 223)
                : Color.fromARGB(255, 195, 191, 193),
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(
          width: 7,
        ),
        Container(
          width: 8.0,
          height: 8.0,
          decoration: new BoxDecoration(
            color: position == 3
                ? Color.fromARGB(255, 245, 82, 223)
                : Color.fromARGB(255, 195, 191, 193),
            shape: BoxShape.circle,
          ),
        )
      ],
    );
  }
}
