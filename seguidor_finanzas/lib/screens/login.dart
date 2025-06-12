import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:seguidor_finanzas/bloc/home_bloc.dart';
import 'package:seguidor_finanzas/styles/colors.dart';

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
      if (res.statusCode != 200)
        return _show('Error al conectar con el servidor');

      final usuarios = json.decode(res.body) as List;
      final user = usuarios.firstWhere(
        (u) =>
            u['nombre_usuario'] == usernameCtrl.text.trim() &&
            u['password'] == passCtrl.text.trim(),
        orElse: () => null,
      );

      if (user != null) {
        _show('Bienvenido, ${usernameCtrl.text.trim()}');
        context.read<HomeBloc>().add(HomeSearchPressed());
      } else {
        _show('Nombre de usuario o contraseña incorrectos');
      }
    } catch (e) {
      _show('Error: $e');
    }
  }

  void _show(String mensaje) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(mensaje)));
  }

  Widget _input({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    bool obscure = false,
  }) {
    return TextField(
      controller: controller,
      obscureText: obscure,
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: AppColors.bodyTransationList,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        prefixIcon: Icon(icon),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Login',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 30),
            _input(
              controller: usernameCtrl,
              label: 'Nombre de usuario',
              icon: Icons.person,
            ),
            const SizedBox(height: 15),
            _input(
              controller: passCtrl,
              label: 'Contraseña',
              icon: Icons.lock,
              obscure: true,
            ),
            const SizedBox(height: 25),
            ElevatedButton(
              onPressed: () {
                context.read<HomeBloc>().add(HomeSearchPressed());
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: AppColors.textColorPrimary,
                padding: const EdgeInsets.symmetric(
                  horizontal: 50,
                  vertical: 14,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text('Entrar', style: TextStyle(fontSize: 20)),
            ),
          ],
        ),
      ),
    );
  }
}
