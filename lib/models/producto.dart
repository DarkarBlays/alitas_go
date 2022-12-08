class Producto {
  final String IdProducto;
  final String Nombre;
  final String Precio;
  final String Cantidad;
  final String Descripcion;
  final String Acompanamiento;
  final String FechaRegistro;


  Producto({
    required this.IdProducto,
    required this.Nombre,
    required this.Precio,
    required this.Cantidad,
    required this.Descripcion,
    required this.Acompanamiento,
    required this.FechaRegistro,
  });

  factory Producto.fromJson(Map<String, dynamic> json) {
    return Producto(
      IdProducto: json['IdProducto'],
      Nombre: json['Nombre'],
      Precio: json['Precio'],
      Cantidad: json['Cantidad'],
      Descripcion: json['Descripcion'],
      Acompanamiento: json['Acompanamiento'],
      FechaRegistro: json['FechaRegistro'],

    );
  }
}
