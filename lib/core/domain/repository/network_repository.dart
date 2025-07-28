import 'package:flutter_recipe_app/core/network/network_status.dart';

abstract class NetworkRepository {
  Future<NetworkStatus> getNetworkStatus();
}