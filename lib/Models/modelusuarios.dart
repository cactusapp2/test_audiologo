import 'package:cloud_firestore/cloud_firestore.dart';

class Usuario {
  String nombre;
  String apellido;
  String correo;
  String usuarioTelegram;
  String cuenta;
  String clave;
  String monto;
  DateTime fechaRegistro;
  DateTime? finalizoFase1; // Atributo opcional

  Usuario({
    required this.nombre,
    required this.apellido,
    required this.correo,
    required this.usuarioTelegram,
    required this.cuenta,
    required this.clave,
    required this.monto,
    required this.fechaRegistro,
    this.finalizoFase1, // Atributo opcional
  });

  // Método para convertir un objeto Usuario a un mapa (para Firestore)
  Map<String, dynamic> toMap() {
    return {
      'nombre': nombre,
      'apellido': apellido,
      'correo': correo,
      'usuario_telegram': usuarioTelegram,
      'cuenta': cuenta,
      'clave': clave,
      'monto': monto,
      'fecha_registro': fechaRegistro,
      'finalizo_fase1': finalizoFase1, // Puede ser null o no estar presente
    };
  }

  // Método para crear un objeto Usuario desde un mapa (desde Firestore)
  factory Usuario.fromMap(Map<String, dynamic> map) {
    return Usuario(
      nombre: map['nombre'] ?? '',
      apellido: map['apellido'] ?? '',
      correo: map['correo'] ?? '',
      usuarioTelegram: map['usuario_telegram'] ?? '',
      cuenta: map['cuenta'] ?? '',
      clave: map['clave'] ?? '',
      monto: map['monto'] ?? '',
      fechaRegistro: (map['fecha_registro'] as Timestamp).toDate(),
      finalizoFase1: map['finalizo_fase1'] != null
          ? (map['finalizo_fase1'] as Timestamp).toDate()
          : null,
    );
  }
}
