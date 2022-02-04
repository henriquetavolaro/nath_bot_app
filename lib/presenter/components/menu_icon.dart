
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nath_bot_app/theme/app_colors.dart';

class MenuIcon extends StatelessWidget {
  final VoidCallback onClick;
  const MenuIcon({
    Key? key, required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: AppColors.black,
              ),
              height: 2,
              width: 12,
            ),
            const SizedBox(
              height: 4,
            ),
            Container(
              height: 2,
              width: 20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: AppColors.black,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Container(
              height: 2,
              width: 16,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: AppColors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
