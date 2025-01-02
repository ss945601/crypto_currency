import 'package:crypto_currency/class/wallet_info.dart';
import 'package:flutter/material.dart';

class WalletDetailPage extends StatelessWidget {
  final WalletInfo wallet;

  const WalletDetailPage({Key? key, required this.wallet}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wallet Details (${wallet.userID})'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Wallet Balance Section
            Card(
              color: const Color.fromARGB(255, 137, 146, 152),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Total USD Balance',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '\$${wallet.usd.toStringAsFixed(2)}',
                      style: const TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Purchased Coins Section
            ExpansionTile(
              title: const Text(
                'Purchased Coins',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              children: wallet.buyCoins.isNotEmpty
                  ? wallet.buyCoins.map((coin) {
                      return ListTile(
                        leading: CircleAvatar(
                          child: Text(coin.name?.substring(0, 1) ?? '?'),
                        ),
                        title: Text(coin.name ?? 'Unknown Coin'),
                        subtitle: Text('Price: \$${coin.price?.toStringAsFixed(2) ?? '0.00'}'),
                        trailing: Text(coin.timestamp?.toIso8601String().split('T').first ?? ''),
                      );
                    }).toList()
                  : [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('No coins purchased yet.'),
                      )
                    ],
            ),
            const SizedBox(height: 16),
            // Trade Data Section
            ExpansionTile(
              title: const Text(
                'Recent Trades',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              children: wallet.tradeData.isNotEmpty
                  ? wallet.tradeData.map((trade) {
                      final earnPrice = (trade.sell ?? 0.0) - (trade.buy ?? 0.0);
                      final earnPercent = (trade.buy != null && trade.buy != 0)
                          ? (earnPrice / trade.buy! * 100).toStringAsFixed(2)
                          : 'N/A';
                      return ListTile(
                        leading: const Icon(Icons.swap_horiz, color: Colors.blueAccent),
                        title: Text(trade.coinName ?? 'Unknown Trade'),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Buy: \$${trade.buy?.toStringAsFixed(2) ?? '0.00'}, Sell: \$${trade.sell?.toStringAsFixed(2) ?? '0.00'}'),
                            Text('Earn: \$${earnPrice.toStringAsFixed(2)} (${earnPercent}%)'),
                          ],
                        ),
                        trailing: Text(trade.timestamp?.toIso8601String().split('T').first ?? ''),
                      );
                    }).toList()
                  : [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('No trade data available.'),
                      )
                    ],
            ),
          ],
        ),
      ),
    );
  }
}