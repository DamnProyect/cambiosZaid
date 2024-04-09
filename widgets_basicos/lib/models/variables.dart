import 'package:widgets_basicos/widgets/products.dart';

List<ProductWidget> listadoProductos = [];

List<String> listadoNombre = [
  'zanahoria',
  'lechuga',
  'espinaca',
  'brócoli',
  'pepino',
  'tomate',
  'pimiento',
  'calabacín',
  'apio',
  'coliflor',
  'berenjena',
  'judía verde',
  'acelga',
  'cebolla',
  'ajo',
  'puerro',
  'rábano',
  'remolacha',
  'calabaza',
  'champiñón'
];

void CargarDatos() {
  for (int i = 0; i < listadoNombre.length; i++) {
    listadoProductos
        .add(ProductWidget(nombre: listadoNombre[i], precio: i + 10));
  }
}
