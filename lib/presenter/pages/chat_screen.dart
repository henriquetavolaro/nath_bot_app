import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nath_bot_app/presenter/components/menu_chat_bot_item.dart';
import 'package:nath_bot_app/presenter/components/menu_icon.dart';
import 'package:nath_bot_app/presenter/components/meus_gastos.dart';
import 'package:nath_bot_app/presenter/components/nath_bot.dart';
import 'package:nath_bot_app/presenter/components/user_chat.dart';
import 'package:nath_bot_app/theme/app_colors.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  bool _isSoundOn = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.iceGrey,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.iceGrey,
        title: MenuIcon(
          onClick: () {},
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: IconButton(
              onPressed: () {
                setState(() {
                  _isSoundOn = !_isSoundOn;
                });
              },
              icon: _isSoundOn
                  ? const Icon(Icons.volume_down_outlined)
                  : const Icon(Icons.volume_off_outlined),
              color: _isSoundOn ? AppColors.purple : AppColors.grey,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, right: 8),
            child: Container(
              decoration: const BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50))),
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.person_outline),
                color: AppColors.purple,
              ),
            ),
          ),
        ],
      ),
      body: ChatScreenBody(),
    );
  }
}

class ChatScreenBody extends StatefulWidget {
  const ChatScreenBody({Key? key}) : super(key: key);

  @override
  _ChatScreenBodyState createState() => _ChatScreenBodyState();
}

class _ChatScreenBodyState extends State<ChatScreenBody> {
  List<String> menuDoChatBot = [
    'Selfie da riqueza',
    'Meu futuro',
    'Meus gastos',
    'Meus ganhos',
    'Meus investimentos',
    'Minhas dívidas',
    'Gerenciar contas'
  ];

  bool _isMenuOpen = false;

  final ScrollController _scrollController = ScrollController();
  final TextEditingController _controller = TextEditingController();
  List chatList = [
    const NathBot(
      text:
          'O-lá Abel, quanto tempo. Me fala, o que você quer fazer. Aproveita que eu tô fofa',

      cancel: true,
    ),
    const UserChat(text: 'text'),
    const MeusGastos()
  ];

  _scrollToEnd() async {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      curve: Curves.easeIn,
      duration: const Duration(milliseconds: 200),
    );
  }

  String selected = '';

  @override
  void dispose() {
    _scrollController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _scrollToEnd();

    return Column(
      children: [
        SizedBox(
          height: 16,
        ),
        Expanded(
            child: ListView.builder(
                controller: _scrollController,
                itemCount: chatList.length,
                itemBuilder: (context, index) {
                  final item = chatList[index];
                  return item;
                })),
        if (_isMenuOpen)
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  for (String i in menuDoChatBot)
                    MenuChatBotItem(
                      text: i,
                      itemColor1:
                          i == selected ? AppColors.menuButtonGradient1 : AppColors.white,
                      itemColor2:
                          i == selected ? AppColors.menuButtonGradient2 : AppColors.white,
                      onClick: () {
                        setState(() {
                          selected = i;
                        });
                        Future.delayed(const Duration(seconds: 2), () {
                          setState(() {
                            _isMenuOpen = !_isMenuOpen;
                            selected = '';
                          });
                        });
                        Future.delayed(const Duration(seconds: 3), () {
                          setState(() {
                            chatList.add(UserChat(text: i));
                          });
                        });
                        Future.delayed(const Duration(milliseconds: 3500), () {
                          setState(() {
                            _scrollToEnd();
                          });
                        });
                      },
                    )
                ],
              ),
            ),
          ),
        buildBottomContainer(context)
      ],
    );
  }

  Container buildBottomContainer(BuildContext context) {
    return Container(
      color: AppColors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
        child: Column(
          children: [
            Row(
              children: [
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: TextField(
                      controller: _controller,
                      decoration: const InputDecoration.collapsed(
                          hintText: "Digite aqui"),
                      onSubmitted: (text) {
                        chatList.add(UserChat(text: text));
                        setState(() {
                          _controller.clear();
                        });
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: IconButton(
                    icon: const Icon(
                      Icons.mic_none_outlined,
                      color: AppColors.purple,
                    ),
                    onPressed: () {},
                  ),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.more_horiz_rounded,
                    color: AppColors.purple,
                  ),
                  onPressed: () {
                    setState(() {
                      _isMenuOpen = !_isMenuOpen;
                    });
                  },
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(110, 16, 110, 8),
              child: Container(
                  height: 8,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: AppColors.lightGrey,
                      borderRadius: BorderRadius.circular(25))),
            )
          ],
        ),
      ),
    );
  }
}
