import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../LoginPage/login_page.dart';

class OnboardingPage extends StatefulWidget {
  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) async {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => LoginPage()),
    );
  }

  Widget _buildImage(String assetName) {
    return Align(
      child: Image.asset('assets/images/$assetName.png', width: 350.0),
      alignment: Alignment.bottomCenter,
    );
  }

  @override
  Widget build(BuildContext context) {
    const bodyTextStyle = TextStyle(fontSize: 16.0);

    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyTextStyle,
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      pages: [
        PageViewModel(
            title: 'This is a Challenge for ZipDev using Flutter',
            body:
                'This Welcome pages are created using "introduction_screen" in version 1.0.9',
            image: _buildImage('img1'),
            decoration: pageDecoration),
        PageViewModel(
            title:
                'The Onboarding pages will disapear when you login into the app',
            body: 'For that Im using "shared_preferences" in version 0.5.10',
            image: _buildImage('img2'),
            decoration: pageDecoration),
      ],
      onDone: () => _onIntroEnd(context),
      showNextButton: true,
      skipFlex: 0,
      nextFlex: 0,
      skip: const Text('Skip'),
      next: const Icon(Icons.arrow_forward),
      done: const Text(
        'Done',
        style: TextStyle(fontWeight: FontWeight.w500),
      ),
    );
  }
}
