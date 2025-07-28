import '../../network/network_status.dart';
import '../repository/network_repository.dart';

class CheckNetworkStatusUseCase {
  final NetworkRepository _networkRepository;

  CheckNetworkStatusUseCase({required NetworkRepository networkRepository})
    : _networkRepository = networkRepository;

  Future<NetworkStatus> execute() async {
    return await _networkRepository.getNetworkStatus();
  }
}