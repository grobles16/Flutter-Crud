class Articulo {
  int id = 0;
  String titulo = '';
  String contenido = '';


  Articulo({
    this.id = 0,
    required this.titulo, 
    required this.contenido});

  Articulo.vacio();

  Map<String, dynamic> toMap(){
    return id == 0 ? {'titulo': titulo, 'contenido': contenido}:{'id' : id,'titulo': titulo, 'contenido': contenido};
  }
}