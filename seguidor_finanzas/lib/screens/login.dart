import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      body: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state is HomeFailure) {
            _show(state.message);
          }
          if (state is HomeLoadSuccess) {
            _show('Bienvenido, ${usernameCtrl.text}');
          }
        },
        builder: (context, state) {
          return Padding(
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
                state is HomeLoadInProgress
                    ? const CircularProgressIndicator()
                    : ElevatedButton(
                      onPressed: () {
                        context.read<HomeBloc>().add(
                          HomeLoginRequested(
                            username: usernameCtrl.text.trim(),
                            password: passCtrl.text.trim(),
                          ),
                        );
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
                      child: const Text(
                        'Entrar',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
              ],
            ),
          );
        },
      ),
    );
  }
}
