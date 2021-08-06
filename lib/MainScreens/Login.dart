import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  //Todo Variables
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  bool showPassword = true;
  var formKey = GlobalKey<FormState>();
  FirebaseAuth auth = FirebaseAuth.instance;
  bool userfound = true;

  // Future<String?> signIn(String email,String password)async{
  //   try {
  //     UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
  //         email: email,
  //         password: password
  //     );
  //
  //
  //     print("user Cre ${userCredential.user!.email}");
  //     return "Sucess signIn";
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'user-not-found') {
  //       print('No user found for that email.');
  //        getUserfound(false);
  //     } else if (e.code == 'wrong-password') {
  //       print('Wrong password provided for that user.');
  //       getUserfound(false);
  //     }
  //   }
  //
  // }

void validation (){
  formKey.currentState!.validate();
}
  @override
  void initState() {
    controller = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
    );
    controller.forward();
    controller.addListener(() {
      setState(() {
        print(controller.value);
      });
    });

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Fashion App",
            style: TextStyle(
                fontSize: 20,
                fontFamily: "JuliusSansOne",
                color: Colors.white,
                fontWeight: FontWeight.bold,
                letterSpacing: 5,
                shadows: [
                  Shadow(color: Colors.black, blurRadius: 4),
                ]),
          ),
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
                          ),
                          decoration: BoxDecoration(
                              color:
                                  Colors.orange.withOpacity(controller.value),
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
                        TextWordAnimated(
                          title: "Login Page",
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                      ),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 15),
                      decoration: BoxDecoration(
                          color: Colors.amber.withOpacity(controller.value),
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
                                fillColor:
                                    Colors.white.withOpacity(controller.value),
                                hintText: 'Email address or User name ',
                                prefixIcon: Icon(
                                  Icons.email,
                                  color: Colors.redAccent
                                      .withOpacity(controller.value),
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
                                errorText: userfound ? null : "No Account User",
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      showPassword = !showPassword;
                                    });
                                  },
                                  icon: Icon(
                                    showPassword
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Colors.red
                                        .withOpacity(controller.value),
                                  ),
                                ),
                                filled: true,
                                fillColor:
                                    Colors.white.withOpacity(controller.value),
                                hintText: 'Password ',
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: Colors.redAccent
                                      .withOpacity(controller.value),
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
                                } else if (userfound == false) {
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
                                    onPressed: () {},
                                    child: Text(
                                      "Reset Password ",
                                      style: TextStyle(
                                        color: Colors.blue
                                            .withOpacity(controller.value),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )),
                              ],
                            ),
                            /** Login Bar**/
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: MaterialButton(
                                child: TextWordBar(
                                  title: "Sign in",
                                ),
                                onPressed: ()  {
                                  print("Ckick henaaa Ya hamada");

                                     FirebaseAuth.instance.signInWithEmailAndPassword(
                                      email: emailController.text.trim(),
                                      password: passwordController.text.trim(),
                                    ).then(  (value) {  if(value.user!= null){
                                      Navigator.pushNamedAndRemoveUntil(
                                          context, "/home", (route) => false); } } ).catchError((e){
                                      if (e.code == 'user-not-found') {
                                        print('No user found for that email.');
                                        setState(() {
                                          // userfound = false ;
                                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                              content: Text(
                                                  "No user found for that email.")));
                                        });
                                      } else if (e.code == 'wrong-password') {
                                        print('Wrong password provided for that user.');
                                        setState(() {
                                          // userfound = false ;
                                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                              content: Text(
                                                  "Wrong password provided for that user.")));
                                        }); } });







                                  }

                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            /** SignUp Bar**/
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.red.withOpacity(controller.value),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: MaterialButton(
                                child: TextWordBar(title: "Sign up"),
                                onPressed: () {
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

class TextWordAnimated extends StatelessWidget {
  String? title;

  TextWordAnimated({
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 250.0,
          child: DefaultTextStyle(
            style: const TextStyle(
                fontSize: 22,
                fontFamily: "Pacifico-Regular",
                color: Colors.white,
                fontWeight: FontWeight.bold,
                shadows: [Shadow(color: Colors.black, blurRadius: 10)]),
            child: AnimatedTextKit(
              repeatForever: true,
              animatedTexts: [
                TyperAnimatedText("$title", textAlign: TextAlign.center),
              ],
              onTap: () {
                print("Tap Event");
              },
            ),
          ),
        ),
      ],
    );
  }
}

class TextWordBar extends StatelessWidget {
  String? title;

  TextWordBar({
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 250.0,
          child: DefaultTextStyle(
            style: const TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                shadows: [Shadow(color: Colors.black, blurRadius: 10)]),
            child: AnimatedTextKit(
              repeatForever: true,
              animatedTexts: [
                TyperAnimatedText("$title", textAlign: TextAlign.center),
              ],
              onTap: () {
                print("Tap Event");
              },
            ),
          ),
        ),
      ],
    );
  }
}

/*
* Text(
                          "Login Page",
                          style: TextStyle(
                              fontSize: 25,
                              fontFamily: "Pacifico-Regular",
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              shadows: [
                                Shadow(color: Colors.black, blurRadius: 10)
                              ]),
                        )*/
