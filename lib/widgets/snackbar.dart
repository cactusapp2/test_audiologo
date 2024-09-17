import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_audiologo/constants.dart';
void showSnackBar({
  required BuildContext context,
  required String text,
  required String title,
}) {
  final messenger = ScaffoldMessenger.of(context);

  // Cierra el SnackBar actual si está visible
  messenger.removeCurrentSnackBar();

  messenger.showSnackBar(
    SnackBar(
      width: MediaQuery.of(context).size.width > 600
            ? 600
            : MediaQuery.of(context).size.width,
      showCloseIcon: true,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style:  TextStyle(
              color: myClrFont,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 4), // Espacio entre el título y el texto
          Text(
            text,
            style:  TextStyle(
              color: myClrFont,
              fontWeight: FontWeight.normal,
              fontSize: 14,
            ),
          ),
        ],
      ),
      behavior: SnackBarBehavior.floating, // Hace que el SnackBar flote sobre el contenido
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8), // Borde redondeado
      ),
      backgroundColor: myClrPrimary,

      duration: const Duration(seconds: 3), // Duración del SnackBar
    ),
  );
}
