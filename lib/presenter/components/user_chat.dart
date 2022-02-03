import 'package:flutter/material.dart';
import 'package:nath_bot_app/presenter/components/time_widget.dart';
import 'package:nath_bot_app/theme/app_colors.dart';
import 'package:nath_bot_app/theme/text_style.dart';

class UserChat extends StatefulWidget {
  final String text;
  final String time;
  final bool alterar;

  const UserChat({
    Key? key,
    required this.text,
    required this.time,
    this.alterar = false,
  }) : super(key: key);

  @override
  _UserChatState createState() => _UserChatState();
}

class _UserChatState extends State<UserChat> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                    elevation: 4,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            bottomRight: Radius.circular(25))),
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            bottomRight: Radius.circular(25)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              widget.text,
                              style: TextStyles.poppins16timeGrey400,
                              softWrap: true,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 16),
                              child: Text(
                                  'Alterar',
                              style: TextStyles.nunito16purple400underline,),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const TimeWidget(time: '22:02')
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: SizedBox(
              width: 25,
              height: 25,
              child: Material(
                elevation: 4,
                borderRadius: BorderRadius.all(Radius.circular(25)),
                color: AppColors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
