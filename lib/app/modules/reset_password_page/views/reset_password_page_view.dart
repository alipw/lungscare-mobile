import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/reset_password_page_controller.dart';

class ResetPasswordPageView extends GetView<ResetPasswordPageController> {
  const ResetPasswordPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(
              height: 64,
            ),
            const Row(
              children: [
                Text(
                  'Logo',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            const Spacer(),
            const Text(
              'Reset Password?',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 32,
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Masukan Password',
                labelStyle: const TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    width: 3,
                    color: Colors.black12,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Masukan Konfirmasi Password',
                labelStyle: const TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    width: 3,
                    color: Colors.black12,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 16)),
                onPressed: () {},
                child: const Text(
                  'Kirim',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
