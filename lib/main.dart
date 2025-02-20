import 'package:crypto_currency/cubit/coin_cubit.dart';
import 'package:crypto_currency/cubit/setting_cubit.dart';
import 'package:crypto_currency/pages/license_page.dart';
import 'package:crypto_currency/pages/price_screen.dart';
import 'package:crypto_currency/pages/setting_page.dart';
import 'package:crypto_currency/pages/wallet_page.dart';
import 'package:crypto_currency/utils/isar_db.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  _initEasyLoading();
  final repository = IsarDataBase();
  // Initialize the database
  await repository.init();
  runApp(MyApp());
}

void _initEasyLoading() {
  EasyLoading.init();
  EasyLoading.instance
    ..maskType = EasyLoadingMaskType.clear
    ..maskColor = Colors.transparent
    ..backgroundColor = Colors.transparent
    ..indicatorColor = Colors.white
    ..dismissOnTap = false // Prevent accidental dismiss
    ..userInteractions = false // Prevents user interaction
    ..textColor = Colors.white // Customize text color
    ..loadingStyle = EasyLoadingStyle.custom // Custom styling
    ..dismissOnTap = false // Prevent accidental dismiss
    ..boxShadow = [] // Ensures no shadow
    ..contentPadding = EdgeInsets.zero // Removes extra padding
    ..progressColor = Colors.transparent; // Ensures no progress bar background
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crypto Currency',
      theme: FlexThemeData.light(
        scheme: FlexScheme.deepBlue,
      ),
      builder: (context, child) {
        return FlutterEasyLoading(child: child);
      },
      // The Mandy red, dark theme.
      darkTheme:
          FlexThemeData.dark(scheme: FlexScheme.deepBlue, useMaterial3: true)
              .copyWith(
                  appBarTheme: AppBarTheme(
                      color: const Color.fromARGB(255, 50, 54, 56)
                          .withOpacity(0.8))),
      // Use dark or light theme based on system setting.
      themeMode: ThemeMode.dark,
      home: MultiBlocProvider(providers: [
        BlocProvider(
          create: (context) => SettingCubit(),
        ),
      ], child: MyHomePage()),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget _currentScreen = PriceScreen();
  CoinCubit coinCubit = CoinCubit();
  void _switchScreen(Widget screen) {
    setState(() {
      _currentScreen = screen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SettingCubit, SettingState>(
      listener: (context, state) {
        if (state is SettingUpdateCoinList) {
          coinCubit.refresh();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Crypto Currency'),
          centerTitle: true,
        ),
        drawer: Drawer(
          child: Column(
            children: [
              DrawerHeader(
                margin: EdgeInsets.zero,
                padding: EdgeInsets.zero,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                ),
                child: const Center(
                  child: Text(
                    'Crypto Menu',
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.wallet),
                title: const Text('My wallets'),
                onTap: () {
                  Navigator.pop(context);
                  _switchScreen(WalletPage());
                },
              ),
              ListTile(
                leading: const Icon(Icons.attach_money),
                title: const Text('Coin Chart'),
                onTap: () {
                  Navigator.pop(context);
                  _switchScreen(PriceScreen());
                },
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Setting'),
                onTap: () {
                  Navigator.pop(context);
                  _switchScreen(const SettingPage());
                },
              ),
              const Spacer(),
              ListTile(
                leading: const Icon(Icons.info),
                title: const Text('License & Disclaimer'),
                onTap: () {
                  Navigator.pop(context);
                  _switchScreen(const LicenseAndDisclaimerPage());
                },
              ),
            ],
          ),
        ),
        body: BlocProvider(
          create: (context) => coinCubit,
          child: Container(
              padding: const EdgeInsets.all(6),
              color: Colors.blueGrey[800],
              child: _currentScreen),
        ),
      ),
    );
  }
}
