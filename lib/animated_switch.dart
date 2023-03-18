import 'package:flutter/material.dart';

class AnimatedSwitch extends StatefulWidget {
  final double size;
  final Function(bool) onTap;
  const AnimatedSwitch({
    super.key,
    this.size = 50,
    required this.onTap,
  });

  @override
  State<AnimatedSwitch> createState() => _AnimatedSwitchState();
}

class _AnimatedSwitchState extends State<AnimatedSwitch> {
  bool isOn = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      height: widget.size,
      width: widget.size * 2,
      alignment: isOn ? Alignment.centerRight : Alignment.centerLeft,
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(widget.size),
        color: isOn ? Colors.green : Colors.red,
      ),
      child: GestureDetector(
        onTap: () => setState(() {
          isOn = !isOn;
          widget.onTap(isOn);
        }),
        child: CircleAvatar(
          radius: widget.size / 2,
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}
