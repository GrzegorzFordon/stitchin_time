// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'canvas_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CanvasModel {

 ToolInfoModel get toolInfo; GridInfoModel get gridInfo; ZoomInfoModel get zoomInfo; PatternModel get phantomPixels; double get fontSize; bool get symmetryHorizontal; bool get symmetryVertical; int get overpaintAmount; dynamic get showSettings;
/// Create a copy of CanvasModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CanvasModelCopyWith<CanvasModel> get copyWith => _$CanvasModelCopyWithImpl<CanvasModel>(this as CanvasModel, _$identity);

  /// Serializes this CanvasModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CanvasModel&&(identical(other.toolInfo, toolInfo) || other.toolInfo == toolInfo)&&(identical(other.gridInfo, gridInfo) || other.gridInfo == gridInfo)&&(identical(other.zoomInfo, zoomInfo) || other.zoomInfo == zoomInfo)&&(identical(other.phantomPixels, phantomPixels) || other.phantomPixels == phantomPixels)&&(identical(other.fontSize, fontSize) || other.fontSize == fontSize)&&(identical(other.symmetryHorizontal, symmetryHorizontal) || other.symmetryHorizontal == symmetryHorizontal)&&(identical(other.symmetryVertical, symmetryVertical) || other.symmetryVertical == symmetryVertical)&&(identical(other.overpaintAmount, overpaintAmount) || other.overpaintAmount == overpaintAmount)&&const DeepCollectionEquality().equals(other.showSettings, showSettings));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,toolInfo,gridInfo,zoomInfo,phantomPixels,fontSize,symmetryHorizontal,symmetryVertical,overpaintAmount,const DeepCollectionEquality().hash(showSettings));

@override
String toString() {
  return 'CanvasModel(toolInfo: $toolInfo, gridInfo: $gridInfo, zoomInfo: $zoomInfo, phantomPixels: $phantomPixels, fontSize: $fontSize, symmetryHorizontal: $symmetryHorizontal, symmetryVertical: $symmetryVertical, overpaintAmount: $overpaintAmount, showSettings: $showSettings)';
}


}

/// @nodoc
abstract mixin class $CanvasModelCopyWith<$Res>  {
  factory $CanvasModelCopyWith(CanvasModel value, $Res Function(CanvasModel) _then) = _$CanvasModelCopyWithImpl;
@useResult
$Res call({
 ToolInfoModel toolInfo, GridInfoModel gridInfo, ZoomInfoModel zoomInfo, PatternModel phantomPixels, double fontSize, bool symmetryHorizontal, bool symmetryVertical, int overpaintAmount, dynamic showSettings
});


$ToolInfoModelCopyWith<$Res> get toolInfo;$GridInfoModelCopyWith<$Res> get gridInfo;$ZoomInfoModelCopyWith<$Res> get zoomInfo;$PatternModelCopyWith<$Res> get phantomPixels;

}
/// @nodoc
class _$CanvasModelCopyWithImpl<$Res>
    implements $CanvasModelCopyWith<$Res> {
  _$CanvasModelCopyWithImpl(this._self, this._then);

  final CanvasModel _self;
  final $Res Function(CanvasModel) _then;

/// Create a copy of CanvasModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? toolInfo = null,Object? gridInfo = null,Object? zoomInfo = null,Object? phantomPixels = null,Object? fontSize = null,Object? symmetryHorizontal = null,Object? symmetryVertical = null,Object? overpaintAmount = null,Object? showSettings = freezed,}) {
  return _then(_self.copyWith(
toolInfo: null == toolInfo ? _self.toolInfo : toolInfo // ignore: cast_nullable_to_non_nullable
as ToolInfoModel,gridInfo: null == gridInfo ? _self.gridInfo : gridInfo // ignore: cast_nullable_to_non_nullable
as GridInfoModel,zoomInfo: null == zoomInfo ? _self.zoomInfo : zoomInfo // ignore: cast_nullable_to_non_nullable
as ZoomInfoModel,phantomPixels: null == phantomPixels ? _self.phantomPixels : phantomPixels // ignore: cast_nullable_to_non_nullable
as PatternModel,fontSize: null == fontSize ? _self.fontSize : fontSize // ignore: cast_nullable_to_non_nullable
as double,symmetryHorizontal: null == symmetryHorizontal ? _self.symmetryHorizontal : symmetryHorizontal // ignore: cast_nullable_to_non_nullable
as bool,symmetryVertical: null == symmetryVertical ? _self.symmetryVertical : symmetryVertical // ignore: cast_nullable_to_non_nullable
as bool,overpaintAmount: null == overpaintAmount ? _self.overpaintAmount : overpaintAmount // ignore: cast_nullable_to_non_nullable
as int,showSettings: freezed == showSettings ? _self.showSettings : showSettings // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}
/// Create a copy of CanvasModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ToolInfoModelCopyWith<$Res> get toolInfo {
  
  return $ToolInfoModelCopyWith<$Res>(_self.toolInfo, (value) {
    return _then(_self.copyWith(toolInfo: value));
  });
}/// Create a copy of CanvasModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GridInfoModelCopyWith<$Res> get gridInfo {
  
  return $GridInfoModelCopyWith<$Res>(_self.gridInfo, (value) {
    return _then(_self.copyWith(gridInfo: value));
  });
}/// Create a copy of CanvasModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ZoomInfoModelCopyWith<$Res> get zoomInfo {
  
  return $ZoomInfoModelCopyWith<$Res>(_self.zoomInfo, (value) {
    return _then(_self.copyWith(zoomInfo: value));
  });
}/// Create a copy of CanvasModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PatternModelCopyWith<$Res> get phantomPixels {
  
  return $PatternModelCopyWith<$Res>(_self.phantomPixels, (value) {
    return _then(_self.copyWith(phantomPixels: value));
  });
}
}


