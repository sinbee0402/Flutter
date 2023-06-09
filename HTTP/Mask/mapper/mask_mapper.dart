// 기능 확장(상속) extends
import 'package:dart_basic/homework/HTTP/Mask/dto/mask_info_dto.dart';
import 'package:dart_basic/homework/HTTP/Mask/model/mask.dart';

// 확장 함수
// MaskInfDto 에다가 기능 추가
extension ToMaskInfoResult on MaskInfoDto {
  Mask toMaskInfoResult() {
    final result = Mask(
      count: count ?? 0,
      stores: stores
              ?.where((e) =>
                  e.createdAt != null &&
                  e.remainStat != null &&
                  e.stockAt != null)
              .map((e) => Store(
                  addr: e.addr ?? '',
                  code: e.code ?? '',
                  createdAt: e.createdAt ?? '',
                  lat: e.lat?.toDouble() ?? 0.0,
                  lng: e.lng?.toDouble() ?? 0.0,
                  name: e.name ?? '',
                  remainStat: e.remainStat ?? '',
                  stockAt: e.stockAt ?? '',
                  type: e.type ?? ''))
              .toList() ??
          [],
    );
    return result;
  }
}
