import 'package:flutter/material.dart';
import 'package:nath_bot_app/theme/app_colors.dart';

class NathBot extends StatefulWidget {
  final bool isTop;
  final bool cancel;
  final String text;

  const NathBot({
    Key? key,
    required this.text,
    this.isTop = false,
    this.cancel = false,
  }) : super(key: key);

  @override
  _NathBotState createState() => _NathBotState();
}

class _NathBotState extends State<NathBot> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: widget.isTop ? 8 : 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Card(
                    elevation: 4,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(25),
                            bottomLeft: Radius.circular(25))),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: const Radius.circular(25),
                              bottomLeft: widget.isTop ? Radius.circular(0) : Radius.circular(25)),
                          gradient: LinearGradient(
                              colors: [AppColors.purple, AppColors.lightPurple],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight)),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          widget.text,
                          style: const TextStyle(color: Colors.white),
                          softWrap: true,
                        ),
                      ),
                    ),
                  ),
                  if(!widget.isTop)
                  const Padding(
                    padding: EdgeInsets.only(right: 8.0),
                    child: Text('22:02'),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
