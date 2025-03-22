import 'package:flutter/material.dart';
import 'package:onboarding_feature/pages/widgets/onboarding_body_widget.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: OnboardingBody(),
    );
  }
}
