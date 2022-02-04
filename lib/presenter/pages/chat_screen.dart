import 'package:flutter/material.dart';
import 'package:nath_bot_app/presenter/components/menu_chat_bot_item.dart';
import 'package:nath_bot_app/presenter/components/menu_icon.dart';
import 'package:nath_bot_app/presenter/components/meus_gastos.dart';
import 'package:nath_bot_app/presenter/components/nath_bot.dart';
import 'package:nath_bot_app/presenter/components/selfie_financeira.dart';
import 'package:nath_bot_app/presenter/components/user_chat.dart';
import 'package:nath_bot_app/theme/app_colors.dart';
import 'package:nath_bot_app/theme/text_style.dart';
import 'package:showcaseview/showcaseview.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  bool _isSoundOn = true;
  final keyOne = GlobalKey();
  final keyTwo = GlobalKey();
  final keyThree = GlobalKey();
  final keyFour = GlobalKey();
  final keyFive = GlobalKey();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance?.addPostFrameCallback((_) =>
    //     ShowCaseWidget.of(context)
    //         ?.startShowCase([keyOne, keyTwo, keyThree, keyFour, keyFive]));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.iceGrey,
      key: _scaffoldKey,
      drawer: Drawer(),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: AppColors.iceGrey,
        title: Showcase(
          key: keyOne,
          description: 'Menu',
          child: MenuIcon(
            onClick: () {
              _scaffoldKey.currentState?.openDrawer();
            },
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Showcase(
              key: keyTwo,
              description: 'Ligar e desligar o som',
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
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8, right: 8),
            child: Showcase(
              key: keyThree,
              description: 'Descrição',
              child: Container(
                decoration: const BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50))),
                child: IconButton(
                  onPressed: () {
                    showTopDialog(context);
                  },
                  icon: const Icon(Icons.person_outline),
                  color: AppColors.purple,
                ),
              ),
            ),
          ),
        ],
      ),
      body: ChatScreenBody(keyFour: keyFour, keyFive: keyFive,),
    );
  }

  void showTopDialog(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      transitionDuration: Duration(milliseconds: 500),
      barrierLabel: MaterialLocalizations.of(context).dialogLabel,
      barrierColor: Colors.black.withOpacity(0.5),
      pageBuilder: (context, _, __) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              height: 300,
            ),
          ],
        );
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return SlideTransition(
          position: CurvedAnimation(
            parent: animation,
            curve: Curves.easeOut,
          ).drive(Tween<Offset>(
            begin: Offset(0, -1.0),
            end: Offset.zero,
          )),
          child: child,
        );
      },
    );
  }
}

class ChatScreenBody extends StatefulWidget {
  final GlobalKey keyFour;
  final GlobalKey keyFive;

  const ChatScreenBody({
    Key? key,
    required this.keyFour,
    required this.keyFive,
  }) : super(key: key);

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
      time: '22:02',
    ),
    // SelfieFinanceira(time: '22:02')
    // const UserChat(text: 'text', time: '22:02', alterar: true,),
    // RendaExtra(time: '22:02',)
    // Investimentos(time: '22:02',),
    const MeusGastos(time: '22:02',)
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
        const SizedBox(
          height: 16,
        ),
        Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                controller: _scrollController,
                itemCount: chatList.length,
                itemBuilder: (context, index) {
                  final item = chatList[index];
                  return item;
                })),
        // if (_isMenuOpen)

          AnimatedSwitcher(
            switchInCurve: Curves.elasticOut,
            switchOutCurve: Curves.elasticIn,
            duration: const Duration(seconds: 1),
            transitionBuilder: (child, animation) {
              Future.delayed(Duration(milliseconds: 1500), (){_scrollToEnd();});
              return ScaleTransition(
                  child: child,
                  scale: animation);

            },
            child: _isMenuOpen ? SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    for (String i in menuDoChatBot)
                      MenuChatBotItem(
                        text: i,
                        itemColor1: i == selected
                            ? AppColors.menuButtonGradient1
                            : AppColors.white,
                        itemColor2: i == selected
                            ? AppColors.menuButtonGradient2
                            : AppColors.white,
                        onClick: () {
                          setState(() {
                            selected = i;
                          });
                          Future.delayed(const Duration(seconds: 1), () {
                            setState(() {
                              _isMenuOpen = !_isMenuOpen;
                              selected = '';
                            });
                          });
                          Future.delayed(const Duration(seconds: 2), () {
                            setState(() {
                              chatList.add(UserChat(
                                text: i,
                                time: '22:02',
                                alterar: true,
                              ));
                            });
                          });
                          Future.delayed(const Duration(milliseconds: 2300), () {
                            setState(() {
                              _scrollToEnd();
                            });
                          });
                        },
                        textStyle: i == selected
                            ? TextStyles.poppins14white500
                            : TextStyles.poppins14timeGrey500,
                      )
                  ],
                ),
              ),
            ) : Container(
              height: 0,
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
                        chatList.add(UserChat(
                          text: text,
                          time: '22:02',
                          alterar: true,
                        ));
                        setState(() {
                          _controller.clear();
                        });
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Showcase(
                    key: widget.keyFive,
                    description: 'Descrição',
                    child: IconButton(
                      icon: const Icon(
                        Icons.mic_none_outlined,
                        color: AppColors.purple,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ),
                Showcase(
                  key: widget.keyFour,
                  description: 'Descrição',
                  child: IconButton(
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
