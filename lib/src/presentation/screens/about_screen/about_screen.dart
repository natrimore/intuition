import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  final String text =
      "   Интуиция - это латинское слово, которое означает смотреть в свое сердце! Для изучения интуиции было проведено много исследований!\n В упражнении, которое мы делаем с вами прямо сейчас, наша способность предвосхищать разовьется! Эта способность нужна нам во многих сферах жизни!\n\n В частности, способность многих крупных бизнесменов к предвидению в бизнесе настолько развита, что подтверждена проверками и наблюдениями!" +
          " Область, с которой нам нужно заниматься, - это гипофиз нашего мозга! В упражнении используются карточки из метода, предложенного Карлом Зенером в 1930 году!" +
          "Наша интуиция защищает нас от ошибок!\n\nИнтуицию можно укрепить и развить с помощью таких упражнений, как мгновенная мускулатура, чем больше вы ее тренируете, тем больше она развивается." +
          "Это означает, что если мы будем практиковать этот метод регулярно, то есть как можно больше раз в день, мы скоро получим результаты.";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            iconSize: 18.0,
            splashRadius: 20,
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.of(context).pop(),
          ),
          centerTitle: true,
          backgroundColor: Color(0xffF6F6FA),
          title: Text(
            'О нас',
            style: TextStyle(
                letterSpacing: 0.5,
                color: Color(0xff282F38),
                fontSize: 18,
                fontWeight: FontWeight.w700),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text("$text"),
        ));
  }
}
