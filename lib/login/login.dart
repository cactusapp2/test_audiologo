import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_audiologo/constants.dart';
import 'package:form_audiologo/widgets/mywdgbutton.dart';
import 'package:form_audiologo/widgets/mywdgtextfield.dart';


class MyLoginPage extends StatefulWidget {
  const MyLoginPage({super.key});

  @override
  State<MyLoginPage> createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {

  bool recordar = true;
  TextEditingController controllerNumero = TextEditingController();
  TextEditingController controllerClave = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myClrBackground,      
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding:const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              Text(
                "Iniciar Sesión",
                textScaler: TextScaler.linear(1.6),
                style: TextStyle(
                  color: myClrFont,
                  fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(height: 10,),
               Text(
                "Inicia sesión para gestionar tus planes de inversión y se parte de nuestra compañía.",
                //textScaler: TextScaler.linear(),
                style: TextStyle(
                  color: myClrFont,
                ),
              ),
              const SizedBox(height: 10,),
              MyWdgTextField(
                title: "Número",
                hintText: "3103456574",
                controller: controllerNumero,
                iconData: FontAwesomeIcons.phone,              
              ),
              const SizedBox(height: 30,),
              MyWdgTextField(
                title: "Clave",
                hintText: "···········",
                controller: controllerClave,
                iconData: FontAwesomeIcons.lock,              
                isObscure: true,
              ),
              const SizedBox(height: 30,),
              Row(
                children: [
                  Checkbox(
                    value: recordar,
                    activeColor: myClrPrimary,
                    onChanged: (value){
                      setState(() {
                        recordar = value ?? false;
                      });
                    }
                  ),
                   Text(
                    "Recordarme",
                    style: TextStyle(
                      color: myClrFont,
                    ),
                  ),
                  const Spacer(),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              MyWdgButton(
                text: "Iniciar Sesión",
                color: myClrPrimary,
                onPressed: () async {
                  //await login();
                },
              ),
              const Spacer(),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}