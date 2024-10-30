import 'package:butter_project/data%20base/data_karyawan.dart';
import 'package:butter_project/data%20base/data_service.dart';
import 'package:butter_project/forgot_pass.dart';
import 'package:butter_project/home.dart';
import 'package:butter_project/login.dart';
import 'package:butter_project/register.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:local_auth/local_auth.dart';

class Login_Page extends StatefulWidget {
  const Login_Page({super.key});

  @override
  State<Login_Page> createState() => _Login_PageState();
}

class _Login_PageState extends State<Login_Page> {
  bool _Welcome = false;
  bool _start = false;

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        _Welcome = true;
      });
    });

    Future.delayed(Duration(seconds: 5), () {
      setState(() {
        _start = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    // "https://i.gojekapi.com/darkroom/gofood-indonesia/v2/images/uploads/d97085a0-c243-486a-9816-da5c2562e39f_Go-Biz_20221118_211149.jpeg?auto=format"),fit: BoxFit.none),
                    "https://png.pngtree.com/png-vector/20240130/ourlarge/pngtree-ramen-png-with-ai-generated-png-image_11572473.png"),
                fit: BoxFit.none),
            color: Colors.grey[100]),
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(bottom: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            if (_Welcome) ...[
              Text(
                "Welcome!",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
              ),
              Text(
                "Khek Lovers",
                style: TextStyle(fontSize: 13),
              ),
              SizedBox(
                height: 20,
              ),
            ],
            if (_start) ...[
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Login(),
                    ));
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(200, 50),
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    textStyle: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  child: Text("Get Started"))
            ]
          ],
        ),
      ),
    );
  }
}

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => LoginState();
}

class LoginState extends State<Login> {
  final LocalAuthentication auth = LocalAuthentication();
  Services dataServices = Services();
  bool isObscured = true;
  bool Obscured_Daftar = true;
  bool Obscured_Owner = true;

  String? error_Username;
  String? error_Pass;

  TextEditingController _passKaryawan = TextEditingController();
  TextEditingController _passDaftar = TextEditingController();
  TextEditingController _owner = TextEditingController();
  TextEditingController _usernameKaryawan = TextEditingController();

