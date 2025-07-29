import 'package:flutter_recipe_app/core/domain/repository/network_repository.dart';

import '../../network/network_status.dart';

class NetworkRepositoryImpl implements NetworkRepository {

  final bool isConnected;

  NetworkRepositoryImpl({required this.isConnected});

  @override
  Future<NetworkStatus> getNetworkStatus() async {
    if (isConnected) {
      return NetworkStatus.connected;
    } else {
      return NetworkStatus.disconnected;
    }
  }
}