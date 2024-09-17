import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';

class MyWdgButton extends StatefulWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color? color;
  final Color? colorFont;
  final double size;
  const MyWdgButton({super.key,this.size = 15, required this.text, this.onPressed, this.color, this.colorFont});

  @override
  State<MyWdgButton> createState() => _MyWdgButtonState();
}

class _MyWdgButtonState extends State<MyWdgButton> {
  @override
  Widget build(BuildContext context) {

    return Bounce(
      tapDelay: Duration.zero,
      tilt: false,
      cursor: MaterialStateMouseCursor.clickable,
      child: GestureDetector(
        onTap: () {
          if(widget.onPressed != null){
            widget.onPressed!();
          }
          
        },
        child: Row(
          children: [
            Expanded(
              child: Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 30
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: widget.color ?? const Color.fromARGB(255, 78, 78, 78),
                  ),
                  child: Center(
                    child: Text(
                      widget.text,
                      style: TextStyle(
                        color: widget.colorFont ?? Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: widget.size
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
    
  }
}