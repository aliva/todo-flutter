import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    if (FirebaseAuth.instance.currentUser != null) {
      return const Center(child: Text("HI"));
    }
    return const SignInScreen(
      showAuthActionSwitch: false,
      providerConfigs: [
        EmailProviderConfiguration(),
      ],
    );
  }
}
