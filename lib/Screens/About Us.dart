import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class About_Us extends StatefulWidget {
  const About_Us({Key? key}) : super(key: key);

  @override
  State<About_Us> createState() => _About_UsState();
}

class _About_UsState extends State<About_Us> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            SafeArea(
                child: Center(child: Text("Iconic Software Production",
                  style: TextStyle(fontSize: 24,fontWeight: FontWeight.w300,letterSpacing: 2),)))
            ,SizedBox(height: 50,)
            ,Row(
              children: [
                SizedBox(width: 5,),
                Text("About Us",style: GoogleFonts.quicksand(),),
                SizedBox(width: 6,),
                Expanded(
                  child: Divider(
                    color: Colors.black,
                  ),
                ),
                SizedBox(width: 3,)
              ],
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Iconic Software Production "
                  "is a Indian Company that builds real life "
                  "based Problem Solving Applications."
                  "We tries our best to provide best quality and satisfied appications to our customers"
              ,
              style: TextStyle(fontSize: 15,letterSpacing: 1),
              ),
            ),
            SizedBox(height: 50,),
            Row(
              children: [
                SizedBox(width: 5,),
                Text("Co-Founder",style: GoogleFonts.quicksand(),),
                SizedBox(width: 6,),
                Expanded(
                  child: Divider(
                    color: Colors.black,
                  ),
                ),
                SizedBox(width: 3,)
              ],
            ),
            SizedBox(height: 20,),
            Text("Harsh Jha",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24,letterSpacing: 1),),
          ],
        ),

      ),
    );
  }
}
