import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:nft_call/view/login/login_view.dart';
import 'package:nft_call/view/root/root_view.dart';

class AuthController extends GetxController {
  static AuthController get instance => Get.find();
  final _auth = FirebaseAuth.instance;
  late final Rx<User?> currentUser;
  final _googleSignIn = GoogleSignIn();
  final googleUser = Rx<GoogleSignInAccount?>(null);

  @override
  void onReady() {
    currentUser = Rx<User?>(_auth.currentUser);
    currentUser.bindStream(_auth.authStateChanges());
    ever(currentUser, _setInitialScreen);
    super.onReady();
  }

  _setInitialScreen(User? user) {
    user == null ? Get.offAll(() => LoginView()) : Get.offAll(() => RootView());
  }

  Future<void> signOut() async {
    await _auth.signOut();
    await _googleSignIn.signOut();
  }

  Future<void> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    await _auth.signInWithEmailAndPassword(
        email: email, password: password);
  }
  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
  }
  Future<String?> getCurrentUserId() async {
    return _auth.currentUser?.uid;
  }

  Future<void> signInWithGoogle() async {
    googleUser.value = await _googleSignIn.signIn();
  }
  Future<void> resetPassword({required String email}) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

}
