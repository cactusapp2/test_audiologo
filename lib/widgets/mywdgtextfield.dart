import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_audiologo/constants.dart';

class MyWdgTextField extends StatefulWidget {
  final String? title;
  final String? hintText;
  final TextEditingController? controller;
  final bool isObscure;
  final IconData? iconData;
  final Function(String value)? onChanged;
  final VoidCallback? onClipBoardPressed;
  final VoidCallback? onQrPressed;
  final TextInputType keyboardType;
  const MyWdgTextField({super.key, this.title, this.hintText, this.controller, this.onChanged, this.iconData,  this.onClipBoardPressed, this.onQrPressed, this.keyboardType = TextInputType.name, this.isObscure = false});

  @override
  State<MyWdgTextField> createState() => _MyWdgTextFieldState();
}

class _MyWdgTextFieldState extends State<MyWdgTextField> {

  bool isActive = false;
  bool obscure = true;
  FocusNode focusNode = FocusNode();

  @override
  void initState() {
    focusNode.addListener(() {
      setState(() {
        isActive = focusNode.hasFocus;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if(widget.title != null)
        Text(
          widget.title!,
          style:  TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
            color: myClrFontLight
          ),
        ),
        const SizedBox(height: 10,),
        Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: myClrBackgroundCard,
                ),
                padding:const EdgeInsets.only(left: 10),
                child: Row(
                  children: [
                    if(widget.iconData != null)Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Icon(
                        widget.iconData,
                        size: 18,
                        color: !isActive ? myClrFontLight : myClrPrimary,
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        focusNode: focusNode,
                        controller: widget.controller,
                        obscureText: widget.isObscure ? obscure : false,
                        keyboardType: widget.keyboardType,
                        style: TextStyle(
                          color: myClrFont
                        ),
                        decoration: InputDecoration(
                          hintText: widget.hintText,
                          hintStyle:  TextStyle(
                            color: myClrFontLight.withAlpha(50),
                            fontWeight: FontWeight.normal
                          ),
                          border: InputBorder.none,
                          fillColor: Colors.red,
                          hoverColor: Colors.red,
                          focusColor: myClrPrimary
                        ),
                        onChanged: (value) {
                          if(widget.onChanged != null){
                            widget.onChanged!(value);
                          }
                        },
                      ),
                    ),
                    if(widget.isObscure)
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          obscure = !obscure;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Icon(
                          obscure ? FontAwesomeIcons.eyeSlash : FontAwesomeIcons.eye,
                          color: obscure ? myClrPrimary :myClrFontLight,
                          size: 20,
                        )
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}