/// Adds pattern-matching-related methods to [CanvasModel].
extension CanvasModelPatterns on CanvasModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CanvasModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CanvasModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CanvasModel value)  $default,){
final _that = this;
switch (_that) {
case _CanvasModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CanvasModel value)?  $default,){
final _that = this;
switch (_that) {
case _CanvasModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ToolInfoModel toolInfo,  GridInfoModel gridInfo,  ZoomInfoModel zoomInfo,  PatternModel phantomPixels,  double fontSize,  bool symmetryHorizontal,  bool symmetryVertical,  int overpaintAmount,  dynamic showSettings)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CanvasModel() when $default != null:
return $default(_that.toolInfo,_that.gridInfo,_that.zoomInfo,_that.phantomPixels,_that.fontSize,_that.symmetryHorizontal,_that.symmetryVertical,_that.overpaintAmount,_that.showSettings);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ToolInfoModel toolInfo,  GridInfoModel gridInfo,  ZoomInfoModel zoomInfo,  PatternModel phantomPixels,  double fontSize,  bool symmetryHorizontal,  bool symmetryVertical,  int overpaintAmount,  dynamic showSettings)  $default,) {final _that = this;
switch (_that) {
case _CanvasModel():
return $default(_that.toolInfo,_that.gridInfo,_that.zoomInfo,_that.phantomPixels,_that.fontSize,_that.symmetryHorizontal,_that.symmetryVertical,_that.overpaintAmount,_that.showSettings);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ToolInfoModel toolInfo,  GridInfoModel gridInfo,  ZoomInfoModel zoomInfo,  PatternModel phantomPixels,  double fontSize,  bool symmetryHorizontal,  bool symmetryVertical,  int overpaintAmount,  dynamic showSettings)?  $default,) {final _that = this;
switch (_that) {
case _CanvasModel() when $default != null:
return $default(_that.toolInfo,_that.gridInfo,_that.zoomInfo,_that.phantomPixels,_that.fontSize,_that.symmetryHorizontal,_that.symmetryVertical,_that.overpaintAmount,_that.showSettings);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CanvasModel extends CanvasModel {
  const _CanvasModel({this.toolInfo = const ToolInfoModel(), this.gridInfo = const GridInfoModel(), this.zoomInfo = const ZoomInfoModel(), this.phantomPixels = const PatternModel(), this.fontSize = 0.3, this.symmetryHorizontal = false, this.symmetryVertical = false, this.overpaintAmount = 0, this.showSettings = false}): super._();
  factory _CanvasModel.fromJson(Map<String, dynamic> json) => _$CanvasModelFromJson(json);

@override@JsonKey() final  ToolInfoModel toolInfo;
@override@JsonKey() final  GridInfoModel gridInfo;
@override@JsonKey() final  ZoomInfoModel zoomInfo;
@override@JsonKey() final  PatternModel phantomPixels;
@override@JsonKey() final  double fontSize;
@override@JsonKey() final  bool symmetryHorizontal;
@override@JsonKey() final  bool symmetryVertical;
@override@JsonKey() final  int overpaintAmount;
@override@JsonKey() final  dynamic showSettings;

/// Create a copy of CanvasModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CanvasModelCopyWith<_CanvasModel> get copyWith => __$CanvasModelCopyWithImpl<_CanvasModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CanvasModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CanvasModel&&(identical(other.toolInfo, toolInfo) || other.toolInfo == toolInfo)&&(identical(other.gridInfo, gridInfo) || other.gridInfo == gridInfo)&&(identical(other.zoomInfo, zoomInfo) || other.zoomInfo == zoomInfo)&&(identical(other.phantomPixels, phantomPixels) || other.phantomPixels == phantomPixels)&&(identical(other.fontSize, fontSize) || other.fontSize == fontSize)&&(identical(other.symmetryHorizontal, symmetryHorizontal) || other.symmetryHorizontal == symmetryHorizontal)&&(identical(other.symmetryVertical, symmetryVertical) || other.symmetryVertical == symmetryVertical)&&(identical(other.overpaintAmount, overpaintAmount) || other.overpaintAmount == overpaintAmount)&&const DeepCollectionEquality().equals(other.showSettings, showSettings));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,toolInfo,gridInfo,zoomInfo,phantomPixels,fontSize,symmetryHorizontal,symmetryVertical,overpaintAmount,const DeepCollectionEquality().hash(showSettings));

@override
String toString() {
  return 'CanvasModel(toolInfo: $toolInfo, gridInfo: $gridInfo, zoomInfo: $zoomInfo, phantomPixels: $phantomPixels, fontSize: $fontSize, symmetryHorizontal: $symmetryHorizontal, symmetryVertical: $symmetryVertical, overpaintAmount: $overpaintAmount, showSettings: $showSettings)';
}


}

/// @nodoc
abstract mixin class _$CanvasModelCopyWith<$Res> implements $CanvasModelCopyWith<$Res> {
  factory _$CanvasModelCopyWith(_CanvasModel value, $Res Function(_CanvasModel) _then) = __$CanvasModelCopyWithImpl;
@override @useResult
$Res call({
 ToolInfoModel toolInfo, GridInfoModel gridInfo, ZoomInfoModel zoomInfo, PatternModel phantomPixels, double fontSize, bool symmetryHorizontal, bool symmetryVertical, int overpaintAmount, dynamic showSettings
});


@override $ToolInfoModelCopyWith<$Res> get toolInfo;@override $GridInfoModelCopyWith<$Res> get gridInfo;@override $ZoomInfoModelCopyWith<$Res> get zoomInfo;@override $PatternModelCopyWith<$Res> get phantomPixels;

}
/// @nodoc
class __$CanvasModelCopyWithImpl<$Res>
    implements _$CanvasModelCopyWith<$Res> {
  __$CanvasModelCopyWithImpl(this._self, this._then);

  final _CanvasModel _self;
  final $Res Function(_CanvasModel) _then;

/// Create a copy of CanvasModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? toolInfo = null,Object? gridInfo = null,Object? zoomInfo = null,Object? phantomPixels = null,Object? fontSize = null,Object? symmetryHorizontal = null,Object? symmetryVertical = null,Object? overpaintAmount = null,Object? showSettings = freezed,}) {
  return _then(_CanvasModel(
toolInfo: null == toolInfo ? _self.toolInfo : toolInfo // ignore: cast_nullable_to_non_nullable
as ToolInfoModel,gridInfo: null == gridInfo ? _self.gridInfo : gridInfo // ignore: cast_nullable_to_non_nullable
as GridInfoModel,zoomInfo: null == zoomInfo ? _self.zoomInfo : zoomInfo // ignore: cast_nullable_to_non_nullable
as ZoomInfoModel,phantomPixels: null == phantomPixels ? _self.phantomPixels : phantomPixels // ignore: cast_nullable_to_non_nullable
as PatternModel,fontSize: null == fontSize ? _self.fontSize : fontSize // ignore: cast_nullable_to_non_nullable
as double,symmetryHorizontal: null == symmetryHorizontal ? _self.symmetryHorizontal : symmetryHorizontal // ignore: cast_nullable_to_non_nullable
as bool,symmetryVertical: null == symmetryVertical ? _self.symmetryVertical : symmetryVertical // ignore: cast_nullable_to_non_nullable
as bool,overpaintAmount: null == overpaintAmount ? _self.overpaintAmount : overpaintAmount // ignore: cast_nullable_to_non_nullable
as int,showSettings: freezed == showSettings ? _self.showSettings : showSettings // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}

/// Create a copy of CanvasModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ToolInfoModelCopyWith<$Res> get toolInfo {
  
  return $ToolInfoModelCopyWith<$Res>(_self.toolInfo, (value) {
    return _then(_self.copyWith(toolInfo: value));
  });
}/// Create a copy of CanvasModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GridInfoModelCopyWith<$Res> get gridInfo {
  
  return $GridInfoModelCopyWith<$Res>(_self.gridInfo, (value) {
    return _then(_self.copyWith(gridInfo: value));
  });
}/// Create a copy of CanvasModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ZoomInfoModelCopyWith<$Res> get zoomInfo {
  
  return $ZoomInfoModelCopyWith<$Res>(_self.zoomInfo, (value) {
    return _then(_self.copyWith(zoomInfo: value));
  });
}/// Create a copy of CanvasModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PatternModelCopyWith<$Res> get phantomPixels {
  
  return $PatternModelCopyWith<$Res>(_self.phantomPixels, (value) {
    return _then(_self.copyWith(phantomPixels: value));
  });
}
}

// dart format on
