import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';



import 'main.dart';

import 'report.dart';



class editnote extends StatefulWidget {

  DocumentSnapshot docid;

  editnote({required this.docid});



  @override

  _editnoteState createState() => _editnoteState(docid: docid);

}



class _editnoteState extends State<editnote> {

  DocumentSnapshot docid;

  _editnoteState({required this.docid});

  TextEditingController name = TextEditingController();

  TextEditingController subject1 = TextEditingController();

  TextEditingController subject2 = TextEditingController();

  TextEditingController subject3 = TextEditingController();



  @override

  void initState() {

    name = TextEditingController(text: widget.docid.get('Nombre'));

    subject1 = TextEditingController(text: widget.docid.get('Matematica'));

    subject2 = TextEditingController(text: widget.docid.get('Ciencia'));

    subject3 = TextEditingController(text: widget.docid.get('Historia'));



    super.initState();

  }



  @override

  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(

        backgroundColor: Color.fromARGB(255, 0, 11, 133),

        actions: [

          MaterialButton(

            onPressed: () {

              Navigator.pushReplacement(

                  context, MaterialPageRoute(builder: (_) => Home()));

            },

            child: Text(

              "Regresar",

              style: TextStyle(

                fontSize: 20,

                color: Color.fromARGB(255, 251, 251, 251),

              ),

            ),

          ),

          MaterialButton(

            onPressed: () {

              widget.docid.reference.update({

                'Nombre': name.text,

                'Matematica': subject1.text,

                'Ciencia': subject2.text,

                'Historia': subject3.text

              }).whenComplete(() {

                Navigator.pushReplacement(

                    context, MaterialPageRoute(builder: (_) => Home()));

              });

            },

            child: Text(

              "Grabar",

              style: TextStyle(

                fontSize: 20,

                color: Color.fromARGB(255, 251, 251, 251),

              ),

            ),

          ),

          MaterialButton(

            onPressed: () {

              widget.docid.reference.delete().whenComplete(() {

                Navigator.pushReplacement(

                    context, MaterialPageRoute(builder: (_) => Home()));

              });

            },

            child: Text(

              "Eliminar",

              style: TextStyle(

                fontSize: 20,

                color: Color.fromARGB(255, 251, 251, 251),

              ),

            ),

          ),

        ],

      ),

      body: SingleChildScrollView(

        child: Container(

          child: Column(

            children: [

              SizedBox(

                height: 20,

              ),

              Container(

                decoration: BoxDecoration(border: Border.all()),

                child: TextField(

                  controller: name,

                  decoration: InputDecoration(

                    hintText: 'name',

                  ),

                ),

              ),

              SizedBox(

                height: 10,

              ),

              Container(

                decoration: BoxDecoration(border: Border.all()),

                child: TextField(

                  controller: subject1,

                  maxLines: null,

                  keyboardType: TextInputType.number,

                  decoration: InputDecoration(

                    hintText: 'Maths',

                  ),

                ),

              ),

              SizedBox(

                height: 10,

              ),

              Container(

                decoration: BoxDecoration(border: Border.all()),

                child: TextField(

                  controller: subject2,

                  maxLines: null,

                  keyboardType: TextInputType.number,

                  decoration: InputDecoration(

                    hintText: 'Science',

                  ),

                ),

              ),

              SizedBox(

                height: 10,

              ),

              Container(

                decoration: BoxDecoration(border: Border.all()),

                child: TextField(

                  controller: subject3,

                  maxLines: null,

                  keyboardType: TextInputType.number,

                  decoration: InputDecoration(

                    hintText: 'History',

                  ),

                ),

              ),

              SizedBox(

                height: 20,

              ),

              MaterialButton(

                color: Color.fromARGB(255, 0, 11, 133),

                onPressed: () {

                  Navigator.push(

                    context,

                    MaterialPageRoute(

                      builder: (_) => reportt(

                        docid: docid,

                      ),

                    ),

                  );

                },

                child: Text(

                  "Generar Reporte",

                  style: TextStyle(

                    fontSize: 20,

                    color: Color.fromARGB(255, 251, 251, 251),

                  ),

                ),

              ),

            ],

          ),

        ),

      ),

    );

  }

}
