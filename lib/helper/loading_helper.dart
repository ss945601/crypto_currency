import 'package:crypto_currency/widgets/loading_widget.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

mixin LoadingHelper {
  Future<void> withLoading(Future<void> Function() action) async {
    EasyLoading.show(indicator: const LoadingWidget(), maskType: EasyLoadingMaskType.clear);
    try {
      await action();
    } finally {
      EasyLoading.dismiss();
    }
  }
}