import 'dart:convert';

import 'package:logging/logging.dart';
import 'package:yuyuko_live/core/store/store_interface.dart';
import 'package:yuyuko_live/model/ship_information.dart';
import 'package:yuyuko_live/service/yuyuko_service.dart';

const String _lastFetchedDateKey = 'yuyuko:lastFetchedDate';
const String _shipInfoKey = 'yuyuko:shipInfo';

class GameRepository {
  final _logger = Logger('GameRepository');
  static final instance = GameRepository._init();
  GameRepository._init();

  late final StoreInterface _store;
  Map<String, ShipInformation>? _info;

  void initialise(StoreInterface store) {
    _store = store;
  }

  Future<bool> loadShipData() async {
    try {
      var fetchRemote = false;
      final lastFetchedDate = _store.get(_lastFetchedDateKey) as String?;
      if (lastFetchedDate == null) {
        fetchRemote = true;
      } else {
        final lastFetched = DateTime.tryParse(lastFetchedDate);
        if (lastFetched == null) {
          fetchRemote = true;
        } else {
          final now = DateTime.now();
          if (now.difference(lastFetched).inDays >= 7) {
            fetchRemote = true;
          }
        }
      }
      _logger.info('fetchRemote: $fetchRemote');

      if (fetchRemote) {
        // load from remote
        final service = YuyukoService();
        final remoteData = await service.getAllShipInfo();
        final shipData = remoteData.data;
        if (shipData == null) {
          assert(false, 'Failed to load ship data from remote');
          return false;
        }
        _info = _convertToMap(shipData);

        final encoded = jsonEncode(shipData);
        final success = await _store.set(_shipInfoKey, encoded);
        if (!success) {
          assert(false, 'Failed to save ship data to local');
          return false;
        }
        await _store.set(_lastFetchedDateKey, DateTime.now().toIso8601String());

        _logger.info('Loaded ship data from remote');
        return true;
      } else {
        // read from local
        final shipData = _store.get(_shipInfoKey);
        if (shipData == null) {
          assert(false, 'Failed to load ship data from local');
          return false;
        }

        final decoded = jsonDecode(shipData as String) as List;
        final shipInfo =
            decoded.map((e) => ShipInformation.fromJson(e)).toList();
        _info = _convertToMap(shipInfo);

        _logger.info('Loaded ship data from local');
        return true;
      }
    } catch (e, s) {
      _logger.severe('Failed to load ship data $e $s');
      return false;
    }
  }

  Map<String, ShipInformation> _convertToMap(List<ShipInformation> info) {
    final map = <String, ShipInformation>{};
    for (final ship in info) {
      final id = ship.shipId?.toString();
      if (id == null) {
        assert(false, 'broken entry in ShipInformation');
        continue;
      }

      map[id] = ship;
    }

    return map;
  }

  ShipInformation? getShipInfo(String? id) {
    if (id == null) return null;
    final ship = _info?[id];
    if (ship == null) {
      _logger.severe('Failed to find ship info for $id');
    }

    return ship;
  }

  ShipPRData? getPRData(String? id) {
    if (id == null) return null;
    final info = _info?[id]?.data;
    if (info == null) {
      _logger.severe('Failed to get PR data for $id');
    }

    return info;
  }
}
