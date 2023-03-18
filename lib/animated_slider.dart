import 'package:flutter/material.dart';

class AnimatedSlider extends StatefulWidget {
  final Function(double) onTap;
  const AnimatedSlider({super.key, required this.onTap});

  @override
  State<AnimatedSlider> createState() => _AnimatedSliderState();
}

class _AnimatedSliderState extends State<AnimatedSlider> {
  double initialValue = 0;
  double pos = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Slider(
          value: initialValue,
          onChanged: (double val) {
            widget.onTap(val);
            setState(() {
              initialValue = val;
            });
          },
        ),
        // Container(
        //   width: MediaQuery.of(context).size.width * 0.9,
        //   height: 50,
        //   alignment: Alignment.centerLeft,
        //   decoration: BoxDecoration(
        //     color: Colors.red,
        //     borderRadius: BorderRadius.circular(50),
        //   ),
        //   child: Row(
        //     children: [
        //       AnimatedContainer(
        //         width: pos,
        //         duration: const Duration(seconds: 1),
        //       ),
        //       GestureDetector(
        //         onPanUpdate: (details) {
        //           // Swiping in right direction.
        //           if (details.delta.dx > 0) {
        //             print(details.delta);
        //           }

        //           // Swiping in left direction.
        //           if (details.delta.dx < 0) {
        //             print(details.delta);
        //           }
        //           setState(() {
        //             pos = details.delta.dx;
        //           });
        //         },
        //         child: const CircleAvatar(
        //           radius: 25,
        //           backgroundColor: Colors.white60,
        //         ),
        //       ),
        //     ],
        //   ),
        // )
      ],
    );
  }
}
