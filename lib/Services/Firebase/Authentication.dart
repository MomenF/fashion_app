import 'package:firebase_auth/firebase_auth.dart';

class FireAuth{

  FirebaseAuth auth = FirebaseAuth.instance;

  Future<dynamic> SignIn({required String email, required String password}) async {
    try {
      final authResult = await auth.signInWithEmailAndPassword(
          email: email,
          password: password
      );
      return authResult;
    }on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

}