import 'package:freezed_annotation/freezed_annotation.dart';
import 'tags.dart';
import 'teammember.dart';
part 'coindetail.freezed.dart';
part 'coindetail.g.dart';
@freezed
abstract class CoinDetail with _$CoinDetail{
  factory CoinDetail({
    String? id,
    String? symbol,
    String? name,
    String? description,
    bool? is_active,
    int? rank,
    String? type,
    List<Tags>?tags,
    List<TeamMember>?team,
})=_CoinDetail;
  factory CoinDetail.fromJson(Map<String,dynamic> json)=>_$CoinDetailFromJson(json);

}