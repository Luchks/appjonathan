import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';



import 'main.dart';



class addnote extends StatelessWidget {

  TextEditingController name = TextEditingController();

  TextEditingController subject1 = TextEditingController();

  TextEditingController subject2 = TextEditingController();

  TextEditingController subject3 = TextEditingController();



  CollectionReference ref = FirebaseFirestore.instance.collection('reporte');



  @override

  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(

        backgroundColor: Color.fromARGB(255, 0, 11, 133),

        actions: [

          MaterialButton(

            onPressed: () {

              ref.add({

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

        ],

      ),

      body: SingleChildScrollView(

        child: Column(

          children: [

            Container(

              decoration: BoxDecoration(border: Border.all()),

              child: TextField(

                controller: name,

                decoration: InputDecoration(

                  hintText: 'Nombre',

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

                  hintText: 'Matematica',

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

                  hintText: 'Ciencia',

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

                  hintText: 'Historia',

                ),

              ),

            ),

          ],

        ),

      ),

    );

  }

}
