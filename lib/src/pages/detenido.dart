import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:iph/src/models/EstadoFisico.dart';
import 'package:iph/src/models/Resistencia.dart';
class DetenidoPage extends StatefulWidget {

  @override
  _DetenidoPageState createState() => _DetenidoPageState();
}

class _DetenidoPageState extends State<DetenidoPage> {
  double ancho = 0;
  String _folioBoleta = '';
  String _nombre = '';
  String _fechaNacimiento = '';
  String _apellidoPaterno = '';
  String _apellidoMaterno = '';
  String _edad = ''; 
  String _sexo;
  String _nacionalidad;
  String _estadoFisico;
  String _resistenciaAseguramiento;
  String _diagnostico = '';
  String _unidadMedica = '';
  bool aseguradoCandadosMano = false;
  bool lecturaDerechos = false;
  bool policia = false;
  bool lesionesVisibles = false;
  bool niegaDatos = false;


  List<String> _sexos = ['Masculino','Femenino'];
  List<String> _nacionalidades = ['Méxicano','Extranjero'];
    List<EstadoFisico> _estadosFisico = [];
    EstadoFisico ef1 = new EstadoFisico(id:'1',descripcion:'Tranquilo',img:'assets/img/estado-fisico/tranquilo.svg');
    EstadoFisico ef2 = new EstadoFisico(id:'2',descripcion:'Agresivo',img:'assets/img/estado-fisico/agresivo.svg');
    EstadoFisico ef3 = new EstadoFisico(id:'3',descripcion:'Prob. Estado Intoxicación', img:'assets/img/estado-fisico/intoxicacion.svg');
    EstadoFisico ef4 = new EstadoFisico(id:'4',descripcion:'Nervioso', img:'assets/img/estado-fisico/nervioso.svg');
    EstadoFisico ef5 = new EstadoFisico(id:'5',descripcion:'Cooperador', img:'assets/img/estado-fisico/cooperador.svg');
    
  List<Resistencia> _resistenciasAseguramineto = [];
  Resistencia r1 = new Resistencia(id:'1',descripcion:'Ninguna',img:'assets/img/resistencia/ninguna.svg');
  Resistencia r2 = new Resistencia(id:'2',descripcion:'Verbal',img:'assets/img/resistencia/verbal.svg');
  Resistencia r3 = new Resistencia(id:'3',descripcion:'Física',img:'assets/img/resistencia/fisica.svg');
  Resistencia r4 = new Resistencia(id:'4',descripcion:'Disparos',img:'assets/img/resistencia/disparos.svg');

  TextEditingController _inputFechaController = new TextEditingController();
  TextEditingController _inputEFController = new TextEditingController();
  TextEditingController _inputResistenciaController = new TextEditingController();

  @override
  void initState() {
    super.initState();
    _estadosFisico.add(ef1);
    _estadosFisico.add(ef2);
    _estadosFisico.add(ef3);
    _estadosFisico.add(ef4);
    _estadosFisico.add(ef5);

    _resistenciasAseguramineto.add(r1);
    _resistenciasAseguramineto.add(r2);
    _resistenciasAseguramineto.add(r3);
    _resistenciasAseguramineto.add(r4);
  }


  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size ;
    ancho = media.width; 

