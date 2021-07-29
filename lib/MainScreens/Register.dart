import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //Todo Variables
  var formKey =GlobalKey<FormState>();
  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var emailRegisterController = TextEditingController();
  var passwordRegisterController = TextEditingController();
  var confirmPasswordRegisterController = TextEditingController();
  bool showPassword1 = true ;
  bool showPassword2 = true ;




  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
      body: Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [ Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/coverLogin.png"),
                fit: BoxFit.fitHeight,
              ),),),
          SingleChildScrollView(
            child: Stack(
              alignment: AlignmentDirectional.center,
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
                        vertical: 300,
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
                    Text("Registration Page",style: TextStyle(
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
                      horizontal: 15
                  ),
                  margin: const EdgeInsets.symmetric(
                    horizontal: 15,
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
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        /** First Name Bar **/
                        TextFormField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,

                            hintText: 'First name',
                            prefixIcon: Icon(
                              Icons.text_fields,
                              color: Colors.redAccent,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          controller: firstNameController,
                          maxLines: 1,


                        ),
                        SizedBox(
                          height: 10,
                        ),
                        /** Last Name Bar **/
                        TextFormField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,

                            hintText: 'Last name',
                            prefixIcon: Icon(
                              Icons.text_fields,
                              color: Colors.redAccent,
                            ),
                            border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          controller: lastNameController,
                          maxLines: 1,


                        ),
                        SizedBox(
                          height: 10,
                        ),
                        /** email Register Bar **/
                        TextFormField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Email Address',
                            prefixIcon: Icon(
                              Icons.email,
                              color: Colors.redAccent,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          controller: emailRegisterController,
                          maxLines: 1,
                          keyboardType:TextInputType.emailAddress ,
                          validator: (value){
                            if(value!.isEmpty){
                              return "This field must not be empty";
                            } return null;
                          },
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
                                  showPassword1 = !showPassword1;
                                });
                              },
                              icon: Icon(showPassword1?Icons.visibility:Icons.visibility_off , color: Colors.red,),
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
                          obscureText: showPassword1,
                          controller: passwordRegisterController,
                          maxLines: 1,
                          maxLength: 25,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return " This Field is Required";
                            } else{return  null ;}
                          },

                        ),
                        /** Confirm Password Bar **/
                        SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              onPressed: (){
                                setState(() {
                                  showPassword2 = !showPassword2;
                                });
                              },
                              icon: Icon(showPassword2?Icons.visibility:Icons.visibility_off , color: Colors.red,),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Confirm Password ',
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Colors.redAccent,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: showPassword2,
                          controller: confirmPasswordRegisterController,
                          maxLines: 1,
                          maxLength: 25,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return " This Field is Required";
                            }else if (value != passwordRegisterController.text ){
                              return "The Password is does not Match";
                            } else{return  null ;}
                          },

                        ),
                        /** SignUp Bar**/
                        SizedBox(
                          height: 5,
                        ),
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

                              if(formKey.currentState!.validate()){
                                Navigator.pushNamedAndRemoveUntil(
                                    context, "/home", (route) => false);
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text("Congratulation Registration Complete")));
                              }
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
        ]
        ),

    );
  }
}
