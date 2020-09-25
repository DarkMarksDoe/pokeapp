import 'package:flutter/material.dart';

import '../calls/local_storage_API.dart';
import 'HomePage/home_page.dart';
import 'LoginPage/login_page.dart';
import 'OnBoardingPage/onboarding_page.dart';

enum AuthStatus {
  notDetermined,
  notSignedIn,
  signedIn,
  firstInstall,
}

class RootPage extends StatefulWidget {
  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  AuthStatus authStatus = AuthStatus.notDetermined;

  @override
  void initState() {
    _startupCheck();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _startupCheck();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    switch (authStatus) {
      case AuthStatus.notDetermined:
        setState(() => authStatus = AuthStatus.notDetermined);
        return _buildWaitingScreen();
      case AuthStatus.notSignedIn:
        setState(() => authStatus = AuthStatus.notSignedIn);
        return LoginPage();
      case AuthStatus.signedIn:
        setState(() => authStatus = AuthStatus.signedIn);
        return HomePage();
      case AuthStatus.firstInstall:
        setState(() => authStatus = AuthStatus.notSignedIn);
        return OnboardingPage();
        break;
    }
    return null;
  }

  Widget _buildWaitingScreen() {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: CircularProgressIndicator(),
      ),
    );
  }

  void _startupCheck() async {
    bool status = await LocalStorageApiCall().isLogged();
    bool installed = await LocalStorageApiCall().getJustInstalled();
    if (installed) {
      if (status)
        setState(() => authStatus = AuthStatus.signedIn);
      else
        setState(() => authStatus = AuthStatus.notSignedIn);
    } else {
      setState(() => authStatus = AuthStatus.firstInstall);
    }
  }
}
