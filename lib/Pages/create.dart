import 'package:ejemplo/Db/conection.dart';
import 'package:ejemplo/Models/articulo.dart';
import 'package:flutter/material.dart';


class Crear extends StatelessWidget {

  static const String ROUTE = '/crear';

  final _formKey = GlobalKey<FormState>();
  final titulo = TextEditingController();
  final contenido = TextEditingController();

  @override
  Widget build(BuildContext context) {

    Articulo articulo = ModalRoute.of(context)!.settings.arguments as Articulo;
    _inicializar(articulo);

    return Scaffold(
      appBar: AppBar(
        title: Text('Crear Articulo'),
      ),
      body: Container(
        child: _contruirform(articulo),
      )
    );
  }

  _inicializar(Articulo articulo) {
    titulo.text = articulo.titulo;
    contenido.text = articulo.contenido;
  }

  Widget _contruirform(Articulo articulo){
      return Container(
      padding: EdgeInsets.all(10),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: titulo,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              decoration: InputDecoration(
                labelText: "Titulo",
                border: OutlineInputBorder()
              ),
            ),
            SizedBox(height: 15,),
            TextFormField(
              controller: contenido,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              decoration: InputDecoration(
                labelText: "Contenido",
                border: OutlineInputBorder()
              ),
            ),
            SizedBox(height: 15,),
            ElevatedButton(
              child: Text("Guardar"), 
              onPressed: (){
                if (_formKey.currentState!.validate()) {
                  if (articulo.id > 0) {
                    // actualizacion
                    articulo.titulo = titulo.text;
                    articulo.contenido = contenido.text;
                    Conection.updateArticulo(articulo);
                  } else {
                    // insercion
                    Conection.insertArticulo(
                      Articulo(
                        titulo: titulo.text, 
                        contenido: contenido.text
                      )
                    );
                  }
                }
              }
            )
          ],
        ),
      )
    );
  }
}
