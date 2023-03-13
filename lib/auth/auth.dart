import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:nft_call/auth/auth_handler.dart';
import 'package:nft_call/view/login/login_view.dart';
import 'package:nft_call/view/root/root_view.dart';

class AuthController extends GetxController {
  static AuthController get instance => Get.find();
  final _auth = FirebaseAuth.instance;
  final Rx<User?> currentUser = Rx<User?>(FirebaseAuth.instance.currentUser);
  final _googleSignIn = GoogleSignIn(scopes: ['email']);
  final googleUser = Rx<GoogleSignInAccount?>(null);

  @override
  void onReady() {
    currentUser.bindStream(_auth.authStateChanges());
    _setInitialScreen(_auth.currentUser);
    super.onReady();
  }

  _setInitialScreen(User? user) {
    user == null ? Get.offAll(() => LoginView()) : Get.offAll(() => RootView());
  }

  Future<void> signOut() async {
    await _auth.signOut();
    await _googleSignIn.signOut();
    Get.offAll(() => LoginView());
  }

  Future<void> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);

      Get.offAll(RootView());
    } on FirebaseAuthException catch (e) {
      final message = AuthExceptionHandler.generateExceptionMessage(e.code);
      showToastMessage(message);
    } catch (e) {
      showToastMessage(e.toString());
    }
  }

  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((authUser) => authUser.user?.sendEmailVerification())
          .then((value) => showToastMessage(
              "We have send you a confirmation email to verify your account"));

      Fluttertoast.showToast(
          msg: "You can login now",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.blueGrey,
          textColor: Colors.white,
          fontSize: 16.0);
    } on FirebaseAuthException catch (e) {
      final message = AuthExceptionHandler.generateExceptionMessage(e.code);
      showToastMessage(message);
    } catch (e) {
      showToastMessage(e.toString());
    }
  }

  String? getCurrentUserId() {
    return _auth.currentUser?.uid;
  }

  Future<void> signInWithGoogle() async {
    try {
      googleUser.value = await _googleSignIn.signIn();

      if (googleUser.value != null) {
        final GoogleSignInAuthentication? googleSignInAuthentication =
            await googleUser.value?.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication?.idToken,
          accessToken: googleSignInAuthentication?.accessToken,
        );

        await _auth.signInWithCredential(credential).then((authUser) {
          if (!authUser.user!.emailVerified) {
            authUser.user?.sendEmailVerification();
          }
        });
        Get.offAll(() => RootView());
      }
    } catch (e) {
      showToastMessage(e.toString());
    }
  }

  Future<void> resetPassword({required String email}) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      final message = AuthExceptionHandler.generateExceptionMessage(e.code);
      showToastMessage(message);
    } catch (e) {
      showToastMessage(e.toString());
    }
  }

  void showToastMessage(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.blueGrey,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
