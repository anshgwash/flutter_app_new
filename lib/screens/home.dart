import 'package:flutter/material.dart';
import 'package:flutter_app_new/widgets/custom_widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          BankTile(
            name: 'HDFC',
            image: 'images/hdfc_logo.png',
            buy: '77.93',
            sell: '78.99',
          ),
          BankTile(
            name: 'KOTAK',
            image: 'images/kotak_logo.png',
            buy: '77.93',
            sell: '78.99',
          ),
        ],
      ),
    );
  }
}