  void checkedData(String nama, String password) async {
    KaryawanDB db = KaryawanDB();
    var DataCheck = await db.fetchData(nama);

    if (DataCheck != null && DataCheck['coloumnPass'] == password) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: ((context) => Fitur2())));
    } else {
      setState(() {
        error_Username = DataCheck == null ? "Username tidak ditemukan" : null;
        error_Pass = DataCheck != null && DataCheck[db.columnpass] != password
            ? "password tidak sesuai"
            : null;
      });
    }
  }

  @override
  void dispose() {
    _passKaryawan.dispose();
    _usernameKaryawan.dispose();
    _passDaftar.dispose();
    _owner.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: MediaQuery.of(context).size.height,
      padding: EdgeInsets.all(30),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CarouselSlider(
              items: [
                Column(
                  // crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "Login as cashcier",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Text("Hey, Enter your detail to get sign in"),
                    Text("to your account"),
                    SizedBox(height: 30),
                    TextField(
                      controller: _usernameKaryawan,
                      decoration: InputDecoration(
                        labelText: 'username',
                        labelStyle: TextStyle(
                            color: Color(0xff800000),
                            // fontWeight: FontWeight.bold,
                            fontSize: 10),
                        prefixIcon: Icon(
                          Icons.supervised_user_circle_outlined,
                          color: Colors.black,
                          // Color(0xff800000),
                          size: 30,
                        ),
                        focusedBorder: OutlineInputBorder(
                            // borderSide: BorderSide(color: Color(0xff800000)),
                            borderRadius: BorderRadius.circular(30)),
                        enabledBorder: OutlineInputBorder(
                            // borderSide: BorderSide(color: Color(0xff800000)),
                            borderRadius: BorderRadius.circular(30)),
                        errorText: error_Username,
                      ),
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 50),
                    TextField(
                      controller: _passKaryawan,
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              // borderSide: BorderSide(color: Color(0xffFEFF9F)),
                              borderRadius: BorderRadius.circular(30)),
                          enabledBorder: OutlineInputBorder(
                              // borderSide: BorderSide(color: Color(0xffFEFF9F)),
                              borderRadius: BorderRadius.circular(30)),
                          errorText: error_Pass,
                          labelText: "Password",
                          labelStyle: TextStyle(
                            color: Color(0xff800000),
                            // fontWeight: FontWeight.bold,
                            fontSize: 10,
                          ),
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Colors.black,
                          ),
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  isObscured = !isObscured;
                                });
                              },
                              icon: Icon(
                                isObscured
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: Colors.black,
                              ))),
                      obscureText: isObscured,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                          onPressed: () {
                            // Navigator.of(context).push(MaterialPageRoute(
                            //     builder: ((context) =>
                            //         UpdateData(nama: _usernameKaryawan.text))));
                          },
                          child: Text(
                            "Forgot Password",
                            textAlign: TextAlign.end,
                          )),
                    ),
                    SizedBox(height: 50),
                    ElevatedButton(
                      onPressed: () {
                        checkedData(_usernameKaryawan.text, _passKaryawan.text);
                      },
                      child: Text("Sign-In"),
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(MediaQuery.of(context).size.width, 50),
                        foregroundColor: Colors.white,
                        backgroundColor: Color(0xff800000),
                        elevation: 5,
                        surfaceTintColor: Color(0xff800000),
                        shadowColor: Color(0xff800000),
                      ),
                    ),
                    SizedBox(height: 50),
                    Row(
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 1,
                          ),
                        ),
                        TextButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Register();
                                  });
                            },
                            child: Text("Don't have an accont ?")),
                        Expanded(child: Divider())
                      ],
                    ),
                  ],
                ),
                Column(
                  // crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "Login as owner",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Text("Hey, Enter your detail to get sign in"),
                    Text("to your account"),
                    SizedBox(height: 30),
                    TextField(
                      decoration: InputDecoration(
                          labelText: 'username',
                          labelStyle: TextStyle(
                              color: Color(0xff800000),
                              // fontWeight: FontWeight.bold,
                              fontSize: 10),
                          prefixIcon: Icon(
                            Icons.supervised_user_circle_outlined,
                            color: Colors.black,
                            // Color(0xff800000),
                            size: 30,
                          ),
                          focusedBorder: OutlineInputBorder(
                              // borderSide: BorderSide(color: Color(0xff800000)),
                              borderRadius: BorderRadius.circular(30)),
                          enabledBorder: OutlineInputBorder(
                              // borderSide: BorderSide(color: Color(0xff800000)),
                              borderRadius: BorderRadius.circular(30))),
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
                              borderRadius: BorderRadius.circular(30)),
                          enabledBorder: OutlineInputBorder(
                              // borderSide: BorderSide(color: Color(0xffFEFF9F)),
                              borderRadius: BorderRadius.circular(30)),
                          labelText: "Password",
                          labelStyle: TextStyle(
                            color: Color(0xff800000),
                            // fontWeight: FontWeight.bold,
                            fontSize: 10,
                          ),
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Colors.black,
                          ),
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  Obscured_Owner = !Obscured_Owner;
                                });
                              },
                              icon: Icon(
                                Obscured_Owner
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: Colors.black,
                              ))),
                      obscureText: Obscured_Owner,
                    ),
                    SizedBox(height: 50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      // crossAxisAlignment: CrossAxisAlignment.baseline,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Fitur_Home(),
                            ));
                          },
                          child: Text("Sign-In"),
                          style: ElevatedButton.styleFrom(
                            fixedSize: Size(350, 50),
                            foregroundColor: Colors.white,
                            backgroundColor: Color(0xff800000),
                            elevation: 5,
                            surfaceTintColor: Color(0xff800000),
                            shadowColor: Color(0xff800000),
                          ),
                        ),
                        GestureDetector(
                            onTap: () async {
                              final List<BiometricType> availableBiometrics =
                                  await auth.getAvailableBiometrics();
                              if (availableBiometrics.isNotEmpty) {
                                print(availableBiometrics);
                              }
                              final bool canAuthenticateWithBiometrics =
                                  await auth.canCheckBiometrics;
                              if (canAuthenticateWithBiometrics) {
                                try {
                                  final bool didAuthenticate =
                                      await auth.authenticate(
                                    localizedReason: "Please",
                                    options: AuthenticationOptions(
                                      biometricOnly: false,
                                      stickyAuth: true,
                                    ),
                                  );

                                  if (didAuthenticate) {
                                    Navigator.of(context).pushAndRemoveUntil(
                                        MaterialPageRoute(
                                          builder: (context) => Fitur_Home(),
                                        ),
                                        (route) => false);
                                  }
                                } catch (e) {
                                  print(e);
                                }
                              }
                            },
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                              child: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                    color: Color(0xff800000),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Icon(
                                  Icons.fingerprint,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ),
                            ))
                      ],
                    ),
                  ],
                )
              ],
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height,
                autoPlay: true,
                viewportFraction: 1.0,
                autoPlayCurve: Curves.fastOutSlowIn,
                autoPlayAnimationDuration: Duration(milliseconds: 5000),
                autoPlayInterval: Duration(seconds: 5),
                enableInfiniteScroll: false,
                aspectRatio: 2.0,
                enlargeCenterPage: true,
                // onPageChanged: (index , reason){
                //   setState(() {
                //     activeIndex = index ;
                //   });
              ),
            )
          ],
        ),
      ),
    ));
  }
}
