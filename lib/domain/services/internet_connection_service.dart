import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

class InternetConnectionService extends GetxService {
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription _streamSubscription;

  final RxBool isConnected = false.obs;

  Future<InternetConnectionService> init() async {
    isConnected.value = await _isConnected();
    _listenStream();
    return this;
  }

  Future<bool> _isConnected() async {
    final connectivityResult = await _connectivity.checkConnectivity();

    if (connectivityResult == ConnectivityResult.wifi ||
        connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.vpn ||
        connectivityResult == ConnectivityResult.ethernet) {
      return true;
    } else {
      return false;
    }
  }

  void _listenStream() {
    _streamSubscription = _connectivity.onConnectivityChanged.listen(
      (connectivityResult) {
        if (connectivityResult == ConnectivityResult.wifi ||
            connectivityResult == ConnectivityResult.mobile ||
            connectivityResult == ConnectivityResult.vpn ||
            connectivityResult == ConnectivityResult.ethernet) {
          isConnected.value = true;
        } else {
          isConnected.value = false;
        }
      },
    );
  }

  @override
  void onClose() {
    _streamSubscription.cancel();
    super.onClose();
  }
}
