import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kisanseva/screens/dashboard.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const String id = 'login_screen';
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _auth = FirebaseAuth.instance;
  late String emailid;
  late String passwd;

  // final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  // final formKey = GlobalKey<FormState>();
  // final TextEditingController phoneNumber = TextEditingController();
  // final TextEditingController email = TextEditingController();
  // final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Login',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        home: Scaffold(
            // key: _scaffoldKey,
            appBar: AppBar(
              title: const Text('Login'),
            ),
            backgroundColor: const Color(0xFFffffff),
            body: Center(
              child: Container(
                height: 300,
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Form(
                  // key: formKey, //key for form
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "Farmer",
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      /*TextField(
                        controller: phoneNumber,
                        enableInteractiveSelection: false,
                        keyboardType: TextInputType.number,
                        decoration:
                        //InputDecoration(labelText: "Enter your Number"),
                        InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.black, width: 1.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.black, width: 1.0),
                          ),
                          hintText: '10 Digit Contact No',
                        ),
                        maxLength: 10,
                        validator: (value) {
                          String patttern = r'(^[0-9]*$)';
                          RegExp regExp = new RegExp(patttern);
                          if (value?.length == 0) {
                            return "Mobile is Required";
                          } else if (!regExp.hasMatch(value!)) {
                            return "Mobile Number must be digits";
                          } else if (value.length != 10) {
                            return "Mobile number must 10 digits";
                          }
                          return null;
                        },
                      ),*/
                      TextField(
                        keyboardType: TextInputType.emailAddress,
                        // controller: email,
                        onChanged: (value) {
                          emailid = value;
                        },
                        // enableInteractiveSelection: false,
                        decoration:
                        const InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.black, width: 1.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.black, width: 1.0),
                          ),
                          hintText: 'Enter you Email',
                        ),
                      ),
                      const SizedBox(height: 25),
                      TextField(
                        // controller: password,
                        onChanged: (value) {
                          passwd = value;
                        },
                        obscureText: true,
                        // enableInteractiveSelection: false,
                        decoration:
                        //InputDecoration(labelText: "Enter your Number"),
                        const InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.black, width: 1.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.black, width: 1.0),
                          ),
                          hintText: 'Enter you password',
                        ),
                      ),
                      const SizedBox(height: 25),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Material(
                          elevation: 5.0,
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(30.0),
                          child: MaterialButton(
                            // onPressed: () {
                            //   //Navigator.pushNamed(context, Loading.id);
                            //   print("Hello");
                            // },
                            onPressed: () async {
                              try {
                                print(emailid);
                                print(passwd);

                                final user = await _auth.signInWithEmailAndPassword(
                                    email: emailid, password: passwd);

                                if (user != null) {
                                  // final SharedPreferences sharedPreferences =
                                  //     await SharedPreferences.getInstance();
                                  // sharedPreferences.setInt('Login_status', 1);
                                  print(emailid);
                                  print(passwd);
                                  Navigator.pushNamed(context, DashBoard.id);
                                }
                              } catch (e) {
                                print(e);
                              }
                            },
                            minWidth: 200.0,
                            height: 42.0,
                            child: const Text(
                              'Log In',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),

                      /* ElevatedButton(
                          child: Text('Submit'),
                          onPressed: () async {
                            print('Hello');
                          // setState(() {
                          // showSpinner = true;
                          // });
                          try {
                            final user = await _auth.signInWithEmailAndPassword(
                            email: emailid, password: passwd);
                            if (user != null) {
                            Navigator.pushNamed(context, DashBoard.id);
                          }

                          // setState(() {
                          // showSpinner = false;
                          // });

                          } catch (e) {
                            print(e);
                            }
                          Navigator.pushNamed(context, DashBoard.id);
                          },
                         // onPressed: () async {
                            if (formKey.currentState!.validate()) {
                              final String contact = phoneNumber.text;
                             //// final SharedPreferences sharedPreferences =
                              await SharedPreferences.getInstance();
                              sharedPreferences.setString('role_id', '1');////
                              final String role_id = "1";
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => OTPVerification(contact)),
                              );



                              setState(() {

                              });
                            }

                          },//

                          style: ElevatedButton.styleFrom(
                            // background color
                              primary: Colors.red[900],
                              padding: EdgeInsets.symmetric(
                                horizontal: 50,
                                vertical: 15,
                              ))),*/
                      // _user == null
                      //     ? Container()
                      //     : Text("The otp ${_user!.otp.toString()}"),
                    ],
                  ),
                ),
              ),
            )));
  }
}