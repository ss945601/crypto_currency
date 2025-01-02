part of 'setting_cubit.dart';

sealed class SettingState extends Equatable {
  const SettingState();

  @override
  List<Object> get props => [];
}

final class SettingInitial extends SettingState {}

final class SettingLoading extends SettingState {}

final class SettingUpdateCoinList extends SettingState {
  @override
  List<Object> get props => [identityHashCode(this)];
}

final class SettingLoaded extends SettingState {
  final List<String> coinIdList;
  const SettingLoaded({required this.coinIdList});
  @override
  List<Object> get props => [identityHashCode(this)];
}
