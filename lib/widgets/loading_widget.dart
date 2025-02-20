import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.transparent,
      child: Lottie.asset('assets/lotties/loading1.json',
          width: 100, height: 100, frameRate: const FrameRate(60)),
    );
  }
}
