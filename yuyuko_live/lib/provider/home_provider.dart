import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';
import 'package:yuyuko_live/repository/game_repository.dart';

class _HomeState {
  bool loading = false;
  bool hasError = false;
}

class HomeProvider with ChangeNotifier {
  final _logger = Logger('HomeProvider');
  HomeProvider() {
    _loadData();
  }

  _HomeState _state = _HomeState();
  bool get loading => _state.loading;
  bool get hasError => _state.hasError;

  Future<void> _loadData() async {
    final success = await GameRepository.instance.loadShipData();
    if (success) {
      _state.loading = false;
      _state.hasError = false;
    } else {
      _state.loading = false;
      _state.hasError = true;
    }
  }
}
