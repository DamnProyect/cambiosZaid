import 'package:widgets_basicos/baseDeDatos/database_helper.dart';
import 'package:widgets_basicos/baseDeDatos/producto_dao.dart';
import 'package:widgets_basicos/models/productsModel.dart';
import 'package:widgets_basicos/widgets/products.dart';

final dao = ProductoDao();

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

//Al iniciar el programa esta funcion llena castea todos los productos y sus atributos
//Tambien los agrega al listado de productos

void CargarDatos() async {
  for (int i = 0; i < listadoNombre.length; i++) {
    listadoProductos.add(ProductWidget(
      nombre: listadoNombre[i],
      precio: i + 10,
      image: "assets/images/Carrusel2.jpg",
      desc:
          "Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500",
    ));
  }

  //Insert de registros si la tabla productos esta vacia
  final estavacia = await ProductoDao().isProductEmpty();
  if (estavacia) {
  } else {}

  Product miProducto =
      Product(id: 1, name: 'Zaid', price: 2, desc: "desc", image: "image");
  Product miProducto2 =
      Product(name: 'Pepi', price: 2, desc: "desc", image: "image");

  /* await dao.insertProduct(miProducto);
  print('Insert completo');

  await dao.insertProduct(miProducto2);
  print('Insert completo'); */

//Antes del update

  print(await dao.readProductList());

  miProducto2.setName = "Yazmincita";
  miProducto2.setPrice = 99999999;

// tener en cuenta qeu al probar el id es -1, hasta que se recojan los datos de DB si se haran los updates.
  await dao.updateProduct(miProducto2);

  //Borrado
  dao.deleteProduct(3);
  print(await dao.readProductList());
}
