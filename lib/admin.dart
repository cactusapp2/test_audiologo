import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:form_audiologo/Models/modelusuarios.dart';
import 'package:form_audiologo/constants.dart';
import 'package:form_audiologo/widgets/mywdgcarduseradmin.dart';
import 'package:form_audiologo/widgets/mywdgdialogloading.dart';
import 'package:form_audiologo/widgets/snackbar.dart';

class MyAdminPage extends StatefulWidget {
  const MyAdminPage({super.key});

  @override
  State<MyAdminPage> createState() => _MyAdminPageState();
}

class _MyAdminPageState extends State<MyAdminPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myClrBackground,
      appBar: AppBar(),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("usuarios").snapshots(), 
        builder: (context, snapshot) {
          if(snapshot.hasData){
            List<DocumentSnapshot> docs = (snapshot.data)!.docs;
            return ListView.builder(
              itemCount: docs.length,
              itemBuilder: (context, index) {
                Usuario user = Usuario.fromMap(docs[index].data() as Map<String,dynamic>);
                return MyWdgCardUserAdmin(
                  usuario: user,
                  onPressedFase1: (){
                    myWdgDialogLoading(context: context);
                    try{
                      user.finalizoFase1 = DateTime.now() as DateTime?;
                      FirebaseFirestore.instance.collection("usuarios").doc(docs[index].id).update(
                        user.toMap()
                      );
                      Navigator.pop(context);
                      showSnackBar(context: context, text: "Actualizado", title: "Ya");
                    }catch(e){
                      Navigator.pop(context);
                       showSnackBar(context: context, text: "Actualizado", title: "Ya");
                    }
                  },
                );
              },
            );
          }else{
            return Center(
              child: CircularProgressIndicator(
                color: myClrPrimary,
              ),
            );
          }
        },
      )
    );
  }
}