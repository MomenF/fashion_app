import 'package:e_commerce_app/Services/Firebase/Authentication.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //Todo Variables
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  bool showPassword = true;
  var formKey = GlobalKey<FormState>();
  FireAuth? auth ;
  FirebaseAuth error = FirebaseAuth.instance;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Fashion App",style: TextStyle(
              fontSize: 20,
            fontFamily: "JuliusSansOne",
            color: Colors.white,
              fontWeight: FontWeight.bold,
            letterSpacing: 5,
            shadows: [
              Shadow(
                color: Colors.black,
                blurRadius: 4
              ),
            ]


          ),),
          centerTitle: true,
          backgroundColor: Colors.orange,
        ),
        body: Container(
          height: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage("assets/images/coverLogin.png"),
            fit: BoxFit.fitHeight,
          )),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SingleChildScrollView(
                child: Stack(
                  alignment: AlignmentDirectional.bottomCenter,

                  children: [
                    Stack(
                      alignment: AlignmentDirectional.topCenter,
                      children: [
                        Container(
                          width: double.infinity,
                          margin: const EdgeInsets.symmetric(
                            horizontal: 5,
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 50,
                            vertical: 200,
                          ) ,
                          decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(40),
                                topRight: Radius.circular(40),
                              ),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black,
                                    offset: Offset.zero,
                                    spreadRadius: 5,
                                    blurRadius: 20)
                              ]),

                        ),
                        Text("Login Page",style: TextStyle(
                            fontSize: 25,
                            fontFamily: "Pacifico-Regular",
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            shadows: [
                              Shadow(
                                  color: Colors.black,
                                  blurRadius: 10
                              )
                            ]
                        ),)
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                      ),
                      margin: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 15
                      ),
                      decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white,
                              offset: Offset.zero,
                              spreadRadius: 1,
                            )
                          ]),
                      child: Form(
                        key: formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 15,
                            ),
                            /** Email Bar **/
                            TextFormField(
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,

                                hintText: 'Email address or User name ',
                                prefixIcon: Icon(
                                  Icons.email,
                                  color: Colors.redAccent,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              ),
                              keyboardType: TextInputType.emailAddress,
                              controller: emailController,
                              maxLines: 1,
                              // validator: (value) {
                              //   if (value!.isEmpty) {
                              //     return " please complete the empty Fields";
                              //   } else if (value != error.currentUser!.email) {
                              //     return "Wrong email address or username please try again";
                              //   } else {
                              //     return null;
                              //   }
                              // },
                            ),
                            /** Password Bar **/
                            SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  onPressed: (){
                                    setState(() {
                                      showPassword = !showPassword;
                                    });
                                  },
                                  icon: Icon(showPassword?Icons.visibility:Icons.visibility_off , color: Colors.red,),
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                hintText: 'Password ',
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: Colors.redAccent,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              ),
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: showPassword,
                              controller: passwordController,
                              maxLines: 1,
                              maxLength: 25,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return " This Fields Must not be empty";
                                } else if (value != error.currentUser!.email) {
                                  return "Wrong Email or Password ";
                                } else {
                                  return null;
                                }
                              },

                            ),
                            /** Forget Password Bar**/
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Do you forget password ?"),
                                TextButton(
                                    onPressed: (){},
                                    child: Text("Reset Password ",style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                    ),)),
                              ],
                            ),
                            /** Login Bar**/
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(25),
                              ) ,
                              child: MaterialButton(
                                child: Text("Login",style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold
                                ),),
                                onPressed: (){
                                  if(formKey.currentState!.validate()){
                                    auth!.SignIn(email: emailController.text, password: passwordController.text);
                                    Navigator.pushNamedAndRemoveUntil(
                                        context, "/home", (route) => false);
                                  }
                                },

                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            /** SignUp Bar**/
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(25),
                              ) ,
                              child: MaterialButton(
                                child: Text("Sign up",style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold
                                ),),
                                onPressed: (){
                                  Navigator.pushNamed(context, "/Register");
                                },

                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),



                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
