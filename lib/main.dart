import 'package:crypto_currency/cubit/coin_cubit.dart';
import 'package:crypto_currency/pages/price_screen.dart';
import 'package:crypto_currency/utils/isar_db.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  final repository = IsarDataBase();
  // Initialize the database
  await repository.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crypto Currency',
      theme: FlexThemeData.light(scheme: FlexScheme.deepBlue,),
      // The Mandy red, dark theme.
      darkTheme: FlexThemeData.dark(scheme: FlexScheme.mandyRed),
      // Use dark or light theme based on system setting.
      themeMode: ThemeMode.dark,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget _currentScreen = PriceScreen();

  void _switchScreen(Widget screen) {
    setState(() {
      _currentScreen = screen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crypto Currency'),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              margin: EdgeInsets.zero,
              padding: EdgeInsets.zero,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
              ),
              child: Center(
                child: Text(
                  'Crypto Menu',
                ),
              ),
            ),
            Expanded(
              child: ListTile(
                leading: Icon(Icons.attach_money),
                title: Text('Current Price'),
                onTap: () {
                  Navigator.pop(context);
                  _switchScreen(PriceScreen());
                },
              ),
            ),
          ],
        ),
      ),
      body: BlocProvider(
        create: (context) => CoinCubit(),
        child: _currentScreen,
      ),
    );
  }
}
