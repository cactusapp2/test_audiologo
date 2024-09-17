import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_audiologo/admin.dart';
import 'package:form_audiologo/constants.dart';
import 'package:form_audiologo/usuario.dart';
import 'package:form_audiologo/widgets/mywdgbutton.dart';
import 'package:form_audiologo/widgets/mywdgdialogloading.dart';
import 'package:form_audiologo/widgets/mywdgtextfield.dart';
import 'package:form_audiologo/widgets/snackbar.dart';

class MyFormularioPage extends StatefulWidget {
  const MyFormularioPage({super.key});

  @override
  State<MyFormularioPage> createState() => _MyFormularioPageState();
}

class _MyFormularioPageState extends State<MyFormularioPage> {

  //TextEditingController controller = TextEditingController();
  TextEditingController controllerNombre = TextEditingController();
  TextEditingController controllerApellido = TextEditingController();
  TextEditingController controllerCorreo = TextEditingController();
  TextEditingController controllerTelegram = TextEditingController();
  TextEditingController controllerCuenta = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  TextEditingController controllerMonto = TextEditingController();

  Future<void> subirUsuario() async{

    myWdgDialogLoading(context: context);

    try{

      await FirebaseFirestore.instance.collection("usuarios").add(
        {
          "nombre" : controllerNombre.text,
          "apellido": controllerApellido.text,
          "correo" : controllerCorreo.text,
          "usuario_telegram" : controllerTelegram.text,
          "cuenta": controllerCuenta.text,
          "clave" : controllerPassword.text,
          "monto" : controllerMonto.text,
          "fecha_registro" : Timestamp.now(),
          
        }
      );

      Navigator.pop(context);
      showSnackBar(context: context, title: "Formulario Completado", text: "Se ingresaron todos los datos");

    }catch(e){
      Navigator.pop(context);
      showSnackBar(context: context, title: "Formulario Completado", text: "Se ingresaron todos los datos");

      
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myClrBackground,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width > 1000 ? 1000 :  MediaQuery.of(context).size.width,            
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                vertical: 80,
                horizontal: 20
              ),
              child: Column(
                children: [
                  Text.rich(            
                    TextSpan(
                      text: "Registro",
                      style: TextStyle(
                        color: myClrFont,
                      ),
                      children: [
                        TextSpan(
                          text: " Fase 1",
                          style: TextStyle(
                            color: myClrPrimary,
                            fontWeight: FontWeight.w900
                          )
                        )
                      ]              
                    ),
                    style: const TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w900
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Text(
                    "Esto puede hacer la diferencia para que te conviertas en un trader rentable",
                    style: TextStyle(
                      color: myClrFont,
                      fontWeight: FontWeight.w100
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Divider(
                    color: myClrShadow,
                  ),
                  const SizedBox(height: 10,),
                  MyWdgTextField(
                    title: "Nombre",
                    iconData: FontAwesomeIcons.user,
                    controller: controllerNombre,
                    hintText: "Ej: Luis",                    
                  ),
                  const SizedBox(height: 10,),
                  MyWdgTextField(
                    title: "Apellido",
                    iconData: FontAwesomeIcons.user,
                    controller: controllerApellido, 
                    hintText: "Ej: Ruiz",                    
                  ),
                  const SizedBox(height: 10,),
                  MyWdgTextField(
                    title: "Correo",
                    iconData: FontAwesomeIcons.envelope,
                    controller: controllerCorreo,
                    hintText: "Ej: trader@gmail.com", 
                  ),
                  const SizedBox(height: 10,),
                  MyWdgTextField(
                    title: "Usuario Telegram",
                    iconData: FontAwesomeIcons.telegram,
                    controller: controllerTelegram,
                    hintText: "Ej: LuisRuiz",                     
                  ),
                  const SizedBox(height: 10,),
                  MyWdgTextField(
                    title: "Cuenta",
                    iconData: FontAwesomeIcons.idCardClip,
                    controller: controllerCuenta,
                    hintText: "Ej: 123301",                     
                  ),
                  const SizedBox(height: 10,),
                  MyWdgTextField(
                    title: "Password",
                    iconData: FontAwesomeIcons.lock,
                    controller: controllerPassword,
                    hintText: "Ej: ********",                     
                    //hintText: true,
                    isObscure: true,
                  ),
                  const SizedBox(height: 10,),
                  MyWdgTextField(
                    title: "Monto",
                    iconData: FontAwesomeIcons.dollarSign,
                    controller: controllerMonto, 
                    hintText: "Ej: 2000000",                                        
                  ),

                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: 160,
                        child: MyWdgButton(
                          text: "Limpiar",
                          color: myClrBackground,
                          onPressed: (){
                            controllerApellido.clear();
                            controllerCorreo.clear();
                            controllerCuenta.clear();
                            controllerMonto.clear();
                            controllerNombre.clear();
                            controllerPassword.clear();
                            controllerTelegram.clear();
                            
                          },
                        )
                      ),
                      SizedBox(
                        width: 160,
                        child: MyWdgButton(
                          text: "Enviar",
                          color: myClrPrimary,
                          onPressed: subirUsuario,
                        )
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: 150,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: 160,
                        child: MyWdgButton(
                          text: "Administrador",
                          color: myClrPrimary,
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return MyAdminPage();
                            },));
                          },
                        )
                      ),
                      SizedBox(
                        width: 160,
                        child: MyWdgButton(
                          text: "Usuario",
                          color: myClrPrimary,
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return MyUsuarioPage();
                            },));
                          },
                          
                        )
                      ),
                    ],
                  )

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}