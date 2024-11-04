import 'package:butter_app_project/home.dart';
import 'package:butter_app_project/owner_pages/homePage_Owner.dart';
import 'package:butter_app_project/owner_pages/menu.dart';
import 'package:butter_app_project/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';



class Owner_Login extends StatefulWidget {
  const Owner_Login({super.key});

  @override
  State<Owner_Login> createState() => _Owner_LoginState();
}

class _Owner_LoginState extends State<Owner_Login> {
  final LocalAuthentication auth = LocalAuthentication();
  bool Obscured_Owner = true ;
  TextEditingController _owner = TextEditingController();

  @override
  void dispose(){
    _owner.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Column(
        // crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text("Login as owner" , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 20),),
          Text("Hey, Enter your detail to get sign in"),
          Text("to your account"),
          SizedBox(height: 30),
          TextField(
            decoration: InputDecoration(
                labelText: 'username',
                labelStyle: TextStyle(
                    color: Color(0xff800000),
                    // fontWeight: FontWeight.bold,
                    fontSize: 10
                ),
                prefixIcon: Icon(Icons.supervised_user_circle_outlined , color: Colors.black,
                  // Color(0xff800000),
                  size: 30,),
                focusedBorder: OutlineInputBorder(
                  // borderSide: BorderSide(color: Color(0xff800000)),
                    borderRadius: BorderRadius.circular(30)
                ),
                enabledBorder: OutlineInputBorder(
                  // borderSide: BorderSide(color: Color(0xff800000)),
                    borderRadius: BorderRadius.circular(30)
                )
            ),
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          SizedBox(height: 50),
          TextField(
            controller: _owner,
            decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  // borderSide: BorderSide(color: Color(0xffFEFF9F)),
                    borderRadius: BorderRadius.circular(30)

                ),
                enabledBorder: OutlineInputBorder(
                  // borderSide: BorderSide(color: Color(0xffFEFF9F)),
                    borderRadius: BorderRadius.circular(30)
                ),
                labelText: "Password",
                labelStyle: TextStyle(
                  color: Color(0xff800000),
                  // fontWeight: FontWeight.bold,
                  fontSize: 10,
                ),
                prefixIcon: Icon(Icons.lock , color: Colors.black,),
                suffixIcon: IconButton(onPressed: (){
                  setState(() {
                    Obscured_Owner = !Obscured_Owner;
                  });
                },
                    icon: Icon(Obscured_Owner ? Icons.visibility_off  : Icons.visibility , color: Colors.black,))

            ),
            obscureText: Obscured_Owner,
            // style: TextStyle(
            //   color: Colors.white,
            //
            // ),
          ),
          // Align(
          //   alignment: Alignment.centerRight,
          //   child:TextButton(onPressed: (){},
          //       child: Text("Forgot Password" , textAlign: TextAlign.end,)) ,
          // ),
          SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            // crossAxisAlignment: CrossAxisAlignment.baseline,
            children: [
              ElevatedButton(onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => Front()));
              },
                child: Text("Sign-In"),
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(350, 50),
                  foregroundColor: Colors.white,
                  backgroundColor: Color(0xff800000),
                  elevation: 5,
                  surfaceTintColor: Color(0xff800000),
                  shadowColor: Color(0xff800000),
                ),),
              GestureDetector(
                  onTap: () async{
                    final List<BiometricType> availableBiometrics = await auth.getAvailableBiometrics();
                    if(availableBiometrics.isNotEmpty){
                      print(availableBiometrics);
                    }
                    final bool canAuthenticateWithBiometrics = await auth.canCheckBiometrics;
                    if(canAuthenticateWithBiometrics){
                      try {
                        final bool didAuthenticate = await auth.authenticate(
                          localizedReason: "Please" ,
                          options: AuthenticationOptions(
                            biometricOnly: false ,
                            stickyAuth: true,
                          ),);

                        if (didAuthenticate){
                          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => Fitur_Home(),), (route) => false);

                        }
                      } catch (e) {
                        print(e);
                      }
                    }
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          color: Color(0xff800000),
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: Icon(Icons.fingerprint , color: Colors.white, size: 30,),
                    ),

                  )
              )],
          ),

        ],
      )
    );
  }
}
