part of 'coin_cubit.dart';

sealed class CoinState extends Equatable {
  const CoinState();

  @override
  List<Object> get props => [];
}

final class CoinInitial extends CoinState {}

final class CoinLoading extends CoinState {}

final class CoinLoaded extends CoinState {
  final Map<String, CoinInfo> coinMap;

  const CoinLoaded({required this.coinMap});

  @override
  List<Object> get props => [identityHashCode(this)];
}

final class CoinError extends CoinState {
  final String message;

  const CoinError(this.message);
}