// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'view_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ViewModel _$ViewModelFromJson(Map<String, dynamic> json) => _ViewModel(
  activeRow: (json['activeRow'] as num?)?.toInt() ?? 0,
  activeCol: (json['activeCol'] as num?)?.toInt() ?? 0,
  startAtBottom: json['startAtBottom'] as bool? ?? true,
  isLeftToRight: json['isLeftToRight'] as bool? ?? false,
  isZigZag: json['isZigZag'] as bool? ?? false,
  fallOff: (json['fallOff'] as num?)?.toInt() ?? 25,
  maxBlockLength: (json['maxBlockLength'] as num?)?.toInt() ?? 5,
  rowRepeats: (json['rowRepeats'] as num?)?.toInt() ?? 1,
  currentRepeat: (json['currentRepeat'] as num?)?.toInt() ?? 1,
  zoomInfo: json['zoomInfo'] == null
      ? const ZoomInfoModel()
      : ZoomInfoModel.fromJson(json['zoomInfo'] as Map<String, dynamic>),
  showSettings: json['showSettings'] as bool? ?? false,
);

Map<String, dynamic> _$ViewModelToJson(_ViewModel instance) =>
    <String, dynamic>{
      'activeRow': instance.activeRow,
      'activeCol': instance.activeCol,
      'startAtBottom': instance.startAtBottom,
      'isLeftToRight': instance.isLeftToRight,
      'isZigZag': instance.isZigZag,
      'fallOff': instance.fallOff,
      'maxBlockLength': instance.maxBlockLength,
      'rowRepeats': instance.rowRepeats,
      'currentRepeat': instance.currentRepeat,
      'zoomInfo': instance.zoomInfo,
      'showSettings': instance.showSettings,
    };
