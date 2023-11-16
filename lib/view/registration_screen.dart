import 'package:color_picker_sample/view/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
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
          const Text("Register"),
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

                if (nameController.text.trim().isNotEmpty &&
                    passController.text.trim().isNotEmpty) {
                  await obj.setString("name", nameController.text.trim());
                  await obj.setString("pass", passController.text.trim());
                  // ignore: use_build_context_synchronously
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LogingScreen(),
                      ));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: Colors.red,
                      content: Text("Enter a valid email and pass")));
                }
              },
              child: const Text("Register")),
          height10,
          InkWell(
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LogingScreen(),
                    ));
              },
              child: const Text("Already have account ,Login now")),
        ],
      ),
    );
  }
}
