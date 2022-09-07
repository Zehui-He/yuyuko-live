import 'package:logging/logging.dart';
import 'package:yuyuko_live/service/base_service.dart';

import 'key/key.dart' as key;

class WargamingService extends BaseService {
  final _logger = Logger('WargamingService');
  static const _key = key.WARGAMING;

  @override
  // TODO: implement baseUrl
  String get baseUrl => throw UnimplementedError();

  // TODO: implement the rest of the api
}
