import 'package:ejemplo/Db/conection.dart';
import 'package:ejemplo/Models/articulo.dart';
import 'package:ejemplo/Pages/create.dart';
import 'package:flutter/material.dart';


class Mostrar extends StatelessWidget {

  static const String ROUTE = '/';
  const Mostrar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add), 
        onPressed: (){
          Navigator.pushNamed(context, Crear.ROUTE, arguments: Articulo.vacio());
        },
      ),
      appBar: AppBar(
        title: Text('CRUD', style: TextStyle(fontSize: 15,), textAlign: TextAlign.center,),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        child: _listaArticulos(),
      ),
    );
  }
}

class _listaArticulos extends StatefulWidget{
  __listaArticulosState createState() => __listaArticulosState();
}

class __listaArticulosState extends State<_listaArticulos>{
  List<Articulo> articulos = [];
  @override
  void initState() {
    // TODO: implement initState
    _cargarDatos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: articulos.length,
      itemBuilder: (_, i) => _crearListado(i),
    );
  }
  _cargarDatos() async{
    List<Articulo> aux = await Conection.getArticulos();

    setState(() {
      articulos = aux;
    }); 
  }

  _crearListado(int i){
    return Dismissible(
      key: Key(i.toString()),
      direction: DismissDirection.startToEnd,
      onDismissed: (direction){
        Conection.deleteArticulo(articulos[i]);
      },
      child: ListTile(
        title: Text(articulos[i].titulo),
        trailing: MaterialButton(
          onPressed: (){
            Navigator.pushNamed(context, Crear.ROUTE, arguments: articulos[i]);
          },
          child:  Icon(Icons.edit)
        ),
      ),
    );
  }

}


