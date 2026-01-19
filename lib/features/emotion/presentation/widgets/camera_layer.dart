import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:huawei_ml_body/huawei_ml_body.dart';
import 'package:spectra/core/constants/colors_manager.dart';
import 'package:spectra/features/emotion/presentation/cubit/rafiq_game_cubit.dart';
import 'package:spectra/features/emotion/presentation/cubit/rafiq_game_state.dart';

class CameraLayer extends StatelessWidget {
  const CameraLayer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RafiqGameCubit, RafiqGameState>(
      buildWhen: (previous, current) => previous.textureId != current.textureId,
      builder: (context, state) {
        if (state.textureId != null) {
          return SizedBox.expand(
            child: MLBodyLens(
              textureId: state.textureId!,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
          );
        }
        // Loading state
        return Container(
          color: ColorsManager.softBlack,
          child: const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}