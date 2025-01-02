import 'package:bloc/bloc.dart';
import 'package:crypto_currency/class/wallet_info.dart';
import 'package:equatable/equatable.dart';

part 'wallet_state.dart';

class WalletCubit extends Cubit<WalletState> {
  WalletCubit() : super(WalletInitial());

}
