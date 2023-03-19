import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tabbar/provider.dart';

class RiverPodSwitch extends ConsumerStatefulWidget {
  final double size;
  const RiverPodSwitch({
    super.key,
    this.size = 50,
  });

  @override
  ConsumerState<RiverPodSwitch> createState() => _RiverPodSwitchState();
}

class _RiverPodSwitchState extends ConsumerState<RiverPodSwitch> {
  @override
  Widget build(BuildContext context) {
    final isOn = ref.watch(switchProvider);
    return GestureDetector(
      onTap: () {
        ref.read(switchProvider.notifier).toogle(!isOn);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        height: widget.size,
        width: widget.size * 2,
        alignment: isOn ? Alignment.centerRight : Alignment.centerLeft,
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.size),
          color: isOn ? Colors.green : Colors.red,
        ),
        child: CircleAvatar(
          radius: widget.size / 2,
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}
