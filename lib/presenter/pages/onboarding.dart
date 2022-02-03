import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:nath_bot_app/presenter/components/vamos_conversar_button.dart';
import 'package:nath_bot_app/theme/app_colors.dart';
import 'package:nath_bot_app/theme/text_style.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.purple,
      body: OnboardingBody(),
    );
  }
}

class OnboardingBody extends StatefulWidget {
  const OnboardingBody({Key? key}) : super(key: key);

  @override
  _OnboardingBodyState createState() => _OnboardingBodyState();
}

class _OnboardingBodyState extends State<OnboardingBody> {
  int activeIndex = 0;

  Image image = Image.asset('assets/saco_1.png');

  final carousel = [
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
            'Olá 👋',
        style: TextStyles.poppins32textBlack600,),
        Text(
            'Eu sou a Nath.',
        style: TextStyles.poppins28textBlack600,),
         Padding(
          padding: const EdgeInsets.only(top: 16, right: 48),
          child: Text(
              'Sou uma inteligência artificial que vai desfuder a sua vida financeira.',
          style: TextStyles.poppins16grey400,),
        ),
      ],
    ),
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Ajudo você',
          style: TextStyles.poppins32textBlack600,),
        Text('a investir melhor',
          style: TextStyles.poppins28textBlack600,),
        Padding(
          padding: const EdgeInsets.only(top: 16, right: 48),
          child: Text(
              'Sou uma inteligência artificial que vai desfuder a sua vida financeira.',
            style: TextStyles.poppins16grey400,),
        ),
      ],
    ),
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Crie metas',
          style: TextStyles.poppins32textBlack600,),
        Text('e as alcance',
          style: TextStyles.poppins28textBlack600,),
        Padding(
          padding: const EdgeInsets.only(top: 16, right: 48),
          child: Text(
              'Vou ajudar você a gerir sua renda extra e atingir suas metas.',
            style: TextStyles.poppins16grey400,),
        ),
      ],
    ),
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Renda extra',
          style: TextStyles.poppins32textBlack600,),
        Text('ah que festa!',
          style: TextStyles.poppins28textBlack600,),
        Padding(
          padding: const EdgeInsets.only(top: 16, right: 48),
          child: Text(
              'Vou ajudar você a gerir sua renda extra e atingir suas metas.',
            style: TextStyles.poppins16grey400,),
        ),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Transform.translate(
            offset: const Offset(0, -50),
            child: Center(
              child: Transform.scale(
                scale: 1.5,
                child: CircleAvatar(
                  backgroundColor: AppColors.lightPurple.withOpacity(0.3),
                  radius: 190,
                ),
              ),
            ),
          ),
          Transform.translate(
            offset: const Offset(0, -50),
            child: Center(
              child: Transform.scale(
                scale: 1.5,
                child: const CircleAvatar(
                  backgroundColor: AppColors.purple,
                  radius: 140,
                ),
              ),
            ),
          ),
          Transform.translate(
            offset: const Offset(0, -50),
            child: Center(
              child: Transform.scale(
                scale: 1.5,
                child: CircleAvatar(
                  backgroundColor: AppColors.lightPurple.withOpacity(0.2),
                  radius: 90,
                ),
              ),
            ),
          ),
          Transform.translate(
            offset: const Offset(0, -50),
            child: Center(
              child: Transform.scale(
                scale: 1.5,
                child: const CircleAvatar(
                  backgroundColor: AppColors.purple,
                  radius: 40,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  color: AppColors.white,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(50))),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(40, 56, 32, 66),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CarouselSlider.builder(
                      itemCount: carousel.length,
                      options: CarouselOptions(

                          viewportFraction: 1,
                          enableInfiniteScroll: false,
                          onPageChanged: (index, reason) {
                            return setState(() {
                              activeIndex = index;
                              switch (index) {
                                case 0:
                                  image = Image.asset('assets/saco_1.png', key: ValueKey<int>(index),);
                                  break;
                                case 1:
                                  image = Image.asset('assets/cofre_1.png', key: ValueKey<int>(index));
                                  break;
                                case 2:
                                  image = Image.asset('assets/montanha_1.png', key: ValueKey<int>(index));
                                  break;
                                case 3:
                                  image = Image.asset('assets/saco_1.png', key: ValueKey<int>(index));
                                  break;
                              }
                            });
                          }),
                      itemBuilder: (context, index, realIndex) {
                        final item = carousel[index];

                        return item;
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        VamosConversarButton(onClick: () async => await Navigator.pushNamed(context, '/chat_screen')),
                        AnimatedSmoothIndicator(
                          activeIndex: activeIndex,
                          count: carousel.length,
                          effect: const ExpandingDotsEffect(
                            dotWidth: 10,
                              dotHeight: 10,
                              dotColor: AppColors.lightGrey,
                              activeDotColor: AppColors.darkYellow),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            child: image,
          )
        ],
      ),
    );
  }
}
