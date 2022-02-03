import 'package:flutter/material.dart';
import 'package:nath_bot_app/theme/app_colors.dart';

class MenuChatBotItem extends StatefulWidget {
  final String text;
  final VoidCallback onClick;
  final Color itemColor1;
  final Color itemColor2;

  const MenuChatBotItem({
    Key? key,
    required this.text,
    required this.onClick,
    required this.itemColor1,
    required this.itemColor2,
  }) : super(key: key);

  @override
  _MenuChatBotItemState createState() => _MenuChatBotItemState();
}

class _MenuChatBotItemState extends State<MenuChatBotItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onClick,
      child: Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: Material(
          borderRadius: BorderRadius.circular(14),
          elevation: 1,
                  child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
                gradient: LinearGradient(
                    colors: [
                     widget.itemColor1,
                     widget.itemColor2,
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight
                )
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(widget.text),
            ),
          ),
        ),
      ),
    );
  }
}
