import 'package:crypto_currency/cubit/coin_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

// UI
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crypto Prices',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => CoinCubit(),
        child: PriceScreen(),
      ),
    );
  }
}

class PriceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crypto Prices'),
      ),
      body: BlocBuilder<CoinCubit, CoinState>(
        builder: (context, state) {
          if (state is CoinLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is CoinLoaded) {
            return ListView(
              children: state.coinMap.entries
                  .map((entry) => ListTile(
                        title: Text(entry.key.toUpperCase()),
                        subtitle: Text('Price: \$${entry.value.priceUsd}'),
                      ))
                  .toList(),
            );
          } else if (state is CoinError) {
            return Center(child: Text('Error: ${state.message}'));
          } else {
            return Center(child: Text('No data available'));
          }
        },
      ),
    );
  }
}
