
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:modul_2_public_api/app/modules/connection/views/no_connection_view.dart';
import 'package:modul_2_public_api/app/modules/home/views/home_view.dart';

class ConnectionController extends GetxController {
  final Connectivity _connectivity = Connectivity();
  @override
  void onInit() {
    super.onInit();
    _connectivity.onConnectivityChanged.listen((connectivityResults) {
// Jika connectivityResults adalah List<ConnectivityResult>, kita ambil hasil pertama
      _updateConnectionStatus(connectivityResults.first);
    });
  }

// Fungsi untuk mengupdate status koneksi
  void _updateConnectionStatus(ConnectivityResult connectivityResult) {
// kondisi dimana aplikasi mendeteksi bawha tidak ada koneksi samasekali
    if (connectivityResult == ConnectivityResult.none) {
      Get.offAll(() => const NoConnectionView());
    } else {
// else merupakan kondisi jika aplikasi terhubung dengan koneksi wifi atau mobile data
      if (Get.currentRoute == '/NoConnectionView') {
        Get.offAll(() => const HomeView());
      }
    }
  }
}