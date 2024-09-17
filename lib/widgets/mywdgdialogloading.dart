import 'package:flutter/material.dart';

void myWdgDialogLoading({required BuildContext context}) {
  showDialog(
    context: context,
    useSafeArea: false,
    useRootNavigator: false,
    barrierColor: const Color.fromARGB(255, 243, 33, 187).withAlpha(40),
    barrierDismissible: false, // Impide que se pueda cerrar tocando fuera del diálogo
    builder: (BuildContext context) {
      return PopScope(
        canPop: false,
        child: AlertDialog(
          surfaceTintColor: Colors.transparent,
          title: Text("Cargando"),
          content: 
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(
                  color: Colors.purple,
                ),
              ],
            ),
        )
        
      )
      ;
    },
  );
  
}