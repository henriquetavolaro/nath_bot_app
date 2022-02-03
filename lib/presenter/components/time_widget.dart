import 'package:flutter/material.dart';
import 'package:nath_bot_app/theme/text_style.dart';

class TimeWidget extends StatelessWidget {
  final String time;
  const TimeWidget({
    Key? key, required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Text(time, style: TextStyles.nunito12timeGrey400,),
    );
  }
}
