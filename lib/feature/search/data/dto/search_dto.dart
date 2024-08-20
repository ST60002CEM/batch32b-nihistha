import 'package:json_annotation/json_annotation.dart';
import '../model/search_model.dart';

part 'search_dto.g.dart';

@JsonSerializable()
class SearchDto{
  final bool success;
  @JsonKey(name: 'listings', defaultValue: [])
  final List<SearchModel> data;

  SearchDto({
    required this.success,
    required this.data,
  });

  Map<String, dynamic> toJson() => _$SearchDtoToJson(this);

  factory SearchDto.fromJson(Map<String, dynamic> json) =>
      _$SearchDtoFromJson(json);
}