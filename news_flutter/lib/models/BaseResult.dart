import 'package:json_annotation/json_annotation.dart';

part 'BaseResult.g.dart';

@JsonSerializable()
class BaseResult {
    BaseResult(this.data, this.status, this.message);

    var data;
    int status;
    String message;
    
    factory BaseResult.fromJson(Map<String,dynamic> json) => _$BaseResultFromJson(json);
    Map<String, dynamic> toJson() => _$BaseResultToJson(this);
}
