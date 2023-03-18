import 'package:flutter/material.dart';

class AnimatedCircle extends AnimatedWidget {
  final Animation<double> animation;
  const AnimatedCircle({
    super.key,
    required this.animation,
  }) : super(listenable: animation);

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: animation.value,
      child: PhysicalModel(
        color: Colors.black12,
        elevation: 5,
        shape: BoxShape.circle,
        child: CircleAvatar(
          radius: 50,
          backgroundColor: animation.isDismissed ? Colors.red : Colors.green,
          child: const Text(
            'Rotate',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ),
    );
  }
}
