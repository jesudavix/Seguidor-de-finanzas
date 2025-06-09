import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final usernameCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  final String jsonUrl =
      'https://run.mocky.io/v3/392d4730-cab5-4700-8b6d-af4a528a2ac3';

  Future<void> login() async {
    try {
      final res = await http.get(Uri.parse(jsonUrl));
      if (res.statusCode != 200) {
        show('Error al conectar con el servidor');
        return;
      }

      final List usuarios = json.decode(res.body);
      final username = usernameCtrl.text.trim();
      final pass = passCtrl.text.trim();

      final user = usuarios.firstWhere(
        (u) => u['nombre_usuario'] == username && u['password'] == pass,
        orElse: () => null,
      );

      if (user != null) {
        show('Bienvenido, $username');
      } else {
        show('Nombre de usuario o contraseña incorrectos');
      }
    } catch (e) {
      show('Error: $e');
    }
  }

  void show(String mensaje) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(mensaje)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Login', style: TextStyle(fontSize: 28)),
            const SizedBox(height: 20),
            TextField(
              controller: usernameCtrl,
              decoration: const InputDecoration(labelText: 'Nombre de usuario'),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: passCtrl,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Contraseña'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: login, child: const Text('Entrar')),
          ],
        ),
      ),
    );
  }
}
