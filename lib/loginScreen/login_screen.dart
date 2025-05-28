import 'package:flutter/material.dart';
import 'package:hellofarmer_app/constants.dart';
import 'package:hellofarmer_app/homeScreen/home_screen.dart';
import 'package:hellofarmer_app/registerScreen/register_screen.dart';
import 'package:hellofarmer_app/forgetPasswordScreen/forget_pass_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginState();
}

Widget _buildHeaderImage() {
  return Center(
    child: Image(
      image: AssetImage(shortLogoTipo),
      height: 100,
      fit: BoxFit.contain,
    ),
  );
}

Widget _buildLabelLogin() {
  return Center(
    child: Text(
      'Entrar',
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    ),
  );
}

Widget _buildEmailField() {
  return TextFormField(
    decoration: InputDecoration(
      labelText: 'Email',
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(40)),
      filled: true,
      fillColor: Colors.white,
    ),
  );
}

Widget _buildPasswordField() {
  return TextFormField(
    obscureText: true,
    decoration: InputDecoration(
      labelText: 'Senha',
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(40)),
      filled: true,
      fillColor: Colors.white,
    ),
  );
}

Widget _buildForgotPasswordLink(BuildContext context) {
  return Align(
    alignment: Alignment.centerRight,
    child: TextButton(
      onPressed: () {
        // Adicione a navegação para a tela de recuperação de senha

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

Widget _buildLoginButton(BuildContext context) {
  return SizedBox(
    width: double.infinity,
    child: ElevatedButton(
      onPressed: () {
        // Adicione a lógica de login aqui

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
        child: Text(text, style: TextStyle(color: Colors.black, fontSize: 16)),
      ),
      const Expanded(child: Divider(color: Colors.black)),
    ],
  );
}

Widget _buildSignUpLink(BuildContext context) {
  return TextButton(
    onPressed: () {
      // Adicione a navegação para a tela de cadastro
      Navigator.push(context,
      MaterialPageRoute(builder: (context) => const RegisterScreen()));
    },
    child: RichText(
      text: TextSpan(
        style: TextStyle(color: Colors.black, fontSize: 16),
        children: [
          TextSpan(text: "Não é membro? "),
          TextSpan(text: "Adere já", style: TextStyle(color: Colors.blue)),
        ],
      ),
    ),
  );
}

Widget _buildButtonAppLog(String application) {
  String src;

  switch (application) {
    case 'Google':
      src = 'assets/Google_Logo.png';
      break;
    case 'Facebook':
      src = 'assets/Facebook_Logo.png';
      break;
    case 'IOS':
    case 'Apple': // opcionalmente aceite os dois
      src = 'assets/IOS_Logo.png';
      break;
    default:
      src = 'assets/default_logo.png'; // ou adicione uma imagem padrão
  }

  return SizedBox(
    height: 50,
    width: 100,
    child: ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFF3EDED),
        padding: const EdgeInsets.symmetric(horizontal: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      child: Image(
        image: AssetImage(src),
        height: 24,
        width: 24,
        fit: BoxFit.contain,
      ),
    ),
  );
}


class _LoginState extends State<LoginScreen> {
 @override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Color(colorGreen),
    body: Padding(
      padding: const EdgeInsets.only(top: 100),
      child: Column(
        children: [
          _buildHeaderImage(),
          Expanded(
            child: Center(
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(28.0),
                  child: SingleChildScrollView( // adiciona scroll se necessário
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _buildLabelLogin(),
                        const SizedBox(height: 20),
                        _buildEmailField(),
                        const SizedBox(height: 20),
                        _buildPasswordField(),
                        const SizedBox(height: 10),
                        _buildForgotPasswordLink(context),
                        const SizedBox(height: 20),
                        _buildLoginButton(context),
                        const SizedBox(height: 30),
                        _buildDividerWithText('OU'),
                        const SizedBox(height: 40),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _buildButtonAppLog('Google'),
                            const SizedBox(width: 16),
                            _buildButtonAppLog('Facebook'),
                            const SizedBox(width: 16),
                            _buildButtonAppLog('Apple'), // use "Apple" para padronizar
                          ],
                        ),
                        const SizedBox(height: 20),
                        _buildSignUpLink(context),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
}