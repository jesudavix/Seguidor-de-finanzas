import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seguidor_finanzas/blocs/bloc/home_bloc.dart';
import 'package:seguidor_finanzas/screens/Loadin_sceen_state.dart';
import 'package:seguidor_finanzas/screens/failure_screen.dart';
import 'package:seguidor_finanzas/screens/home_screen.dart';
import 'package:seguidor_finanzas/styles/colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final usernameCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  bool _isLoadingShown = false;

  void _showSnackbar(String mensaje) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(mensaje)));
  }

  void _navigateToLoading() {
    if (!_isLoadingShown) {
      _isLoadingShown = true;
      Future.microtask(() {
        Navigator.of(
          context,
        ).push(MaterialPageRoute(builder: (_) => const LoadingScreenState()));
      });
    }
  }

  void _closeLoadingIfNeeded() {
    if (_isLoadingShown) {
      Navigator.of(
        context,
      ).maybePop(); // Evita errores si no hay pantalla para cerrar
      _isLoadingShown = false;
    }
  }

  void _navigateToFailure() {
    Future.microtask(() {
      Navigator.of(
        context,
      ).push(MaterialPageRoute(builder: (_) => const FailureScreen()));
    });
  }

  Widget _buildLoginForm() {
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
          _inputField(
            controller: usernameCtrl,
            label: 'Nombre de usuario',
            icon: Icons.person,
          ),
          const SizedBox(height: 15),
          _inputField(
            controller: passCtrl,
            label: 'Contraseña',
            icon: Icons.lock,
            obscure: true,
          ),
          const SizedBox(height: 25),
          ElevatedButton(
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
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text('Entrar', style: TextStyle(fontSize: 20)),
          ),
        ],
      ),
    );
  }

  Widget _inputField({
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
          if (state is HomeLoadInProgress) {
            _navigateToLoading();
          } else if (state is HomeFailure) {
            _closeLoadingIfNeeded();
            _showSnackbar(state.message);
            _navigateToFailure();
          } else if (state is HomeLoadSuccess) {
            _closeLoadingIfNeeded();
            _showSnackbar('Bienvenido, ${usernameCtrl.text}');
            Future.microtask(() {
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (_) => const HomeScreen()),
                (route) => false,
              );
            });
          }
        },
        builder: (context, state) => _buildLoginForm(),
      ),
    );
  }
}
