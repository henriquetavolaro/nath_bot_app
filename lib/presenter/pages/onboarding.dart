import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:nath_bot_app/presenter/components/vamos_conversar_button.dart';
import 'package:nath_bot_app/theme/app_colors.dart';
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

  Image image = Image.asset('assets/cofre.png');

  final carousel = [
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text('Olá'),
        Text('Eu sou a Nath.'),
        Padding(
          padding: EdgeInsets.only(top: 16, right: 48),
          child: Text(
              'Sou uma inteligência artificial que vai desfuder a sua vida financeira.'),
        ),
      ],
    ),
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text('Ajudo você'),
        Text('a investir melhor'),
        Padding(
          padding: EdgeInsets.only(top: 16, right: 48),
          child: Text(
              'Sou uma inteligência artificial que vai desfuder a sua vida financeira.'),
        ),
      ],
    ),
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text('Crie metas'),
        Text('e as alcance'),
        Padding(
          padding: EdgeInsets.only(top: 16, right: 48),
          child: Text(
              'Vou ajudar você a gerir sua renda extra e atingir suas metas.'),
        ),
      ],
    ),
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text('Renda extra'),
        Text('ah que festa'),
        Padding(
          padding: EdgeInsets.only(top: 16, right: 48),
          child: Text(
              'Vou ajudar você a gerir sua renda extra e atingir suas metas.'),
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
                child: const CircleAvatar(
                  backgroundColor: AppColors.lightPurple,
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
                child: const CircleAvatar(
                  backgroundColor: AppColors.lightPurple,
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
              // height: MediaQuery.of(context).size.height * 0.4,

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
                          height: 120,
                          viewportFraction: 1,
                          enableInfiniteScroll: false,
                          onPageChanged: (index, reason) {
                            return setState(() {
                              activeIndex = index;
                              switch (index) {
                                case 0:
                                  image = Image.asset('assets/cofre.png', key: ValueKey<int>(index),);
                                  break;
                                case 1:
                                  image = Image.asset('assets/montanha.png', key: ValueKey<int>(index));
                                  break;
                                case 2:
                                  image = Image.asset('assets/cofre.png', key: ValueKey<int>(index));
                                  break;
                                case 3:
                                  image = Image.asset('assets/montanha.png', key: ValueKey<int>(index));
                                  break;
                              }
                              ;
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
                        VamosConversarButton(onClick: () {}),
                        AnimatedSmoothIndicator(
                          activeIndex: activeIndex,
                          count: carousel.length,
                          effect: const ExpandingDotsEffect(
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
