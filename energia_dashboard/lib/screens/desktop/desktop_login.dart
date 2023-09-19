import 'package:energia_dashboard/screens/desktop/desktop_dashboard.dart';
import 'package:flutter/material.dart';

class DesktopLogin extends StatelessWidget {
  const DesktopLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: Container(
              // color: Colors.deepPurple,
              color: Colors.grey[200],
              child: Center(
                child: Image.asset('assets/images/logo.png'),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: SizedBox(
                width: 400,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Login',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),
                    const TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Username',
                      ),
                    ),
                    const SizedBox(height: 20),
                    const TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const DesktopDashboard();
                            },
                          ),
                        );
                      },
                      child: const Text('Login'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
