class Transaccion {
  final TransaccionType tipo;
  final double monto;
  final String descripcion;

  Transaccion({
    required this.tipo,
    required this.monto,
    required this.descripcion,
  });
}

enum TransaccionType { ingreso, gasto }
