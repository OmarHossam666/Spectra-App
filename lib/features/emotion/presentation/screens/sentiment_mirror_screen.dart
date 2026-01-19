import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spectra/features/emotion/presentation/cubit/rafiq_game_cubit.dart';
import 'package:spectra/features/emotion/presentation/widgets/sentiment_view.dart';

class SentimentMirrorScreen extends StatelessWidget {
  const SentimentMirrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RafiqGameCubit()..initialize(),
      child: const SentimentView(),
    );
  }
}



