import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  static const String name = 'profile_view'; //
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: 75,
          backgroundColor: Colors.green,
          title: const Center(child: Text('Profile')),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Center(
            child: Column(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: const CircleAvatar(
                    radius: 60,
                    // imagen profile
                    backgroundImage: NetworkImage(
                        'https://static-00.iconduck.com/assets.00/profile-circle-icon-2048x2048-cqe5466q.png'),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  '@Username',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  style: const ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(Colors.deepPurpleAccent)),
                  onPressed: () {},
                  child: const Text(
                    'Edit profile',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
