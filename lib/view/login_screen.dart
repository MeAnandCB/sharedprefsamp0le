import 'package:color_picker_sample/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogingScreen extends StatefulWidget {
  const LogingScreen({super.key});

  @override
  State<LogingScreen> createState() => _LogingScreenState();
}

class _LogingScreenState extends State<LogingScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var height10 = const SizedBox(
      height: 10,
    );

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Login"),
          height10,
          TextFormField(
            controller: nameController,
            decoration: const InputDecoration(hintText: "User name"),
          ),
          height10,
          TextFormField(
            controller: passController,
            decoration: const InputDecoration(hintText: "Password"),
          ),
          height10,
          ElevatedButton(
              onPressed: () async {
                final SharedPreferences obj =
                    await SharedPreferences.getInstance();

                String regName = await obj.get("name").toString();
                String regPass = await obj.get("pass").toString();

                if (nameController.text.trim() == regName &&
                    passController.text.trim() == regPass) {
                  await obj.setBool("isLogged", true);

                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ));
                }
              },
              child: const Text("Login")),
          height10,
          const Text("New user ,Register now"),
        ],
      ),
    );
  }
}