    return Scaffold(
      appBar: AppBar(
        title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:<Widget>[
                    Tab(
                      icon: Container(            
                          child: SvgPicture.asset('assets/img/detenidos.svg', height:10, width:10, color: Colors.white),
                          height: 60,
                          width: 60,
                        ),
                    ),
                    Text('Detenido')
                  ]
                ),
      ),
      body: SingleChildScrollView(
             child: Container(
              padding: EdgeInsets.all(15.0),
              child: Form(
                child: ancho > 600 ? large() : small() 
                ),
              ) 
            )
    );

  }

  Widget large(){
    return Column(
      children: <Widget>[
          oneField(_inputFolioBoleta()),
          SizedBox(height: 20),
          twoFields(_inputNombre(), _inputApellidoP()),
          SizedBox(height: 20),
          oneField(_inputApellidoM()),
          SizedBox(height: 20),
          twoFields(_inputFehcaNacimiento(context), _inputEdad()),
          SizedBox(height: 20),
          twoFields(_selectSexo(), _selectNacionalidad()),
          SizedBox(height: 20),
          twoFields(_selectEstadoFisico(), _selectResistencia()),
          SizedBox(height: 20),
          twoFields(_inputDiagnostico(), _inputUnidadMedica()),
          SizedBox(height: 20),
          twoFields(inputChecked1(), inputChecked2()),
          SizedBox(height: 20),
          twoFields(inputChecked3(), inputChecked4()),
          SizedBox(height: 20),
          oneField(inputChecked5()),
          SizedBox(height: 20),
          getBotones()
      ],
    );
  }

  Widget oneField(Widget filed){
    return Row( 
      children: <Widget>[
        Expanded(
          flex:18,
          child: filed,
        ),
        Expanded(
          flex:19,
          child: Text('')
        ),
      ]
    );
  }

  Widget twoFields(Widget filed1, Widget field2){
    return Row( 
      children: <Widget>[
        Expanded(
          flex:20,
          child: filed1,
        ),
        Expanded(
          flex:1,
          child: Text('')
        ),
        Expanded(
          flex:20,
          child: field2
        )
      ]
    );
  }

  Widget small(){
      return Column(
          children:<Widget>[
          _inputFolioBoleta(),
          SizedBox(height: 20),
          _inputNombre(),
          SizedBox(height: 20),
          _inputApellidoP(),
          SizedBox(height: 20),
          _inputApellidoM(),
          SizedBox(height: 20),
          _inputFehcaNacimiento(context),
          SizedBox(height: 20),
          _inputEdad(),
          SizedBox(height: 20),
          _selectSexo(),
          SizedBox(height: 20),
          _selectNacionalidad(),
            SizedBox(height: 20),
          _selectEstadoFisico(),
            SizedBox(height: 20),
          _selectResistencia(),
          SizedBox(height: 20),
          _inputDiagnostico(),
          SizedBox(height: 20),
          _inputUnidadMedica(),
          SizedBox(height: 20),
          inputChecked1(),
          SizedBox(height: 20),
          inputChecked2(),
          SizedBox(height: 20),
          inputChecked3(),
          SizedBox(height: 20),
          inputChecked4(),
          SizedBox(height: 20),
          inputChecked5(),
          SizedBox(height: 20),
          getBotones()
      ],
    );
  }

  Widget getBotones(){
     return Row(
      children: <Widget>[
        Expanded(
          flex:4,
          child: new Padding(
            padding: const EdgeInsets.all(0.0),
            child: btnGuardar(),
          ),
        ),
        Expanded(
          flex:4,
          child:Text('')
        ),
        Expanded(
          flex:4,
          child: new Padding(
            padding: const EdgeInsets.all(0.0),
            child: btnSiguiente(),
          ),
        ),
      ],
    );
  }

  Widget _inputFolioBoleta() {
   return TextFormField(
      //autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0)
        ),
        hintText: 'Folio de Boleta',
        labelText: 'Folio',
        suffixIcon: Icon (Icons.mic),
      ),
      onChanged: (valor){
        setState(() {
          _folioBoleta = valor;  
        });
      },
   );
  }

  Widget _inputNombre() {
   return TextFormField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0)
        ),
        hintText: 'Nombre',
        labelText: 'Nombre',
        suffixIcon: Icon (Icons.mic),
      ),
      onChanged: (valor){
        setState(() {
          _nombre = valor;  
        });
      },
   );
  }

  Widget _inputApellidoP() {
   return TextFormField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0)
        ),
        hintText: 'Apellido Paterno',
        labelText: 'Apellido Paterno',
        suffixIcon: Icon (Icons.mic),
      ),
      onChanged: (valor){
        setState(() {
          _apellidoPaterno = valor;  
        });
      },
   );
  }

  Widget _inputApellidoM() {
   return TextFormField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0)
        ),
        hintText: 'Apellido Materno',
        labelText: 'Apellido Materno',
        suffixIcon: Icon (Icons.mic),
      ),
      onChanged: (valor){
        setState(() {
          _apellidoMaterno = valor;  
        });
      },
   );
  }

  Widget _inputFehcaNacimiento( BuildContext context) {
   return TextFormField(
     enableInteractiveSelection: false,
      controller: _inputFechaController,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0)
        ),
        hintText: 'Fecha de Nacimiento',
        labelText: 'Fecha de Nacimiento',
        suffixIcon: Icon (Icons.mic),
      ),
      onTap: (){
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate( context );
      },
   );
  } 

  _selectDate(BuildContext context) async {

    DateTime picked = await showDatePicker(
        context: context,
        initialDate: new DateTime(1990),
        firstDate: new DateTime(1950),
        lastDate: new DateTime(2020),
        locale: Locale('es', 'ES')
    );
    if( picked != null){
      //print(picked);
     setState(() {
        String formattedDate = DateFormat('dd-MM-yyyy').format(picked);
        _inputFechaController.text = formattedDate;

      });
    } 
  }

  Widget _inputEdad() {
   return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0)
        ),
        hintText: 'Edad',
        labelText: 'Edad',
        suffixIcon: Icon (Icons.mic),
      ),
      onChanged: (valor){
        setState(() {
          _edad = valor;  
        });
      },
   );
  }

  Widget _inputDiagnostico() {
   return TextFormField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0)
        ),
        hintText: 'Diagnóstico',
        labelText: 'Diagnóstico',
        suffixIcon: Icon (Icons.mic),
      ),
      onChanged: (valor){
        setState(() {
          _diagnostico = valor;  
        });
      },
   );
  }

  Widget _inputUnidadMedica() {
   return TextFormField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0)
        ),
        hintText: 'Unidad Médica',
        labelText: 'Unidad Médica',
        suffixIcon: Icon (Icons.mic),
      ),
      onChanged: (valor){
        setState(() {
          _diagnostico = valor;  
        });
      },
   );
  }


  Widget _selectSexo() {

  return  FormField<String>(
          builder: (FormFieldState<String> state) {
            return InputDecorator(
              decoration: InputDecoration(
                  errorStyle: TextStyle(color: Colors.redAccent, fontSize: 16.0),
                  labelText: 'Sexo',
                  floatingLabelBehavior  :FloatingLabelBehavior.always,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0))),
                  isEmpty: _sexo == '',
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  hint: Text('Selecciona una opción'),
                  value: _sexo,
                  isDense: true,
                  items:getOpcionesSexo(),
                  onChanged: (String newValue) {
                    print(newValue);
                   setState(() {
                      _sexo = newValue;
                    }); 
                    state.didChange(newValue);
                  },
                ),
              ),
            );
          },
        ); 
  }

  Widget _selectNacionalidad() {

  return  FormField<String>(
          builder: (FormFieldState<String> state) {
            return InputDecorator(
                  decoration: InputDecoration(
                        errorStyle: TextStyle(color: Colors.redAccent, fontSize: 16.0),
                        labelText: 'Nacionalidad',
                        floatingLabelBehavior  :FloatingLabelBehavior.always,
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0))),
                  isEmpty: _nacionalidad == '',
                  child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            hint: Text('Selecciona una opción'),
                            value: _nacionalidad,
                            isDense: true,
                            items:getOpcionesNacionalidad(),
                            onChanged: (String newValue) {
                              print(newValue);
                            setState(() {
                                _nacionalidad = newValue;
                              }); 
                              state.didChange(newValue);
                            },
                          ),
                  ),
            );
          },
        ); 
  }
  
  
  Widget _selectEstadoFisico() {
    return TextFormField(
      readOnly:true,
      controller: _inputEFController,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0)
        ),
        hintText: 'Selecciona una opción',
        labelText: 'Estado Fisico Aparente',
        suffixIcon: Icon (Icons.arrow_drop_down),
      ),
      onTap: (){
       _mostrarAlertaEF(context);
      },
   );
  }

  void _mostrarAlertaEF(BuildContext context){
    var styleTitle = new TextStyle( fontSize: 20.0, color: Colors.black);
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context){
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          content: Container(
            height: 600.0,
            width: 900.0,
            child: Column(
                  children: <Widget>[
                    Expanded(flex:2,child: Text('Estado físico aparente', style: styleTitle,)),
                    Expanded( flex:1, child:Divider(color: Colors.grey[800], height: 0.0,thickness: 1.5)),
                    Expanded( flex:20, child:_gridEstadosFisico(context)),
                   // Expanded( flex:2, child:btnListo()),
                  ], 
            )
          ),
        );
      }
    );
  }

  Widget _gridEstadosFisico(BuildContext context){
    return GridView.builder(
        itemCount: _estadosFisico.length,
        
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: ancho > 600 ? 3: 2, crossAxisSpacing:5, mainAxisSpacing: 10, childAspectRatio: ancho > 600 ? 1.4: 0.8),
        itemBuilder: (BuildContext context, int index){
          return _cardEf(_estadosFisico[index]);
        },
    );
  }
  Widget _cardEf(EstadoFisico estadoFisico){
   return Card(
      semanticContainer: true,
      elevation: 0.5,
      shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(10.0),  side: BorderSide(color: Colors.grey[400], width: 2)),
      child: InkWell(
        onTap: () => {
          _inputEFController.text = estadoFisico.descripcion ,
          Navigator.of(context).pop()
        },
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,    
            children:<Widget>[ 
              Center(
                      child:Container(
                        margin: EdgeInsets.only(top: 15),
                        height: 60,
                        width: 60,
                        child: SvgPicture.asset(estadoFisico.img)
                      )
              ),
              Container(padding: new EdgeInsets.all(25.0), child: Center(child: Text(estadoFisico.descripcion)))
            ]
          ),
        ) 
    );
  }

  Widget _selectResistencia() {
    return TextFormField(
      readOnly:true,
      controller: _inputResistenciaController,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0)
        ),
        hintText: 'Selecciona una opción',
        labelText: 'Resistencia al aseguramiento',
        suffixIcon: Icon (Icons.arrow_drop_down),
      ),
      onTap: (){
       _mostrarAlertaesistencia(context);
      },
   );
  }

  void _mostrarAlertaesistencia(BuildContext context){
    var styleTitle = new TextStyle( fontSize: 20.0, color: Colors.black);
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context){
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          content: Container(
            height: 600.0,
            width: 900.0,
            child: Column(
                  children: <Widget>[
                    Expanded(flex:2,child: Text('Resistencia al Aseguramiento', style: styleTitle,)),
                    Expanded( flex:1, child:Divider(color: Colors.grey[800], height: 0.0,thickness: 1.5)),
                    Expanded( flex:20, child:_gridresistencia(context)),
                   // Expanded( flex:2, child:btnListo()),
                  ], 
            )
          ),
        );
      }
    );
  }

  Widget _gridresistencia(BuildContext context){
    return GridView.builder(
        itemCount: _resistenciasAseguramineto.length,
        
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: ancho > 600 ? 3: 2, crossAxisSpacing:5, mainAxisSpacing: 10, childAspectRatio: ancho > 600 ? 1.4: 0.8),
        itemBuilder: (BuildContext context, int index){
          return _cardResistencia(_resistenciasAseguramineto[index]);
        },
    );
  }

  Widget _cardResistencia(Resistencia resistencia){
    return Card(
      semanticContainer: true,
      elevation: 0.5,
      shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(10.0),  side: BorderSide(color: Colors.grey[400], width: 2)),
      child: InkWell(
        onTap: () => {
          _inputResistenciaController.text = resistencia.descripcion,
          Navigator.of(context).pop()
        },
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,    
            children:<Widget>[ 
              Center(
                      child:Container(
                        margin: EdgeInsets.only(top: 15),
                        height: 60,
                        width: 60,
                        child: SvgPicture.asset(resistencia.img)
                      )
              ),
              Container(padding: new EdgeInsets.all(25.0), child: Center(child: Text(resistencia.descripcion)))
            ]
          ),
        ) 
    );
  }
  
  List<DropdownMenuItem<String>> getOpcionesSexo(){

    List<DropdownMenuItem<String>> lista = new List();

    _sexos.forEach((sexo){
      lista.add(DropdownMenuItem(
        child: Text(sexo),
        value: sexo,
      ));
    });

    return lista;
  } 

  List<DropdownMenuItem<String>> getOpcionesNacionalidad(){

    List<DropdownMenuItem<String>> lista = new List();

    _nacionalidades.forEach((nac){
      lista.add(DropdownMenuItem(
        child: Text(nac),
        value: nac,
      ));
    });

    return lista;
  } 

  Widget inputChecked1(){
    return Container(
      
          child: CheckboxListTile(
        title: Text("Asegurado con Candados de manos"),
        value: aseguradoCandadosMano,
        onChanged: (newValue) { 
                    setState(() {
                      aseguradoCandadosMano = newValue; 
                    }); 
                  },
        controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
        ),
    );
  } 
  Widget inputChecked2(){
    return CheckboxListTile(
      title: Text("Lesiones visibles"),
      value: lesionesVisibles,
      onChanged: (newValue) { 
                  setState(() {
                    lesionesVisibles = newValue; 
                  }); 
                },
      controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
      );
  } 
  Widget inputChecked3(){
    return CheckboxListTile(
      title: Text("Lectura de Derechos"),
      value: lecturaDerechos,
      onChanged: (newValue) { 
                  setState(() {
                    lecturaDerechos = newValue; 
                  }); 
                },
      controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
      );
  } 
  Widget inputChecked4(){
    return CheckboxListTile(
      title: Text("Se Niega a Dar Datos"),
      value: niegaDatos,
      onChanged: (newValue) { 
                  setState(() {
                    niegaDatos = newValue; 
                  }); 
                },
      controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
      );
  } 
  Widget inputChecked5(){
    return CheckboxListTile(
      title: Text("¿Es/era policía?"),
      value: policia,
      onChanged: (newValue) { 
                  setState(() {
                    policia = newValue; 
                  }); 
                },
      controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
      );
  }

  Widget btnGuardar(){
    return SizedBox(
          height: 50,
          child: RaisedButton.icon(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0)
        ),
        color: Colors.black,
        textColor: Colors.white,
        label: Text('Guardar'),
        icon: Icon( Icons.save ),
        onPressed: () =>{},
      ),
    );
  } 
  Widget btnSiguiente(){
    return RaisedButton(
      child: Container(
        height: 50,
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical:  15.0),
        child: Text('Siguiente'),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0)
      ),
      elevation: 1.0,
        color: Colors.blueAccent[700],
      textColor: Colors.white,
      onPressed: () => {},
    );
  }  

}