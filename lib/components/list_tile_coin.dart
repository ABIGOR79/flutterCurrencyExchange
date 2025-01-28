import 'package:flutter/material.dart';
import 'package:flutter_app/models/coins_model.dart';
import 'package:go_router/go_router.dart';

class CoinItem extends StatelessWidget {
  const CoinItem({super.key, required this.coin});

  final CoinsData coin;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(
        coin.coinDetail.fullImageUrl,
        errorBuilder: (context, error, stackTrace) {
          return const Icon(Icons.broken_image, size: 40);
        },
      ),
      title:
          Text('\$${coin.coinDetail.highHour?.toStringAsFixed(2) ?? '0.00'}'),
      subtitle: Text(coin.symbol),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () => context.go('/coin', extra: coin),
    );
  }
}
