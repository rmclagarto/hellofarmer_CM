import 'package:flutter/material.dart';
import 'package:hellofarmer_app/constants.dart';
import 'package:hellofarmer_app/registerScreen/register_screen.dart';
import 'package:hellofarmer_app/forgetPasswordScreen/forget_pass_screen.dart';
import 'package:hellofarmer_app/homeScreen/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(colorGreen),
      body: _buildLoginPageBody(context),
    );
  }

  Widget _buildLoginPageBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 100),
      child: Column(
        children: [
          _buildLogoHeaderImage(),
          Expanded(
            child: Center(child: _buildLoginFormCard(context)),
          ),
        ],
      ),
    );
  }

  Widget _buildLogoHeaderImage() {
    return Center(
      child: Image(
        image: AssetImage(shortLogoTipo),
        height: 100,
        fit: BoxFit.contain,
      ),
    );
  }

  Widget _buildLoginFormCard(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(28.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildLoginTitleText(),
              const SizedBox(height: 20),
              _buildEmailInputField(),
              const SizedBox(height: 20),
              _buildPasswordInputField(),
              const SizedBox(height: 10),
              _buildForgotPasswordButton(context),
              const SizedBox(height: 20),
              _buildLoginSubmitButton(context),
              const SizedBox(height: 40),
              _buildDividerWithText('OU'),
              const SizedBox(height: 40),
              _buildSocialLoginButtonsRow(),
              const SizedBox(height: 20),
              _buildSignUpNavigationButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLoginTitleText() {
    return const Center(
      child: Text(
        'Entrar',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildEmailInputField() {
    return TextFormField(
      controller: _emailController,
      cursorColor: Colors.grey,
      decoration: InputDecoration(
        labelText: 'Email',
        labelStyle: TextStyle(color: Colors.black),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(40)),
        filled: true,
        fillColor: Colors.white,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: BorderSide(color: Colors.grey),
        ),
      ),
    );
  }

  Widget _buildPasswordInputField() {
    return TextFormField(
      controller: _passwordController,
      obscureText: true,
      cursorColor: Colors.grey,
      decoration: InputDecoration(
        labelText: 'Senha',
        labelStyle: TextStyle(color: Colors.black),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(40)),
        filled: true,
        fillColor: Colors.white,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: BorderSide(color: Colors.grey),
        )
      ),
    );
  }

  Widget _buildForgotPasswordButton(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ForgetPassScreen()),
          );
        },
        child: const Text(
          'Recuperar palavra-passe',
          style: TextStyle(color: Colors.black, fontSize: 14),
        ),
      ),
    );
  }

  Widget _buildLoginSubmitButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () async {
          // try{
          //   final email = _emailController.text.trim();
          //   final password = _passwordController.text.trim();

          //   final userCredential = await FirebaseAuth.instance.signInWithEmailAndPassowrd(email: email, password: password);

          //   if(userCredential.user != null){
          //     Navigator.pushReplacement(
          //       context,
          //       MaterialPageRoute(builder: (context) => const HomeScreen()),
          //     );
          //   }
          // } on FireBaseAuthException catch (e){
          //   String message;
          //   if(e.code == 'user-not-found'){
          //     message = 'Utilizador não encontrado.';
          //   }else if (e.code == 'wrong-password'){
          //     message = 'Senha incorreta';
          //   }else{
          //     message = 'Erro ${e.message}';
          //   }


          //   showDialog(
          //     context: context,
          //     builder: (_) => AlertDialog(
          //       title: const Text('Erro de login'),
          //       content: Text(message),
          //       actions: [
          //         TextButton(
          //           onPressed: () => Navigator.pop(context),
          //           child: const Text('OK'),
          //         )
          //       ],
          //     ),
          //   );
          // }


          Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen()),
              );
          
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(submitLoginbuttonColor),
          padding: const EdgeInsets.symmetric(vertical: 15),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        ),
        child: const Text(
          "Acessar",
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildDividerWithText(String text) {
    return Row(
      children: [
        const Expanded(child: Divider(color: Colors.black)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(text, style: const TextStyle(color: Colors.black, fontSize: 16)),
        ),
        const Expanded(child: Divider(color: Colors.black)),
      ],
    );
  }

  Widget _buildSignUpNavigationButton(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const RegisterScreen()),
        );
      },
      child: RichText(
        text: const TextSpan(
          style: TextStyle(color: Colors.black, fontSize: 16),
          children: [
            TextSpan(text: "Não é membro? "),
            TextSpan(text: "Adere já", style: TextStyle(color: Colors.blue)),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialLoginButtonsRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildSocialLoginButton('Google'),
        const SizedBox(width: 16),
        _buildSocialLoginButton('Facebook'),
        const SizedBox(width: 16),
        _buildSocialLoginButton('IOS'),
      ],
    );
  }

  Widget _buildSocialLoginButton(String provider) {
    String assetPath;
    switch (provider) {
      case 'Google':
        assetPath = logoGoogle;
        break;
      case 'Facebook':
        assetPath = logoFacebook;
        break;
      case 'IOS':
        assetPath = logoIOS;
        break;
      default:
        assetPath = 'assets/default_logo.png';
    }

    return SizedBox(
      height: 50,
      width: 100,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
        child: Image(
          image: AssetImage(assetPath),
          height: 24,
          width: 24,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
