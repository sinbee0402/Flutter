import 'package:dart_basic/homework/HTTP/Mask/dto/mask_info_dto.dart';
import 'package:dart_basic/homework/HTTP/Mask/model/mask.dart';

import 'mask_api.dart';
import 'mapper/mask_mapper.dart';

// Api -> DTO -> Mapper -> Model

// 로직 (main)
void main() async {
  final api = MaskApi();

  final MaskInfoDto dto = await api.getMaskInfo();
  final Mask model = dto.toMaskInfoResult();

  print(model.stores);
}
