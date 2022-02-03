import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nath_bot_app/presenter/components/nath_bot.dart';
import 'package:nath_bot_app/presenter/components/time_widget.dart';
import 'package:nath_bot_app/theme/app_colors.dart';
import 'package:nath_bot_app/theme/text_style.dart';

class MeusGastos extends StatefulWidget {
  final String time;
  const MeusGastos({Key? key, required this.time}) : super(key: key);

  @override
  _MeusGastosState createState() => _MeusGastosState();
}

class _MeusGastosState extends State<MeusGastos> {

  List meusGastosCategoryList = [
    MeusGastosCategory(category: 'Morar', icon: Icons.home_outlined, value: '1.7800,00', percentage: 78),
    MeusGastosCategory(category: 'Comer', icon: Icons.local_dining_outlined, value: '670,00', percentage: 32),
    MeusGastosCategory(category: 'Saúde', icon: Icons.favorite_border_outlined, value: '337,00', percentage: 18),
    MeusGastosCategory(category: 'Transporte', icon: FontAwesomeIcons.car, value: '978,00', percentage: 52),
    MeusGastosCategory(category: 'Lazer', icon: Icons.chrome_reader_mode_outlined , value: '713,00', percentage: 24),
    MeusGastosCategory(category: 'Metas', icon: Icons.outlined_flag, value: '112,00', percentage: 21),
  ];


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const NathBot(
            text:
                'Leonardo, estes são os seus gastos de janeiro até agora por categoria',
            isTop: true,
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
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Card(
                    elevation: 4,
                    color: AppColors.white,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(25),
                            bottomLeft: Radius.circular(25))),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                           Text('Gastos até 7 de janeiro',
                          style: TextStyles.nunito12grey600,),
                          Padding(
                            padding: EdgeInsets.only(bottom: 16),
                            child: RichText(
                              text: TextSpan(
                                text: 'R\$ ',
                                style: TextStyles.nunito16textBlack700,
                                children: <TextSpan>[
                                  TextSpan(
                                      text: '6.795,93',
                                      style: TextStyles.nunito22textBlack700
                                  ),
                                ],
                              ),
                            )

                            // Text('R\$ 6.795,93'),
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: meusGastosCategoryList.length,
                              itemBuilder: (context, index){
                              final item = meusGastosCategoryList[index];
                                return item;
                              })
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: TimeWidget(time: widget.time),
          )
        ],
      ),
    );
  }
}

class MeusGastosCategory extends StatefulWidget {
  final String category;
  final IconData icon;
  final String value;
  final double percentage;

  const MeusGastosCategory({
    Key? key,
    required this.category,
    required this.icon,
    required this.value,
    required this.percentage,
  }) : super(key: key);

  @override
  State<MeusGastosCategory> createState() => _MeusGastosCategoryState();
}

class _MeusGastosCategoryState extends State<MeusGastosCategory> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  widget.icon,
                  color: AppColors.purple,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                      widget.category,
                  style: TextStyles.nunito14textBlack600,),
                )
              ],
            ),
            Row(
              children: [
                RichText(
                  text: TextSpan(
                    text: 'R\$ ',
                    style: TextStyles.nunito12grey600,
                    children: <TextSpan>[
                      TextSpan(
                          text: widget.value,
                          style: TextStyles.nunito14grey600
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Text('${widget.percentage}%',
                  style: TextStyles.nunito14purple700,),
                ),
              ],
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Container(
                  height: 3,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: AppColors.iceGrey,
                    borderRadius: BorderRadius.circular(25)
                  ),
                  ),
              ),
              FractionallySizedBox(
                widthFactor: widget.percentage/100,
                child: Container(
                  height: 11,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        AppColors.purple,
                        AppColors.lightPurple
                      ]
                    ),
                    borderRadius: BorderRadius.circular(25)
                  ),
                ),
              )
            ],
          )
        )
      ],
    );
  }
}
