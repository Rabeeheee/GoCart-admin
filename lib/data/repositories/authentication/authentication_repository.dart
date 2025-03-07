import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/layouts/side_bars/side_bar_controller.dart';
import 'package:yt_ecommerce_admin_panel/routes/routes.dart';
import 'package:yt_ecommerce_admin_panel/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:yt_ecommerce_admin_panel/utils/exceptions/firebase_exceptions.dart';
import 'package:yt_ecommerce_admin_panel/utils/exceptions/format_exceptions.dart';
import 'package:yt_ecommerce_admin_panel/utils/exceptions/platform_exceptions.dart';

class AuthenticationRepository extends GetxController{
  static AuthenticationRepository get instance => Get.find();


  final _auth = FirebaseAuth.instance;

  User? get authUser => _auth.currentUser;
 
  bool get isAuthenticated => _auth.currentUser != null;

  @override
  void onReady(){
    _auth.setPersistence(Persistence.LOCAL);
  }


 void screenRedirect() async {
  final user = _auth.currentUser;
  final sidebarController = Get.put(SideBarController());

  if (user != null) {
    sidebarController.changeActiveItem(TRoutes.dashboard); 
    Get.offAllNamed(TRoutes.dashboard);
  } else {
    sidebarController.changeActiveItem(TRoutes.login); 
    Get.offAllNamed(TRoutes.login);
  }
}



 
 Future<UserCredential> loginWithEmailAndPassword(String email, String password) async {
  try{
   return await _auth.signInWithEmailAndPassword(email: email, password: password);

  }on FirebaseAuthException catch (e){
    throw TFirebaseAuthException(e.code).message;
  }on FirebaseException catch (e){
    throw TFirebaseException(e.code).message;
  }on FormatException catch (_){
    throw TFormatException();
  }on PlatformException catch (e) {
    throw TPlatformException(e.code).message;
  }catch (e) {
    throw 'Something went wrong. Please try again';
  }
 }

 Future<UserCredential> registerWithEmailAndPassword(String email, String password) async {
  try{
   return await _auth.createUserWithEmailAndPassword(email: email, password: password);

  }on FirebaseAuthException catch (e){
    throw TFirebaseAuthException(e.code).message;
  }on FirebaseException catch (e){
    throw TFirebaseException(e.code).message;
  }on FormatException catch (_){
    throw TFormatException();
  }on PlatformException catch (e) {
    throw TPlatformException(e.code).message;
  }catch (e) {
    throw 'Something went wrong. Please try again';
  }
 }
 Future<void> logout() async {
  try{
    await FirebaseAuth.instance.signOut();
    Get.offAllNamed(TRoutes.login);
  }on FirebaseAuthException catch (e){
    throw TFirebaseAuthException(e.code).message;
  }on FirebaseException catch (e){
    throw TFirebaseException(e.code).message;
  }on FormatException catch (_){
    throw TFormatException();
  }on PlatformException catch (e) {
    throw TPlatformException(e.code).message;
  }catch (e) {
    throw 'Something went wrong. Please try again';
  }
 }

 Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }


}