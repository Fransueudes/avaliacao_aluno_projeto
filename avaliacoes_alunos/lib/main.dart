import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Avaliação de Alunos',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Avaliação de Alunos'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();
  double? nota1;
  double? nota2;
  double? nota3;

  double _calcularMedia() {
    double Media = (nota1! + nota2! + nota3!) / 3;
    return Media;
  }

  double _calcularMenorNota(){
    double menor = 10.0;
    if (nota1! < menor){
      menor = nota1!;
    }
    if (nota2! < menor){
      menor = nota2!;
    }
    if (nota3! < menor){
      menor = nota3!;
    }
    return menor;
  }

  double _calcularMaiorNota(){
    double maior = 0.0;
    if (nota1! > maior){
      maior = nota1!;
    }
    if (nota2! > maior){
      maior = nota2!;
    }
    if (nota3! > maior){
      maior = nota3!;
    }
    return maior;
  }



  _buildResultado(BuildContext context){

    if (nota1 != null && nota2 != null && nota3 != null) {
      double iMedia = _calcularMedia();
      double iMenor = _calcularMenorNota();
      double iMaior = _calcularMaiorNota();

      if (iMedia >= 0 && iMedia < 6){
        return Container(
          color: Colors.red,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                  children: [
                    Text(
                      iMenor.toStringAsFixed(1),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 34,
                      ),
                    ),
                    Text('Menor nota',
                       style: TextStyle(
                       color: Colors.white,
                       ),
                    ),
                  ]
              ),
              Column(
                  children: [
                    Text(
                      iMaior.toStringAsFixed(1),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 34,
                      ),
                    ),
                    Text('Maior nota',
                      style: TextStyle(
                      color: Colors.white,
                      ),
                    ),
                  ]
              ),
              Column(
                  children: [
                    Text(
                      iMedia.toStringAsFixed(1),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 34,
                      ),
                    ),
                    Text('Média',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ]
              ),
            ],
          ),
        );
      }
      else if (iMedia >= 6 && iMedia < 8){
        return Container(
          color: Colors.yellow,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                  children: [
                    Text(
                      iMenor.toStringAsFixed(1),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 34,
                      ),
                    ),
                    Text('Menor nota',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ]
              ),
              Column(
                  children: [
                    Text(
                      iMaior.toStringAsFixed(1),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 34,
                      ),
                    ),
                    Text('Maior nota',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ]
              ),
              Column(
                  children: [
                    Text(
                      iMedia.toStringAsFixed(1),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 34,
                      ),
                    ),
                    Text('Média',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ]
              ),
            ],
          ),
        );
      }
      else {
        return Container(
        color: Colors.green,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
                children: [
                  Text(
                    iMenor.toStringAsFixed(1),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 34,
                    ),
                  ),
                  Text('Menor nota',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ]
            ),
            Column(
                children: [
                  Text(
                    iMaior.toStringAsFixed(1),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 34,
                    ),
                  ),
                  Text('Maior nota',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ]
            ),
            Column(
                children: [
                  Text(
                    iMedia.toStringAsFixed(1),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 34,
                    ),
                  ),
                  Text('Média',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ]
            ),
          ],
        ),
      );
      }

    }
    else{
      return Container();
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Utilize o formulário a seguir para informar as notas dos alunos da turma. Ao final, pressione CONCLUIR para ver o breve sumário analítico das notas.',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Nota',
                        helperText: 'Informe a nota, um numero de 0 a 10',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Informe a nota, um numero de 0 a 10';
                        }
                        else if(double.parse(value) > 10 || double.parse(value) < 0){
                          return 'Informe a nota, um numero de 0 a 10';
                        }
                        try {
                          var a = double.parse(value);
                        } catch (e) {
                          return 'Informe a nota, um numero de 0 a 10';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                        } else {
                          setState(() {
                            nota1 = null;
                          });
                        }
                      },
                      onSaved: (value) {
                        setState(() {
                          nota1 = double.parse(value!);
                        });
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Nota',
                        helperText: 'Informe a nota, um numero de 0 a 10',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Informe a nota, um numero de 0 a 10';
                        }
                        else if(double.parse(value) > 10 || double.parse(value) < 0){
                          return 'Informe a nota, um numero de 0 a 10';
                        }
                        try {
                          var a = double.parse(value);
                        } catch (e) {
                          return 'Informe a nota, um numero de 0 a 10';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                        } else {
                          setState(() {
                            nota2 = null;
                          });
                        }
                      },
                      onSaved: (value) {
                        setState(() {
                          nota2 = double.parse(value!);
                        });
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Nota',
                        helperText: 'Informe a nota, um numero de 0 a 10',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Informe a nota, um numero de 0 a 10';
                        }
                        else if(double.parse(value) > 10 || double.parse(value) < 0){
                          return 'Informe a nota, um numero de 0 a 10';
                        }
                        try {
                          var a = double.parse(value);
                        } catch (e) {
                          return 'Informe a nota, um numero de 0 a 10';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                        } else {
                          setState(() {
                            nota3 = null;
                          });
                        }
                      },
                      onSaved: (value) {
                        setState(() {
                          nota3 = double.parse(value!);
                        });
                      },
                    ),
                    SizedBox(
                      height: 60,
                    ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                        } else {
                          setState(() {
                            nota1 = null;
                            nota2 = null;
                            nota3 = null;
                          });
                        }
                      },
                      child: const Text('CONCLUIR'),
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(40),
                      ),
                    ),
                  ),
                ],
              ),
                    SizedBox(
                      height: 40,
                    ),

              _buildResultado(context),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
