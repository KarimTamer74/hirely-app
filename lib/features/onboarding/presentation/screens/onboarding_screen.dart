import 'package:flutter/material.dart';
import 'package:hirely/features/onboarding/presentation/widgets/onboarding_screen_body.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: 
            OnBoardingScreenBody(),
          
        
      ),
    );
  }
}
