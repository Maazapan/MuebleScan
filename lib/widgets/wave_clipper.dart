import 'package:flutter/material.dart';

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height); // Iniciar en la esquina inferior izquierda

    var firstStart =
        Offset(size.width / 4, size.height); // Primer punto de control
    var firstEnd = Offset(size.width / 2.25,
        size.height - 30.0); // Primer punto final de la curva
    path.quadraticBezierTo(firstStart.dx, firstStart.dy, firstEnd.dx,
        firstEnd.dy); // Curva Bézier cuadrática

    var secondStart = Offset(size.width - (size.width / 3.25),
        size.height - 65); // Segundo punto de control
    var secondEnd =
        Offset(size.width, size.height - 40); // Segundo punto final de la curva
    path.quadraticBezierTo(secondStart.dx, secondStart.dy, secondEnd.dx,
        secondEnd.dy); // Curva Bézier cuadrática

    path.lineTo(size.width, 0); // Terminar en la esquina superior derecha
    path.close(); // Cerrar el trazado

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false; // No hay necesidad de redibujar la curva si no ha cambiado
  }
}
