import 'package:local_auth/local_auth.dart';

class Authentication{
  static final _auth = LocalAuthentication();

  static Future<bool>canAuthenticate() async =>await _auth.canCheckBiometrics || await _auth.isDeviceSupported();

  static Future<bool> authentication() async{
    try{
      if(!await canAuthenticate()) return false;
      return await _auth.authenticate(localizedReason: "get in to app");

    }catch(e){
      print('error $e');
      return false;
    }
  }

}