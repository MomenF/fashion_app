import 'package:firebase_auth/firebase_auth.dart';

class AuthService{

  final auth = FirebaseAuth.instance;
  Future<String?> signIn(String email,String password)async{
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password
      );


      print("user Cre ${userCredential.user!.email}");
      return "Sucess signIn";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');





      }
    }

  }
  Future<String?> signUp(String email ,String Password)async{
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: Password
      );
      print("user Cre ${userCredential.user!.email}");
      return "Sucess signUp";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

}