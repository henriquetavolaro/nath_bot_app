import 'package:flutter/material.dart';
import 'package:nath_bot_app/theme/app_colors.dart';

class VamosConversarButton extends StatelessWidget {
  final VoidCallback onClick;

  const VamosConversarButton({Key? key, required this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.zero,
            bottomRight: Radius.circular(25),
            bottomLeft: Radius.circular(25),
          ),
          gradient: LinearGradient(
            colors: [
              AppColors.purple,
              AppColors.lightPurple
            ]
          )
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 32),
          child: Text('Vamos conversar'),
        ),
      ),
    );
  }
}
