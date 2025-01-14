import 'package:flutter/material.dart';
import 'package:flutter_app/ui/pages/navigation_page/navigation_page.dart';
import 'package:flutter_app/ui/pages/register/register_page_cubit.dart';
import 'package:flutter_app/ui/pages/register/register_page_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final usernameController = TextEditingController();
    final passwordController = TextEditingController();

    return BlocProvider(
      create: (_) => UserCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Register'),
        ),
        body: BlocConsumer<UserCubit, UserState>(
          listener: (context, state) {
            if (state.isSuccess) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const NavigationPage()),
              );
            } else if (state.isError) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                    content: Text('Registration Failed! User exists.')),
              );
            }
          },
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextField(
                    controller: usernameController,
                    decoration: const InputDecoration(labelText: 'Username'),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: passwordController,
                    decoration: const InputDecoration(labelText: 'Password'),
                    obscureText: true,
                  ),
                  const SizedBox(height: 32),
                  state.isSubmitting
                      ? const CircularProgressIndicator()
                      : ElevatedButton(
                          onPressed: () {
                            final username = usernameController.text.trim();

                            final password = passwordController.text.trim();

                            context
                                .read<UserCubit>()
                                .registerUser(username, password);
                          },
                          child: const Text('Register'),
                        ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
