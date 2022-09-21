import 'package:easy_apps/Fetch%20Data.dart';
import 'package:easy_apps/Screens/Home%20Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rflutter_alert/rflutter_alert.dart';


class OTP_Verification extends StatefulWidget {
  const OTP_Verification({Key? key, required this.OTP, required this.Name, required this.Email, required this.Password}) : super(key: key);
  final OTP ;
  final Name ;
  final Email ;
  final Password ;
  @override
  State<OTP_Verification> createState() => _OTP_VerificationState();
}

class _OTP_VerificationState extends State<OTP_Verification> {
  final TextEditingController _fieldOne = TextEditingController();
  final TextEditingController _fieldTwo = TextEditingController();
  final TextEditingController _fieldThree = TextEditingController();
  final TextEditingController _fieldFour = TextEditingController();

  // This is the entered code
  // It will be displayed in a Text widget
  bool _otp = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Icon(Icons.email,size: 150,color: Colors.red,),
              ),
              Text("Email Verification",style: GoogleFonts.acme(fontSize: 34),),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(child: Text("Enter The OTP \n \nSent To - "+'${widget.Email}',style: GoogleFonts.aBeeZee(),)),
              ),
              const SizedBox(
                height: 30,
              ),
              // Implement 4 input fields
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OtpInput(_fieldOne, true),
                  OtpInput(_fieldTwo, false),
                  OtpInput(_fieldThree, false),
                  OtpInput(_fieldFour, false)
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                  child : _otp
                      ? SpinKitWave(color: Colors.blue,size: 30,)
                      : ElevatedButton(
                    onPressed: () {

                      final otp = _fieldOne.text +
                      _fieldTwo.text +
                      _fieldThree.text +
                      _fieldFour.text;
                      if(otp == widget.OTP){
                        setState(() {
                          _otp = true;
                        });

                        Upload_User_Data(widget.Name , widget.Email , widget.Password,context);
                      }else{
                        Alert(
                          context: context,
                          type: AlertType.error,
                          title: "Wrong OTP",
                          desc: "Please Check The OTP You Have Entered",
                          buttons: [
                            DialogButton(
                              child: Text(
                                "Ok",
                                style: TextStyle(color: Colors.white, fontSize: 20),
                              ),
                              onPressed: () => Navigator.of(context).pop(),
                              width: 120,
                            )
                          ],
                        ).show();
                      }
                    },
                    child: const Text('Submit')),
              ),
              const SizedBox(
                height: 30,
              ),

            ],
          ),
        ),
      ),
    );
  }
}

// Create an input widget that takes only one digit
class OtpInput extends StatelessWidget {
  final TextEditingController controller;
  final bool autoFocus;
  const OtpInput(this.controller, this.autoFocus, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 50,
      child: TextField(
        autofocus: autoFocus,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        controller: controller,
        maxLength: 1,
        cursorColor: Theme.of(context).primaryColor,
        decoration: const InputDecoration(
            border: OutlineInputBorder(),
            counterText: '',
            hintStyle: TextStyle(color: Colors.black, fontSize: 20.0)),
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
      ),
    );
  }
}
