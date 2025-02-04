import 'package:crypto_currency/class/coin.dart';
import 'package:crypto_currency/class/coin_data.dart';
import 'package:crypto_currency/class/trade_data.dart';
import 'package:crypto_currency/class/wallet_info.dart';
import 'package:crypto_currency/cubit/coin_cubit.dart';
import 'package:crypto_currency/pages/wallet_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<WalletInfo> wallets = [
      WalletInfo()
        ..userID = "User1"
        ..usd = 5000.0
        ..buyCoins = [
          CoinData(
              id: 1,
              coinId: "BTC",
              name: "Bitcoin",
              price: 45000.0,
              timestamp: DateTime.now()),
          CoinData(
              id: 2,
              coinId: "ETH",
              name: "Ethereum",
              price: 3000.0,
              timestamp: DateTime.now()),
        ]
        ..tradeData = [
          TradeData(
              id: 1,
              userID: "1",
              userName: "Alice",
              tradeId: "T001",
              coinId: "BTC",
              coinName: "Bitcoin",
              sell: 42000,
              buy: 43000,
              timestamp: DateTime.now()),
        ],
      WalletInfo()
        ..userID = "User2"
        ..usd = 10000.0
        ..buyCoins = [
          CoinData(
              id: 3,
              coinId: "LTC",
              name: "Litecoin",
              price: 200.0,
              timestamp: DateTime.now()),
        ]
        ..tradeData = [
          TradeData(
              id: 2,
              userID: "2",
              userName: "Bob",
              tradeId: "T002",
              coinId: "ETH",
              coinName: "Ethereum",
              sell: 2900,
              buy: 2950,
              timestamp: DateTime.now()),
        ],
    ];
    Map<String, CoinInfo> coinMap = {};
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ListTile(
          leading: Icon(Icons.attach_money_rounded),
          title: Text(
            "Tracking Coins:",
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocBuilder<CoinCubit, CoinState>(
            buildWhen: (previous, current) => current is CoinLoaded,
            builder: (context, state) {
              if (state is CoinLoaded) {
                coinMap = state.coinMap;
                List<MapEntry<String, CoinInfo>> coinEntries =
                    coinMap.entries.toList();
                return Container(
                  constraints: const BoxConstraints(
                    minHeight: 50,
                  ),
                  width: double.infinity,
                  child: IntrinsicHeight(
                      child: Wrap(
                          runSpacing: 8,
                          spacing: 12,
                          children: List<Widget>.generate(
                            coinEntries.length,
                            (int index) {
                              var entry = coinEntries[index];
                              return IntrinsicWidth(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    CircleAvatar(
                                        child: Text(entry.key[0].toUpperCase())),
                                    SizedBox(width: 4),
                                    Text(entry.key),
                                    SizedBox(width: 4),
                                    Text('\$${entry.value.priceUsd.toString()}')
                                  ],
                                ),
                              );
                            },
                          ))),
                );
              }
              return Text("No Tracking");
            },
          ),
        ),
        const Divider(color: Colors.white30,),
        const ListTile(
          leading: Icon(Icons.wallet),
          title: Text(
            "My Wallets:",
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
          ),
        ),
        Expanded(
          child: ListView.builder(
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
          ),
        ),
      ],
    );
  }
}
