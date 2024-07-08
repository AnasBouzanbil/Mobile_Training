import 'package:flutter/material.dart';
String aloha = "A simpssssle text";
void main()
{
  runApp(
    new MaterialApp(
      title: "Test Test",
        home:Material(
          color: Colors.white,
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.lime[900],
                  borderRadius: BorderRadius.circular(10.0), // Adjust the radius as needed
                ),
                padding: EdgeInsets.all(10.0),
                child: Text(
                  aloha,
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                    backgroundColor: Colors.lime[900],
                    fontSize: 30.3,
                    color: Colors.white,
                  ),
                ),
              ),
              ),


                SizedBox(height: 6),

                ElevatedButton(onPressed: (){
                  print('Button pressed');
                  aloha =  "another text";
                  print(aloha);
                },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(100, 55),
                    onPrimary: Colors.lime[900],
                    primary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(color: Colors.black12,
                      width: 2,
                      ),

                    ),

                  ),
                  


                  child: Text('Click me',
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
            ],
        ),
    ),
    ),


  );
}
