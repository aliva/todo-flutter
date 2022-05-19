import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:todo/storage.dart';
import 'package:todo/widgets/profile_signedin.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      initialData: Storage.currentUser,
      builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
        if (snapshot.hasData) {
          return const Center(child: ProfileSignedin());
        } else {
          return const SignInScreen(
            showAuthActionSwitch: false,
            providerConfigs: [
              EmailProviderConfiguration(),
            ],
          );
        }
      },
    );
  }
}