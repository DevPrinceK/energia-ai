// ignore_for_file: avoid_print, use_build_context_synchronously

import 'package:energia_dashboard/network/endpoints.dart';
import 'package:energia_dashboard/screens/desktop/desktop_dashboard.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DesktopLogin extends StatefulWidget {
  const DesktopLogin({super.key});

  @override
  State<DesktopLogin> createState() => _DesktopLoginState();
}

class _DesktopLoginState extends State<DesktopLogin> {
  bool isLoading = false;

  // controllers
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<int> loginUser(email, password) async {
    print("Logging in user...");
    // start loading
    setState(() {
      isLoading = true;
    });

    print("Initializing shared preferences");
    // initialize shared preferences
    SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      print("trying login api...");
      // Make API call
      var url = Uri.parse(APIEndpoints.login);
      var response = await http.post(
        url,
        body: {
          "username": usernameController.text,
          "password": passwordController.text,
        },
      );

      // stop loading
      setState(() {
        isLoading = false;
      });

      if (response.statusCode == 200) {
        // Login successful
        print("Login successful");
        var data = jsonDecode(response.body);
        var userData = data["user"];
        var token = data["token"];
        print(userData);
        print(token);
        // Save token and user info
        await prefs.setString("token", data["token"]);
        await prefs.setString("fullname", userData["fullname"]);
        await prefs.setString("email", userData["email"]);
        await prefs.setBool("isLoggedIn", true);
        print(response.statusCode);
        return response.statusCode;
      } else {
        // Login failed
        print("Login failed");
        print(response.statusCode);
        print(response.reasonPhrase);
        return response.statusCode;
      }
    } catch (e) {
      print("Catching error in login api...");
      print(e);
      // Handle exceptions by displaying a Snackbar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("An Error Occurred: $e"),
        ),
      );

      // Stop loading
      setState(() {
        isLoading = false;
      });

      // Return an error code or handle it as needed
      return -1; // You can return a custom error code or value
    }
  }

  @override
  void initState() {
    super.initState();

    // check if user is already logged in
    checkLoginStatus().then((isLoggedIn) {
      if (isLoggedIn) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const DesktopDashboard();
            },
          ),
        );
      }
    });
  }

  // check if user is already logged in
  Future<bool> checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var isLoggedIn = prefs.getBool("isLoggedIn");
    if (isLoggedIn == null) {
      return false;
    } else {
      return isLoggedIn;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: Container(
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
                    TextField(
                      controller: usernameController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Username',
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () async {
                        var res = await loginUser(
                            usernameController.text, passwordController.text);
                        if (res == 200) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const DesktopDashboard();
                              },
                            ),
                          );
                          return;
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("An Error Occurred: $res"),
                            ),
                          );
                        }
                      },
                      child: const Text('Login'),
                    ),
                    const SizedBox(height: 20),
                    isLoading
                        ? const Center(
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                SizedBox(
                                  height: 150,
                                  width: 150,
                                  child: CircularProgressIndicator(),
                                ),
                                Center(
                                  child: Text(
                                    "Processing...",
                                  ),
                                ),
                              ],
                            ),
                          )
                        : const SizedBox(height: 0),
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
