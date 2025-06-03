import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_bloc/features/auth/presentation/components/my_button.dart';
import 'package:social_media_bloc/features/auth/presentation/components/my_text_field.dart';
import 'package:social_media_bloc/features/auth/presentation/cubits/auth_cubit.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // NIS & Password Controller
  final nisController = TextEditingController();
  final passwordController = TextEditingController();

  // Logic Login
  void _handleLogin() {
    // ambil NIS dan Password yang di input
    final String nisInput = nisController.text;
    final String passwordInput = passwordController.text;

    // Auth Cubit
    final authCubit = context.read<AuthCubit>();

    // check apakah field nis dan password kosong
    if (nisInput.isNotEmpty && passwordInput.isNotEmpty) {
      // Login
      authCubit.login(nisInput, passwordInput);
    }
    // kasih error kalo ada field yang kosong
    else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Masukkan NIS dan Password!")),
      );
    }
  }

  @override
  void dispose() {
    nisController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  // UI
  @override
  Widget build(BuildContext context) {
    // Scaffold
    return Scaffold(
      // Biar ga nyatu sama notch
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo
                Icon(
                  Icons.school,
                  size: 80,
                  color: Theme.of(context).colorScheme.primary,
                ),

                const SizedBox(height: 20),

                // Text Login
                Text(
                  "Welcome back, you've been missed!",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 20,
                  ),
                ),

                const SizedBox(height: 20),

                // NIS Textfield
                MyTextField(
                  controller: nisController,
                  hintText: "NIS",
                  obscureText: false,
                ),

                const SizedBox(height: 20),

                // Password Textfield
                MyTextField(
                  controller: passwordController,
                  hintText: "Password",
                  obscureText: true,
                ),

                const SizedBox(height: 20),

                // Login Button
                MyButton(onTap: _handleLogin, text: "Login"),

                const SizedBox(height: 50),

                // Text("Budi Luhur"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
