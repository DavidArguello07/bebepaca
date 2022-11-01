import 'package:flutter/material.dart';

class BouncingWidget extends StatefulWidget {
  final Widget child;
  final VoidCallback? onPress;
  const BouncingWidget({super.key, required this.child, this.onPress});

  @override
  State<BouncingWidget> createState() => _BouncingWidgetState();
}

class _BouncingWidgetState extends State<BouncingWidget> with SingleTickerProviderStateMixin {
  late Animation<double> scale;
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 100));
    scale = Tween<double>(begin: 1.0, end: 0.85).animate(CurvedAnimation(parent: controller, curve: Curves.ease));
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (event) => controller.forward(),
      onPointerUp: (event) {
        controller.reverse();
        if (widget.onPress == null) return;
        widget.onPress!();
      },
      child: ScaleTransition(scale: scale, child: widget.child),
    );
  }
}
