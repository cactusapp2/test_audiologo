import 'package:flutter/material.dart';
import 'package:form_audiologo/Models/modelusuarios.dart';
import 'package:form_audiologo/constants.dart';
import 'package:form_audiologo/widgets/mywdgbutton.dart';

class MyWdgCardUserAdmin extends StatefulWidget {
  final Usuario usuario;
  final VoidCallback onPressedFase1;
  const MyWdgCardUserAdmin({super.key, required this.usuario,required this.onPressedFase1});

  @override
  State<MyWdgCardUserAdmin> createState() => _MyWdgCardUserAdminState();
}

class _MyWdgCardUserAdminState extends State<MyWdgCardUserAdmin> {
  @override
  Widget build(BuildContext context) {
    return Container(   
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: myClrFont,
        borderRadius: BorderRadius.circular(5)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Nombre completo del usuario
          Text(
            '${widget.usuario.nombre} ${widget.usuario.apellido}',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
            
          // Correo electrónico
          Row(
            children: [
              Icon(Icons.email, color: myClrPrimary),
              const SizedBox(width: 8),
              Text(
                widget.usuario.correo,
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
          const SizedBox(height: 8),
            
          // Usuario de Telegram
          Row(
            children: [
               Icon(Icons.telegram, color: myClrPrimary),
              const SizedBox(width: 8),
              Text(
                widget.usuario.usuarioTelegram.isNotEmpty
                    ? widget.usuario.usuarioTelegram
                    : 'No proporcionado',
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
          const SizedBox(height: 8),
            
          // Número de cuenta
          Row(
            children: [
               Icon(Icons.account_balance, color: myClrPrimary),
              const SizedBox(width: 8),
              Text(
                widget.usuario.cuenta,
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
          const SizedBox(height: 8),
            
          // Monto
          Row(
            children: [
               Icon(Icons.attach_money, color: myClrPrimary),
              const SizedBox(width: 8),
              Text(
                'Saldo: \$${widget.usuario.monto}',
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
          const SizedBox(height: 8),
            
          // Fecha de registro
          Row(
            children: [
               Icon(Icons.date_range, color: myClrPrimary),
              const SizedBox(width: 8),
              Text(
                'Registrado el: ${widget.usuario.fechaRegistro.day}/${widget.usuario.fechaRegistro.month}/${widget.usuario.fechaRegistro.year}',
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
          const SizedBox(height: 8),
            
          // Fase 1 completada
          Row(
            children: [
               Icon(Icons.check_circle, color: myClrPrimary),
              const SizedBox(width: 8),
              Text(
                widget.usuario.finalizoFase1 != null
                    ? 'Fase 1 Completada: ${widget.usuario.finalizoFase1!.day}/${widget.usuario.finalizoFase1!.month}/${widget.usuario.finalizoFase1!.year}'
                    : 'Fase 1 No Completada',
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
            
          const SizedBox(height: 16),
            
          // Botón de acción (puedes personalizar según sea necesario)
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                width: 200,
                child: MyWdgButton(
                  text: widget.usuario.finalizoFase1 != null ? "Fase 1, Finalizada" : "Finalizar",
                  color: widget.usuario.finalizoFase1 == null ? myClrPrimary :  myClrBackground,
                  onPressed: (){
                    if(widget.usuario.finalizoFase1 == null){
                      widget.onPressedFase1();
                    }
                  }
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
