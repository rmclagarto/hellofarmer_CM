import 'package:flutter/material.dart';
import 'package:hellofarmer_app/features/splash/splash_screen.dart';
import 'package:hellofarmer_app/features/auth/screen/login_screen.dart';
import 'package:hellofarmer_app/features/auth/screen/register_screen.dart';
import 'package:hellofarmer_app/features/auth/screen/recover_password_screen.dart';
import 'package:hellofarmer_app/features/home/screen/home_screen.dart';
import 'package:hellofarmer_app/features/payAds/ad_payment_screen.dart';
import 'package:hellofarmer_app/features/AD/preview_ad.dart';

class AppRoutes{

  static const splash = '/splash';
  static const login = '/login';
  static const register = '/register';
  static const recoverPassword = '/recover-password';

  static const home = '/home';
  static const payAds = '/pay-ads';
  static const previewAds = 'preview-ads';



  static Map<String, WidgetBuilder> routes = {
    splash: (context) => SplashScreen(),
    home: (context) => Home(),
    login: (context) => Login(),
    register: (context) => Register(),
    recoverPassword: (context) => RecoverPassword(),
    payAds: (context) => AdPaymentScreen(),
    previewAds: (context) => PreviewAd(),
  };

}