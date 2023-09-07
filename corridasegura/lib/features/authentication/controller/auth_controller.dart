import 'package:corridasegura/features/authentication/screens/login/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../screens/signup/home_screen.dart';

class AuthController extends GetxController {
  static AuthController get instance => Get.find();

  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;
  late final String uid;

  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
    uid = _auth.currentUser!.uid;
  }

  _setInitialScreen(User? user) {
    (user == null)
        ? Get.offAll(() => const LoginScreen())
        : Get.offAll(() => const HomeScreen());
  }

  Future signInEmail({required String email, required String password}) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      //Ir para HomeScreen
      Get.offAll(() => const HomeScreen());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.snackbar('Erro', 'Usuário não encontrado');
      }
      if (e.code == 'wrong-password') {
        Get.snackbar('Erro', 'Senha incorreta');
      }
    }
  }

  Future signUpEmail({required String email, required String password}) async {
    try {
      var userCredential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return userCredential.user!.uid;
      
    } on FirebaseAuthException {
      rethrow;
    }
  }

  Future signOut() async => await _auth.signOut();
}
