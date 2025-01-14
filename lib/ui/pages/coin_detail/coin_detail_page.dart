import 'package:flutter/material.dart';
import 'package:flutter_app/models/coins_model.dart';

class CoinItemDetail extends StatelessWidget {
  const CoinItemDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments;

    if (args == null || args is! CoinsData) {
      return Scaffold(
        appBar: AppBar(title: const Text('Error')),
        body: const Center(
          child: Text('No coin data provided.'),
        ),
      );
    }

    final coin = args;

    return Scaffold(
      appBar: AppBar(
        title: Text(coin.symbol),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Price: \$${coin.coinDetail.price?.toStringAsFixed(2)}'),
            Text('Symbol: ${coin.symbol}'),
          ],
        ),
      ),
    );
  }
}
