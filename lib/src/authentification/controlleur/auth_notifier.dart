import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:medical/common/services/storage.dart';
import 'package:medical/common/widgets/error_modal.dart';
import 'package:medical/src/authentification/models/auth_token_models.dart';
import 'package:medical/src/entrypoint/controllers/bottom_tab_notifier.dart';
import 'package:medical/src/profile/models/profile_models.dart';
import 'package:provider/provider.dart';

import '../../../common/utils/kstrings.dart';

class AuthNotifier with ChangeNotifier{

  bool _isLoading = false;
  bool _isRLoading = false;

  bool get isLoading => _isLoading;
  bool get isRLoading => _isRLoading;

  void setLoading() {
    _isLoading = !_isLoading;
    notifyListeners();
  }
  void setRLoading() {
    _isRLoading = !_isRLoading;
    notifyListeners();
  }
// Fonction pour se connecter
  void loginFunc(String data, BuildContext ctx) async {
    setLoading();
    try {
      var url = Uri.parse('http://10.0.2.2:8000/auth/token/login');
      var response = await http.post(url,
          headers: {
            'Content-Type': 'application/json',
          },
          body: data);
      if(response.statusCode == 200){
        String accessToken = accessTokenModelFromJson(response.body).authToken;
        Storage().setString('accessToken', accessToken);
        print(accessToken);
        getUser(accessToken,ctx);
        setLoading();
      }

    } catch (e) {
      setLoading();
      showErrorPopup(ctx, AppText.kErrorLogin, null, null);
    }
  }
  // Fonction pour rafrehir le token

  Future<void> checkAndRefreshToken(BuildContext ctx) async {
    String? accessToken = Storage().getString('accessToken');
    String? refreshToken = Storage().getString('refreshToken');

    if (accessToken != null) {
      // Vérifie si le token est encore valide
      var url = Uri.parse('http://10.0.2.2:8000/auth/users/me/');
      var response = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Token $accessToken'
      });

      if (response.statusCode == 200) {
        // Le token est valide, on continue normalement
        ctx.go("/entrypoint");
      } else if (response.statusCode == 401 && refreshToken != null) {
        // Token expiré, on tente un rafraîchissement
        await refreshAuthToken(ctx);
        String? newAccessToken = Storage().getString('accessToken');

        if (newAccessToken != null) {
          ctx.go("/entrypoint");
        } else {
          ctx.go("/login"); // Si le rafraîchissement échoue, on redirige vers la connexion
        }
      } else {
        ctx.go("/login"); // Aucune information de connexion valide, on redirige vers login
      }
    } else {
      ctx.go("/login"); // Pas de token enregistré, on redirige vers login
    }
  }
  // Fonction pour creer son compte
  void registrationFunc(String data, BuildContext ctx) async{
    try {
      var url = Uri.parse('http://10.0.2.2:8000/auth/users/');
      var response = await http.post(url,
          headers: {
            'Content-Type': 'application/json',
          },
          body: data);

      if (response.statusCode == 201){
        print(response.body);
        setRLoading();
        ctx.go("/login");
      }else if(response.statusCode == 400){
        print(response.body);
        setRLoading();
        var data = jsonDecode(response.body);
        showErrorPopup(
            ctx, data['password'][0], null, null);
      }
    } catch (e) {
      print(e.toString());
      // setRLoading();
      // showErrorPopup(ctx, AppText.kErrorGetUser, null, null);
    }
  }


  Future<void> refreshAuthToken(BuildContext ctx) async {
    try {
      String? refreshToken = Storage().getString('refreshToken');
      if (refreshToken == null) {
        ctx.go("/login");
        return;
      }

      var url = Uri.parse('http://10.0.2.2:8000/auth/token/refresh/');
      var response = await http.post(url,
          headers: {
            'Content-Type': 'application/json',
          },
          body: jsonEncode({'refresh': refreshToken}));

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        String newAccessToken = data['access'];
        Storage().setString('accessToken', newAccessToken);
        print("Token rafraîchi !");
      } else {
        ctx.go("/login");
      }
    } catch (e) {
      print("Erreur lors du rafraîchissement du token: $e");
      ctx.go("/login");
    }
  }

  void getUser(String accessToken,BuildContext ctx)async{
    try {
      var url = Uri.parse('http://10.0.2.2:8000/auth/users/me/');
      var response = await http.get(url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Token $accessToken'
        },
      );
      if (response.statusCode == 200){
        Storage().setString('accessToken', accessToken);
        Storage().setString(accessToken, response.body);
        ctx.read<TabIndexNotifier>().setIndex(0);
        ctx.go('/entrypoint');
      }
    } catch (e) {
      setLoading();
      showErrorPopup(ctx,AppText.kErrorLogin, null, null);
    }
  }
  ProfileModel ? getUserData(){
    String? accessToken = Storage().getString('accessToken');

    if (accessToken != null){
      var data = Storage().getString(accessToken);
      if(data != null){
        return ProfileModel.fromJson(jsonDecode(data));
      }
    }
    return null;
  }

  // Fonction pour se deconnecter
  void logoutFunc(BuildContext ctx) async {
    try {
      String? accessToken = Storage().getString('accessToken');

      if (accessToken != null) {
        var url = Uri.parse('http://10.0.2.2:8000/auth/token/logout/');
        var response = await http.post(
          url,
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Token $accessToken',
          },
        );

        if (response.statusCode == 204) {
          print("Déconnexion réussie !");
        } else {
          print("Erreur lors de la déconnexion : ${response.body}");
        }
      }

      // Supprime les tokens stockés localement
      Storage().removeKey('accessToken');
      Storage().removeKey('refreshToken');

      // Redirige vers la page de connexion
      ctx.go('/login');
    } catch (e) {
      print("Erreur lors de la déconnexion : $e");
      ctx.go('/login'); // Redirige vers la page de connexion en cas d'erreur
    }
  }

  // ProfileModel ? getUserData(){
  //   String? accessToken = Storage().getString('accessToken');
  //
  //   if (accessToken != null){
  //     var data = Storage().getString(accessToken);
  //     if(data != null){
  //       return ProfileModel.fromJson(jsonDecode(data));
  //     }
  //   }
  // }

}