import 'package:http/http.dart' as http;
import 'package:alitas_go/domain/controller/configurl.dart';

void AdicionarProducto(
  String Nombre,
  String Precio,
  String Descripcion,
  String Cantidad,
  String Acompanamiento,

) async {
  var url = Uri.parse(Url + "InsertarProducto.php");

  await http.post(url, body: {
    'Nombre': Nombre,
    'Precio':Precio,
    'Descripcion':Descripcion,
    'Cantidad':Cantidad,
    'Acompanamiento': Acompanamiento,
  });
}
