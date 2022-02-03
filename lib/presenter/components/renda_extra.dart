import 'package:flutter/material.dart';
import 'package:nath_bot_app/presenter/components/time_widget.dart';
import 'package:nath_bot_app/theme/app_colors.dart';
import 'package:nath_bot_app/theme/text_style.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import 'nath_bot.dart';

class RendaExtra extends StatefulWidget {
  final String time;

  const RendaExtra({Key? key, required this.time}) : super(key: key);

  @override
  _RendaExtraState createState() => _RendaExtraState();
}

class _RendaExtraState extends State<RendaExtra> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const NathBot(
            isTop: true,
            text: 'Leonardo, olha como estamos 🤑',
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
                  padding: const EdgeInsets.only(left: 4, right: 12),
                  child: Material(
                    color: AppColors.white,
                    elevation: 4,
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25)),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Transform.translate(
                            offset: Offset(0, 24),
                            child: SizedBox(
                              height: 180,
                              child: SfRadialGauge(axes: <RadialAxis>[
                                RadialAxis(
                                  annotations: [
                                    GaugeAnnotation(
                                      positionFactor: 0.1,
                                        widget: RichText(
                                          text: TextSpan(
                                            text: '72',
                                            style: TextStyles.nunito36textBlack700,
                                            children: <TextSpan>[
                                              TextSpan(
                                                  text: '%',
                                                  style: TextStyles.nunito16textBlack700
                                              ),
                                            ],
                                          ),
                                        ))
                                  ],
                                  startAngle: 150,
                                  endAngle: 30,
                                  minimum: 0,
                                  maximum: 100,
                                  showLabels: false,
                                  showTicks: false,
                                  pointers: const [
                                    RangePointer(
                                      gradient: SweepGradient(colors: [
                                        AppColors.purple,
                                        AppColors.lightPurple
                                      ]),
                                      enableAnimation: true,
                                      value: 50,
                                      cornerStyle: CornerStyle.bothCurve,
                                      width: 20,
                                    )
                                  ],
                                  axisLineStyle: const AxisLineStyle(
                                    thickness: 0.2,
                                    cornerStyle: CornerStyle.bothCurve,
                                    color: AppColors.iceGrey,
                                    thicknessUnit: GaugeSizeUnit.factor,
                                  ),
                                )
                              ]),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.flag_outlined,
                                color: AppColors.purple,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text('Renda extra', style: TextStyles.nunito14purple600,),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Alcançado: R\$ 194,39', style: TextStyles.nunito14textBlack600,),
                          ),
                          Text('Meta: R\$ 269,99 até 30/04/2022', style: TextStyles.nunito12grey600,)
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8,top: 4),
            child: TimeWidget(time: widget.time),
          ),
        ],
      ),
    );
  }
}
