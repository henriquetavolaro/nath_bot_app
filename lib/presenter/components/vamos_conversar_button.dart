import 'package:flutter/material.dart';
import 'package:nath_bot_app/theme/app_colors.dart';
import 'package:nath_bot_app/theme/text_style.dart';

class VamosConversarButton extends StatelessWidget {
  final VoidCallback onClick;

  const VamosConversarButton({Key? key, required this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Material(
        elevation: 4,
        borderRadius: const BorderRadius.only(
      topLeft: Radius.circular(25),
      topRight: Radius.zero,
      bottomRight: Radius.circular(25),
      bottomLeft: Radius.circular(25),
    ),
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
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
            child: Text('Vamos conversar',
            style: TextStyles.poppins18white600,),
          ),
        ),
      ),
    );
  }
}
