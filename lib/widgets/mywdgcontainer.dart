import 'package:flutter/material.dart';

class MyWdgContainer extends StatefulWidget {
  final Widget child;
  final double? width;
  final double? height;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Color? color;
  const MyWdgContainer({super.key, required this.child,  this.width,  this.height, this.padding, this.margin, this.color});

  @override
  State<MyWdgContainer> createState() => _MyWdgContainerState();
}

class _MyWdgContainerState extends State<MyWdgContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      padding: widget.padding,
      margin: widget.margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: widget.color ?? Colors.white,
        boxShadow: const [
          BoxShadow(
            blurRadius: 20,
            color: Color.fromARGB(19, 0, 0, 0),
            offset: Offset(0, 20)
          )
        ]
      ),
      child: widget.child,

    );
  }
}