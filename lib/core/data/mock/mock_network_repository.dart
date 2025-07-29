import 'package:flutter_recipe_app/core/domain/repository/network_repository.dart';
import 'package:flutter_recipe_app/core/network/network_status.dart';

class MockNetworkRepository implements NetworkRepository {
  final bool isConnected;

  MockNetworkRepository({this.isConnected = true});

  @override
  Future<NetworkStatus> getNetworkStatus() async {
    return isConnected ? NetworkStatus.connected : NetworkStatus.disconnected;
  }
}