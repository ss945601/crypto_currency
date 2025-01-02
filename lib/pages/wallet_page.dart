import 'package:crypto_currency/class/coin_data.dart';
import 'package:crypto_currency/class/trade_data.dart';
import 'package:crypto_currency/class/wallet_info.dart';
import 'package:crypto_currency/pages/wallet_detail_page.dart';
import 'package:flutter/material.dart';

class WalletPage extends StatelessWidget {

  const WalletPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<WalletInfo> wallets = [
        WalletInfo()
          ..userID = "User1"
          ..usd = 5000.0
          ..buyCoins = [
            CoinData(id: 1, coinId: "BTC", name: "Bitcoin", price: 45000.0, timestamp: DateTime.now()),
            CoinData(id: 2, coinId: "ETH", name: "Ethereum", price: 3000.0, timestamp: DateTime.now()),
          ]
          ..tradeData = [
            TradeData(id: 1, userID: "1", userName: "Alice", tradeId: "T001", coinId: "BTC", coinName: "Bitcoin", sell: 42000, buy: 43000, timestamp: DateTime.now()),
          ],
        WalletInfo()
          ..userID = "User2"
          ..usd = 10000.0
          ..buyCoins = [
            CoinData(id: 3, coinId: "LTC", name: "Litecoin", price: 200.0, timestamp: DateTime.now()),
          ]
          ..tradeData = [
            TradeData(id: 2, userID: "2", userName: "Bob", tradeId: "T002", coinId: "ETH", coinName: "Ethereum", sell: 2900, buy: 2950, timestamp: DateTime.now()),
          ],
      ];
    return ListView.builder(
        itemCount: wallets.length,
        itemBuilder: (context, index) {
          final wallet = wallets[index];
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text('Wallet ${wallet.userID}'),
              subtitle: Text('Balance: \$${wallet.usd.toStringAsFixed(2)}'),
              leading: CircleAvatar(
                backgroundColor: Colors.blueAccent,
                child: Text(wallet.userID.substring(0, 1).toUpperCase()),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WalletDetailPage(wallet: wallet),
                  ),
                );
              },
            ),
          );
        },
      );
  }
}
