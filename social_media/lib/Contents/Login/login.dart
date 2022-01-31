import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:social_media/Authentication/anonauth.dart';
import 'package:social_media/Authentication/phoneauth.dart';
import 'package:social_media/Shared/navigation.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<User> _handleSignIn() async {
    GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    final UserCredential authResult =
        await _auth.signInWithCredential(credential);
    User user = authResult.user;
    return user;
  }

  final formKey = new GlobalKey<FormState>();
  final globalKey = GlobalKey<ScaffoldState>();
  String phoneNo, verificationId, smsCode;
  bool codeSent = false;
  TextEditingController phonecontroller = new TextEditingController();
  @override
  Future<void> verifyPhone(phoneNo) async {
    final FirebaseAuth _auth = FirebaseAuth.instance;

    final PhoneVerificationCompleted verified =
        (AuthCredential authResult) async {
      AuthPhone().signIn(authResult);
    };

    final PhoneVerificationFailed verificationFailed =
        (FirebaseAuthException authException) {
      print('${authException.message}');
    };

    final PhoneCodeSent smsSent = (String verId, [int forceResend]) {
      this.verificationId = verId;
      setState(() {
        this.codeSent = true;
      });
    };

    final PhoneCodeAutoRetrievalTimeout autoTimeout = (String verId) {
      this.verificationId = verId;
    };

    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNo,
        timeout: Duration(seconds: 60),
        verificationCompleted: verified,
        verificationFailed: verificationFailed,
        codeSent: smsSent,
        codeAutoRetrievalTimeout: autoTimeout);
  }
  final AnonymousLogin _anonAuth=AnonymousLogin();

  GoogleSignIn _googleAuth = new GoogleSignIn();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[600],
        elevation: 0,
        title: Text(
          'Socify',
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
        actions: [
          FlatButton.icon(
              onPressed: () {},
              icon: Icon(
                Icons.email_outlined,
                color: Colors.white,
              ),
              label: Text('Contact Support',
                  style: TextStyle(
                    color: Colors.white,
                  )))
        ],
      ),
      resizeToAvoidBottomInset: false,
      body: Container(
        color: Colors.blue[600],
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 1.0),
                            blurRadius: 6.0,
                          )
                        ]),
                    margin: EdgeInsets.fromLTRB(20, 30, 20, 20),
                    padding: EdgeInsets.fromLTRB(20, 30, 20, 60),
                    child: Column(
                      children: <Widget>[
                        Text('Enter your phone number below',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.w300,
                            )),
                        Divider(),
                        SizedBox(height: 50),
                        Form(
                          //key: formKey,
                          child: Column(
                            children: [
                              TextFormField(
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Enter a phone number';
                                  }
                                  return null;
                                },
                                // keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    labelText: 'Enter your phone number',
                                    prefixIcon: Icon(Icons.phone)),
                                onChanged: (val) {
                                  this.phoneNo = val;
                                },
                              ),
                              codeSent
                                  ? TextFormField(
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                          labelText: 'Enter sent code',
                                          prefixIcon: Icon(Icons.code)),
                                      onChanged: (val) {
                                        setState(() {
                                          this.smsCode = val;
                                        });
                                      },
                                    )
                                  : Container(),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 40.0),
                          child: ButtonTheme(
                            minWidth: 250.0,
                            height: 50.0,
                            buttonColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            textTheme: ButtonTextTheme.accent,
                            child: FlatButton(
                              child: Text(
                                'Login',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                              onPressed: () {
                                codeSent
                                    ? AuthPhone()
                                        .signInWithOTP(smsCode, verificationId)
                                    : verifyPhone(phoneNo);
                              },
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
                child: Container(
                    height: 50,
                    width: 250,
                    margin: EdgeInsets.only(top: 25),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.white,
                        border: Border.all(color: Colors.grey)),
                    child: Center(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          height: 30.0,
                          width: 30.0,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/googlelogo.png'),
                                fit: BoxFit.cover),
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Sign in with Google',
                          style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                      ],
                    ))),
                onTap: () {
                  _handleSignIn().then((result) {
                    if (result != null) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return Navigation();
                          },
                        ),
                      );
                    }
                  });
                }),
            InkWell(
                child: Container(
                    height: 50,
                    width: 250,
                    margin: EdgeInsets.only(top: 25),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.white,
                        border: Border.all(color: Colors.grey)),
                    child: Center(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          height: 30.0,
                          width: 30.0,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/anonymous.png'),
                                fit: BoxFit.cover),
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Anonymous sign in',
                          style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                      ],
                    )
                    )
                    ),
                onTap: () async{
                 dynamic result= await _anonAuth.signInAnon();
                 if(result==null){
                   print('error sign in');
                 }else{
                   print('user signed in');
                   print(result.uid);
                 }
                }),
          ],
        ),
      ),
    );
  }
}
