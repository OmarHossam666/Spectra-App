import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spectra/core/constants/colors_manager.dart';
import 'package:spectra/core/constants/styles_manager.dart';
import 'package:spectra/core/constants/values_manager.dart';
import 'package:spectra/features/emotion/presentation/cubit/rafiq_game_cubit.dart';

class SentimentHeaderBar extends StatelessWidget {
  const SentimentHeaderBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: ValuesManager.paddingDefault,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Back Button
            _GlassButton(
              icon: Icons.arrow_back,
              onPressed: () => Navigator.pop(context),
            ),

            // Mode Badge
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.black38,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: Colors.white10),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.face,
                    color: ColorsManager.softRose,
                    size: 20,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    "Mirror Mode",
                    style: StylesManager.getBodyBold(
                      color: ColorsManager.cream,
                    ),
                  ),
                ],
              ),
            ),

            // Switch Camera
            _GlassButton(
              icon: Icons.cameraswitch,
              onPressed: () => context.read<RafiqGameCubit>().switchCamera(),
            ),
          ],
        ),
      ),
    );
  }
}

class _GlassButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  const _GlassButton({required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: ClipOval(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            width: 44,
            height: 44,
            color: Colors.black26,
            child: Icon(icon, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
