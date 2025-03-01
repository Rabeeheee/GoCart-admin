import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthenticationRepository extends GetxController{
  static AuthenticationRepository get instance => Get.find();


  final _auth = FirebaseAuth.instance;

  User? get authUser => _auth.currentUser;
 
  bool get isAuthenticated => _auth.currentUser != null;

  @override
  void onReady(){
    _auth.setPersistence(Persistence.LOCAL);
  }

  // void screenRedirect() async{
  //   final user = _auth.currentUser;
  //     if(user != null){
  //       Get.offAllNamed(TRoutes.dashboard);
  //     }else{
  //       Get.offAllNamed(TRoutes.login);
  //     }
  // }
}