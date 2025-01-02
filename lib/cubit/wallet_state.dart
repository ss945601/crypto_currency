part of 'wallet_cubit.dart';

sealed class WalletState extends Equatable {
  const WalletState();

  @override
  List<Object> get props => [];
}

final class WalletInitial extends WalletState {}

final class WalletLoading extends WalletState {}

final class WalletLoaded extends WalletState {}

final class WalletUpdateList extends WalletState {
  final List<WalletInfo> wallets;

  const WalletUpdateList({required this.wallets});
  @override
  List<Object> get props => [identityHashCode(this)];
}

final class WalletError extends WalletState {}