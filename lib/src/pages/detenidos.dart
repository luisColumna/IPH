
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetenidosPage extends StatelessWidget {
  double ancho = 0;
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size ;
    ancho = media.width;
    print("size : ${media.width}");
    return Scaffold(
      appBar: AppBar(
        //title: Center( child: Text('Detenidos')),
        title:  Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:<Widget>[
                    Tab(
                      icon: Container(            
                          child: SvgPicture.asset('assets/img/detenidos.svg', height:10, width:10, color: Colors.white),
                          height: 80,
                          width: 80,
                        ),
                    ),
                    Text('Detenidos')
                  ]),
        actions: <Widget>[
          Container(
            padding: EdgeInsets.only(right:25.0),
            child: IconButton ( 
                    icon: Icon(
                        Icons.person_add, color:
                        Colors.white
                    ),
                    onPressed: () => { Navigator.pushNamed(context, 'detenido')},
                  ),
          )
        ],
      ),
      body:GridView.count(
        crossAxisCount: ancho > 600? 3:2,
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          _cardDetenido(),
          _cardDetenido(),
          _cardDetenido(),
          _cardDetenido(),
          _cardDetenido(),
         
        ],
      ),
      floatingActionButton: RaisedButton(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 50.0, vertical:  15.0),
            child: Text('Siguiente'),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0)
          ),
          elevation: 1.0,
          color: Colors.blueAccent[700],
          textColor: Colors.white,
          onPressed: () => {},
        )
    );
  }

  Widget _cardDetenido(){
   return Container(
       height: 800,
       width: 300,
        child: Card(
                  semanticContainer: true,
                  elevation: 10.0,
                  shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(10.0),  side: BorderSide(color: Colors.grey[400], width: 2)),
                  child: Column(
                    children:<Widget>[
                      SizedBox(height: 15),
                      Expanded(
                          flex:6,
                          child: Column(
                          children: <Widget>[
                            Expanded(
                              flex:3,
                              child: Center(
                                child:Container(            
                                          child: SvgPicture.asset('assets/img/detenidos.svg'),
                                          height: 150,
                                          width: 150,
                                          ),
                                    ),
                            ),
                            SizedBox(height: 25),
                            Expanded(flex:5,child: 
                                              Column( children:<Widget>[
                                                    Center(child:Text('Nombre')),
                                                    Center(child:Text('Apellido P.')),
                                                    Center(child:Text('apellido M.'))
                              ])
                            ),
                            
                          ],
                        ),
                      ),
                      Expanded( flex:1, child:Divider(color: Colors.grey[400], height: 0.0,thickness: 1.5)),
                      Expanded(
                          flex:3,
                          child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:<Widget>[
                            IconButton ( 
                                icon: Icon(
                                    Icons.remove_red_eye, color:
                                    Colors.blue
                                ),
                                onPressed: () => {},
                            ),
                            IconButton ( 
                                icon: Icon(
                                    Icons.edit, color:
                                    Colors.yellow
                                ),
                                onPressed: () => {},
                            ),
                            IconButton ( 
                                icon: Icon(
                                    Icons.restore_from_trash, color:
                                    Colors.red
                                ),
                                onPressed: () => {},
                            ),
                          ]),
                      )
                    ]
                  ),
                ),
   );
  }
}