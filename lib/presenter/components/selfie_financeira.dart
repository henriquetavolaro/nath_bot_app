import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:nath_bot_app/presenter/components/time_widget.dart';
import 'package:nath_bot_app/theme/app_colors.dart';
import 'package:nath_bot_app/theme/text_style.dart';

import 'custom_wave_container.dart';
import 'nath_bot.dart';

class SelfieFinanceira extends StatelessWidget {
  final String time;

  const SelfieFinanceira({Key? key, required this.time}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const NathBot(
            isTop: true,
            text: 'Leonardo, esta é a sua Selfie da Riqueza 💜 98',
            time: '0',
          ),
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 25,
                  height: 25,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 4, right: 12),
                  child: Material(
                    color: AppColors.white,
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Tudo que ganhei este mês',
                            style: TextStyles.nunito14textBlack600,
                          ),
                          WaveContainerWithValue(
                            value: '7.568,65',
                            moneyStyle: TextStyles.nunito16textBlack700,
                            valueStyle: TextStyles.nunito22textBlack700,
                            size: 80,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 25,
                  height: 25,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 4, right: 4, top: 8),
                  child: Material(
                    color: AppColors.white,
                    elevation: 4,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Gastos',
                            style: TextStyles.nunito14textBlack600,
                          ),
                          WaveContainerWithValue(
                            value: '6.795,33',
                            moneyStyle: TextStyles.nunito10textBlack700,
                            valueStyle: TextStyles.nunito14textBlack700,
                            size: 80,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 4, right: 12, top: 8),
                  child: Material(
                    color: AppColors.white,
                    elevation: 4,
                    borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(25)),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Investido',
                            style: TextStyles.nunito14textBlack600,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          WaveContainerWithValue(
                            value: '773,32',
                            moneyStyle: TextStyles.nunito10textBlack700,
                            valueStyle: TextStyles.nunito14textBlack700,
                            size: 65,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8,top: 4),
            child: TimeWidget(time: time),
          ),
        ],
      ),
    );
  }
}

class WaveContainerWithValue extends StatelessWidget {
  final String value;
  final TextStyle valueStyle;
  final TextStyle moneyStyle;
  final double size;

  const WaveContainerWithValue({
    Key? key,
    required this.value,
    required this.valueStyle,
    required this.moneyStyle,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipPath(
          clipper: MyCustomClip(),
          child: Container(
            height: size,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    AppColors.white,
                    AppColors.menuButtonGradient1.withOpacity(0.3)
                  ],
                  tileMode: TileMode.mirror,
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter),
            ),
          ),
        ),
        CustomPaint(
          painter: MyCustomPaint(),
          child: Container(
            decoration: const BoxDecoration(
              color: AppColors.black,
            ),
          ),
        ),
        Positioned(
          bottom: 8,
          right: 8,
          child: RichText(
            text: TextSpan(
              text: 'R\$ ',
              style: moneyStyle,
              children: <TextSpan>[
                TextSpan(text: value, style: valueStyle),
              ],
            ),
          ),
        )
      ],
    );
  }
}
