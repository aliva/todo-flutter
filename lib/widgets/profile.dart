import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
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
      builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container();
        } else if (snapshot.hasData) {
          return const Center(child: ProfileSignedin());
        } else {
          return const SignInScreen(
            showAuthActionSwitch: false,
            providerConfigs: [
              // EmailProviderConfiguration(),
              GoogleProviderConfiguration(
                clientId: "527520411313-t0ttfle5lb00tmfqvm92sn5vd03eapip.apps.googleusercontent.com",
              ),
            ],
          );
        }
      },
    );
  }
}
