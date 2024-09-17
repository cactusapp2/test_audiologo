import 'package:bounce/bounce.dart';
import 'package:flutter/widgets.dart';

class MyWdgButtonIcon extends StatefulWidget {
  final Color? colorIcon;
  final Color? colorButton;
  final IconData iconData;
  final VoidCallback? onPressed;
  final double size;
  const MyWdgButtonIcon({super.key, this.size = 35 ,required this.iconData, this.onPressed, this.colorIcon, this.colorButton});

  @override
  State<MyWdgButtonIcon> createState() => _MyWdgButtonIconState();
}

class _MyWdgButtonIconState extends State<MyWdgButtonIcon> {
  @override
  Widget build(BuildContext context) {
    return Bounce(
      child: GestureDetector(
        onTap: () {
          if(widget.onPressed != null){
            widget.onPressed!();
          }
        },
        child: Container(
          width: widget.size,
          height: widget.size,
          decoration: BoxDecoration(
            color: widget.colorButton ?? const Color.fromARGB(255, 78, 78, 78),
            shape: BoxShape.circle,
            
          ),
          child: Center(
            child: Icon(
              widget.iconData,
              size: 20,
              color: widget.colorIcon ?? const Color.fromARGB(255, 255, 255, 255),
            ),
          ),
        )
      ) 
    );
  }
}