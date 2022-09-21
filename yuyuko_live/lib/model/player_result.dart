import 'package:freezed_annotation/freezed_annotation.dart';

part 'player_result.freezed.dart';
part 'player_result.g.dart';

@freezed
abstract class PlayerResult with _$PlayerResult {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory PlayerResult({
    required String nickname,
    required int accountId,
  }) = _PlayerResult;

  factory PlayerResult.fromJson(Map<String, dynamic> json) =>
      _$PlayerResultFromJson(json);
}
