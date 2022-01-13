import 'dart:convert';
import 'dart:io';
import 'package:api_login/api/api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'home.dart';

final Shader linearGradient = const LinearGradient(
  colors: <Color>[Color(0xffDA44bb), Color(0xff8921aa)],
).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

class SIgnUp extends StatefulWidget {
  const SIgnUp({Key? key}) : super(key: key);

  @override
  _SIgnUpState createState() => _SIgnUpState();
}

class _SIgnUpState extends State<SIgnUp> {

  final _formKey = GlobalKey<FormState>();
  late String fname,lname, phone, email, password;
  bool isLoading=false;
  GlobalKey<ScaffoldState>_scaffoldKey=GlobalKey();
  late ScaffoldMessengerState scaffoldMessenger ;
  var reg=RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  TextEditingController _fnameController=new TextEditingController();
  TextEditingController _lnameController=new TextEditingController();
  TextEditingController _phoneNumberController=new TextEditingController();
  TextEditingController _emailController=new TextEditingController();
  TextEditingController _passwordController=new TextEditingController();

  @override
  Widget build(BuildContext context) {
    scaffoldMessenger = ScaffoldMessenger.of(context);
    return Scaffold(
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: double.infinity,
                child: Image.asset(
                  "assets/ggg.jpg",
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Center(
                        child: Image.asset(
                          "assets/logo.png",
                          color: Colors.deepPurpleAccent,
                          height: 30,
                          width: 30,
                          alignment: Alignment.center,
                        ),
                    ),
                    const SizedBox(
                      height: 13,
                    ),
                    Text(
                      'Summit Communications',
                      style: TextStyle(
                          fontSize: 27.0,
                          fontWeight: FontWeight.bold,
                          foreground: Paint()..shader = linearGradient),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Sign Up",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                          color: Colors.deepOrange,
                          letterSpacing: 1,
                          fontSize: 23,
                        ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Form(
                      key: _formKey,
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 45),
                        child: Column(
                          children:  <Widget>[
                            TextFormField(
                              style: const TextStyle(
                                color: Colors.deepPurple,
                              ),
                              controller: _fnameController,
                              decoration: const InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.deepPurple)),
                                hintText: "First Name",
                                hintStyle: TextStyle(
                                    color: Colors.deepPurple, fontSize: 15),
                              ),
                              onSaved: (val) {
                                fname = val!;
                              },
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            TextFormField(
                              style: const TextStyle(
                                color: Colors.deepPurple,
                              ),
                              controller: _lnameController,
                              decoration: const InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.deepPurple)),
                                hintText: "Last Name",
                                hintStyle: TextStyle(
                                    color: Colors.deepPurple, fontSize: 15),
                              ),
                              onSaved: (val) {
                                lname = val!;
                              },
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            TextFormField(
                              keyboardType: TextInputType.phone,
                              style: const TextStyle(
                                color: Colors.deepPurple,
                              ),
                              controller: _phoneNumberController,
                              decoration: const InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.deepPurple)),
                                hintText: "Phone Number",
                                hintStyle: TextStyle(
                                    color: Colors.deepPurple, fontSize: 15),
                              ),
                              onSaved: (val) {
                                phone = val!;
                              },
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              style: const TextStyle(
                                color: Colors.deepPurple,
                              ),
                              controller: _emailController,
                              decoration: const InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.deepPurple)),
                                hintText: "Email",
                                hintStyle: TextStyle(
                                    color: Colors.deepPurple, fontSize: 15),
                              ),
                              onSaved: (val) {
                                email = val!;
                              },
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            TextFormField(
                              style: const TextStyle(
                                color: Colors.deepPurple,
                              ),
                              controller: _passwordController,
                              decoration: const InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.deepPurple)),
                                hintText: "Password",
                                hintStyle: TextStyle(
                                    color: Colors.deepPurple, fontSize: 15),
                              ),
                              onSaved: (val) {
                                password = val!;
                              },
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Stack(
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  width: double.infinity,
                                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                                  height: 50,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.white),
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: InkWell(
                                    onTap: (){
                                      if(isLoading)
                                      {
                                        return;
                                      }
                                      if(_fnameController.text.isEmpty)
                                      {
                                        scaffoldMessenger.showSnackBar(const SnackBar(content:Text("Please Enter First Name")));
                                        return;
                                      }
                                      if(_lnameController.text.isEmpty)
                                      {
                                        scaffoldMessenger.showSnackBar(const SnackBar(content:Text("Please Enter Last Name")));
                                        return;
                                      }
                                      if(_phoneNumberController.text.isEmpty)
                                      {
                                        scaffoldMessenger.showSnackBar(const SnackBar(content:Text("Please Enter Phone Number")));
                                        return;
                                      }
                                      if(!reg.hasMatch(_emailController.text))
                                      {
                                        scaffoldMessenger.showSnackBar(const SnackBar(content:Text("Enter Valid Email")));
                                        return;
                                      }
                                      if(_passwordController.text.isEmpty||_passwordController.text.length<6)
                                      {
                                        scaffoldMessenger.showSnackBar(const SnackBar(content:Text("Password should be min 6 characters")));
                                        return;
                                      }
                                       signup(_fnameController.text,_lnameController.text,_phoneNumberController.text,
                                           _emailController.text,_passwordController.text);
                                    },
                                    child: const Text(
                                      "CREATE ACCOUNT",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                              color: Colors.deepPurple,
                                              fontSize: 16,
                                              letterSpacing: 1),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  child: (isLoading)?Center(
                                      child: Container(
                                          height:26,
                                          width: 26,
                                          child: const CircularProgressIndicator(
                                            backgroundColor: Colors.green,
                                          ),
                                      ),
                                  ):Container(),
                                  right: 30,
                                  bottom: 0,
                                  top: 0,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        //Navigator.pushReplacementNamed(context, "/signin");
                      },
                      child: const Text(
                        "Already have an account?",
                        style: TextStyle(
                                color: Colors.white70,
                                fontSize: 13,
                                decoration: TextDecoration.underline,
                                letterSpacing: 0.5,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  signup(fname, lname, phone, email, password) async
  {
    setState(() {
      isLoading=true;
    });
    print("Calling");
    Map data = {
      'fname' : fname,
      'lname' : lname,
      'phone' : phone,
      'email' : email,
      'password' : password,
    };
    print(data.toString());
    final  response= await http.post(
        Uri.parse(REGISTRATION),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/x-www-form-urlencoded"
        },
        body: data,
        encoding: Encoding.getByName("utf-8")
    );

    if(response.statusCode == 200)
      {
        setState(() {
          isLoading = false;
        });
        Map<String,dynamic>resposne=jsonDecode(response.body);
        if(!resposne['error'])
        {
          Map<String,dynamic>user=resposne['data'];
          print(" First name ${user['data']}");
          print(" last name ${user['data']}");
          print(" phone number ${user['data']}");
          print(" enail ${user['data']}");
          savePref(user['fname'],user['lname'],user['phone'],user['email']);
          Navigator.pushReplacementNamed(context, "/home");
        }
        else{
          print(" ${resposne['message']}");
        }
        scaffoldMessenger.showSnackBar(SnackBar(content:Text("${resposne['message']}")));
      }
    else {
      scaffoldMessenger.showSnackBar(const SnackBar(content:Text("Please Try again")));
    }
  }
  savePref(String fname, String lname,String phone, String email) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("fname", fname);
    preferences.setString("lname", lname);
    preferences.setString("lname", lname);
    preferences.setString("email", email);
    preferences.commit();
  }
}
