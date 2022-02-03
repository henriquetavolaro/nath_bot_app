import 'package:flutter/material.dart';
import 'package:nath_bot_app/presenter/components/nath_bot.dart';
import 'package:nath_bot_app/presenter/components/time_widget.dart';
import 'package:nath_bot_app/theme/app_colors.dart';
import 'package:nath_bot_app/theme/text_style.dart';

class Investimentos extends StatelessWidget {

  List investimentosList = [
    const InvestimentoCard(bank: 'BANCO BTG PACTUAL SA', position: '4.211,61', tax: '10,35% a.a.', dueDate:'15/08/2022', quantity: 3, price: '1403,87'),
    const InvestimentoCard(bank: 'BANCO BTG PACTUAL SA', position: '4.211,61', tax: '10,35% a.a.', dueDate:'15/08/2022', quantity: 3, price: '1403,87'),
    const InvestimentoCard(bank: 'BANCO BTG PACTUAL SA', position: '4.211,61', tax: '10,35% a.a.', dueDate:'15/08/2022', quantity: 3, price: '1403,87'),
    const InvestimentoCard(bank: 'BANCO BTG PACTUAL SA', position: '4.211,61', tax: '10,35% a.a.', dueDate:'15/08/2022', quantity: 3, price: '1403,87'),
  ];

  final String time;

  Investimentos({Key? key, required this.time}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child:
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const NathBot(
            isTop: true,
            text:
                'Posição de carteira: R\$ 222,00\nRent. média do portfólio: 2% mês\n% do ganho investido: 28% (mês)',
            time: '0',
          ),

          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 25,
                      height: 25,
                    ),
                  ),
                  for(InvestimentoCard i in investimentosList)
                    if(i == investimentosList[0])
                    Padding(
                      padding: const EdgeInsets.fromLTRB(4, 0, 4, 2),
                      child: Material(
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25)),
                          elevation: 4,
                          child: Container(
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25)),
                                color: AppColors.white,
                              ),
                              width: MediaQuery.of(context).size.width * 0.7,
                              child: i)),
                    )
                     else if(i == investimentosList[investimentosList.length -1])
                      Padding(
                        padding: const EdgeInsets.fromLTRB(4, 0, 4, 2),
                        child: Material(
                            borderRadius: BorderRadius.only(bottomRight: Radius.circular(25)),
                            elevation: 4,
                            child: Container(
                                decoration: const BoxDecoration(
                                  borderRadius:  BorderRadius.only(bottomRight: Radius.circular(25)),
                                  color: AppColors.white,
                                ),
                                width: MediaQuery.of(context).size.width * 0.7,
                                child: i)),
                      )
                  else
                      Padding(
                        padding: const EdgeInsets.fromLTRB(4, 0, 4, 2),
                        child: Material(
                            elevation: 4,
                            child: Container(
                                decoration: const BoxDecoration(
                                  color: AppColors.white,
                                ),
                                width: MediaQuery.of(context).size.width * 0.7,
                                child: i)),
                      )
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0, top: 4),
              child: TimeWidget(time: time),
            )
          )
        ],
      ),
    );
  }
}

class InvestimentoCard extends StatelessWidget {
  final String bank;
  final String position;
  final String tax;
  final String dueDate;
  final double quantity;
  final String price;


  const InvestimentoCard({
    Key? key,
    required this.bank,
    required this.position,
    required this.tax,
    required this.dueDate,
    required this.quantity,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('💰 LCI',
          style: TextStyles.nunito14textBlack400,),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(bank.toUpperCase(),
            style: TextStyles.nunito12grey600,),
          ),
          Text('Posição: R\$ $position',style: TextStyles.nunito14textBlack600,),
          const Padding(
            padding: EdgeInsets.only(top: 8, bottom: 4),
            child: Divider(
              thickness: 1,
              color: AppColors.lightGrey,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Taxa/% índice', style: TextStyles.nunito12grey600,),
                Text(tax, style: TextStyles.nunito12textBlack600,),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Vencimento', style: TextStyles.nunito12grey600,),
                Text(dueDate, style: TextStyles.nunito12textBlack600,),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Quantidade', style: TextStyles.nunito12grey600,),
                Text('$quantity', style: TextStyles.nunito12textBlack600,),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:[
                Text('Preço', style: TextStyles.nunito12grey600,),
                Text('R\$ $price', style: TextStyles.nunito12textBlack600,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
