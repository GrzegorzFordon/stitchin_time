// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'zoom_info_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ZoomInfoModel {

 List<double> get zoomStepsDiscrete; int get zoomIndexDiscrete; double get zoomFreeIndex; double get zoomValue;
/// Create a copy of ZoomInfoModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ZoomInfoModelCopyWith<ZoomInfoModel> get copyWith => _$ZoomInfoModelCopyWithImpl<ZoomInfoModel>(this as ZoomInfoModel, _$identity);

  /// Serializes this ZoomInfoModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ZoomInfoModel&&const DeepCollectionEquality().equals(other.zoomStepsDiscrete, zoomStepsDiscrete)&&(identical(other.zoomIndexDiscrete, zoomIndexDiscrete) || other.zoomIndexDiscrete == zoomIndexDiscrete)&&(identical(other.zoomFreeIndex, zoomFreeIndex) || other.zoomFreeIndex == zoomFreeIndex)&&(identical(other.zoomValue, zoomValue) || other.zoomValue == zoomValue));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(zoomStepsDiscrete),zoomIndexDiscrete,zoomFreeIndex,zoomValue);

@override
String toString() {
  return 'ZoomInfoModel(zoomStepsDiscrete: $zoomStepsDiscrete, zoomIndexDiscrete: $zoomIndexDiscrete, zoomFreeIndex: $zoomFreeIndex, zoomValue: $zoomValue)';
}


}

/// @nodoc
abstract mixin class $ZoomInfoModelCopyWith<$Res>  {
  factory $ZoomInfoModelCopyWith(ZoomInfoModel value, $Res Function(ZoomInfoModel) _then) = _$ZoomInfoModelCopyWithImpl;
@useResult
$Res call({
 List<double> zoomStepsDiscrete, int zoomIndexDiscrete, double zoomFreeIndex, double zoomValue
});




}
/// @nodoc
class _$ZoomInfoModelCopyWithImpl<$Res>
    implements $ZoomInfoModelCopyWith<$Res> {
  _$ZoomInfoModelCopyWithImpl(this._self, this._then);

  final ZoomInfoModel _self;
  final $Res Function(ZoomInfoModel) _then;

/// Create a copy of ZoomInfoModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? zoomStepsDiscrete = null,Object? zoomIndexDiscrete = null,Object? zoomFreeIndex = null,Object? zoomValue = null,}) {
  return _then(_self.copyWith(
zoomStepsDiscrete: null == zoomStepsDiscrete ? _self.zoomStepsDiscrete : zoomStepsDiscrete // ignore: cast_nullable_to_non_nullable
as List<double>,zoomIndexDiscrete: null == zoomIndexDiscrete ? _self.zoomIndexDiscrete : zoomIndexDiscrete // ignore: cast_nullable_to_non_nullable
as int,zoomFreeIndex: null == zoomFreeIndex ? _self.zoomFreeIndex : zoomFreeIndex // ignore: cast_nullable_to_non_nullable
as double,zoomValue: null == zoomValue ? _self.zoomValue : zoomValue // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [ZoomInfoModel].
extension ZoomInfoModelPatterns on ZoomInfoModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ZoomInfoModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ZoomInfoModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ZoomInfoModel value)  $default,){
final _that = this;
switch (_that) {
case _ZoomInfoModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ZoomInfoModel value)?  $default,){
final _that = this;
switch (_that) {
case _ZoomInfoModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<double> zoomStepsDiscrete,  int zoomIndexDiscrete,  double zoomFreeIndex,  double zoomValue)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ZoomInfoModel() when $default != null:
return $default(_that.zoomStepsDiscrete,_that.zoomIndexDiscrete,_that.zoomFreeIndex,_that.zoomValue);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<double> zoomStepsDiscrete,  int zoomIndexDiscrete,  double zoomFreeIndex,  double zoomValue)  $default,) {final _that = this;
switch (_that) {
case _ZoomInfoModel():
return $default(_that.zoomStepsDiscrete,_that.zoomIndexDiscrete,_that.zoomFreeIndex,_that.zoomValue);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<double> zoomStepsDiscrete,  int zoomIndexDiscrete,  double zoomFreeIndex,  double zoomValue)?  $default,) {final _that = this;
switch (_that) {
case _ZoomInfoModel() when $default != null:
return $default(_that.zoomStepsDiscrete,_that.zoomIndexDiscrete,_that.zoomFreeIndex,_that.zoomValue);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ZoomInfoModel extends ZoomInfoModel {
  const _ZoomInfoModel({final  List<double> zoomStepsDiscrete = const [0.125, 0.167, 0.25, 0.33, 0.5, 0.66, 1.0, 1.33, 2.0, 2.66, 4.0, 5.33, 8.0], this.zoomIndexDiscrete = 6, this.zoomFreeIndex = 0.5, this.zoomValue = 1.0}): _zoomStepsDiscrete = zoomStepsDiscrete,super._();
  factory _ZoomInfoModel.fromJson(Map<String, dynamic> json) => _$ZoomInfoModelFromJson(json);

 final  List<double> _zoomStepsDiscrete;
@override@JsonKey() List<double> get zoomStepsDiscrete {
  if (_zoomStepsDiscrete is EqualUnmodifiableListView) return _zoomStepsDiscrete;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_zoomStepsDiscrete);
}

@override@JsonKey() final  int zoomIndexDiscrete;
@override@JsonKey() final  double zoomFreeIndex;
@override@JsonKey() final  double zoomValue;

/// Create a copy of ZoomInfoModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ZoomInfoModelCopyWith<_ZoomInfoModel> get copyWith => __$ZoomInfoModelCopyWithImpl<_ZoomInfoModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ZoomInfoModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ZoomInfoModel&&const DeepCollectionEquality().equals(other._zoomStepsDiscrete, _zoomStepsDiscrete)&&(identical(other.zoomIndexDiscrete, zoomIndexDiscrete) || other.zoomIndexDiscrete == zoomIndexDiscrete)&&(identical(other.zoomFreeIndex, zoomFreeIndex) || other.zoomFreeIndex == zoomFreeIndex)&&(identical(other.zoomValue, zoomValue) || other.zoomValue == zoomValue));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_zoomStepsDiscrete),zoomIndexDiscrete,zoomFreeIndex,zoomValue);

@override
String toString() {
  return 'ZoomInfoModel(zoomStepsDiscrete: $zoomStepsDiscrete, zoomIndexDiscrete: $zoomIndexDiscrete, zoomFreeIndex: $zoomFreeIndex, zoomValue: $zoomValue)';
}


}

/// @nodoc
abstract mixin class _$ZoomInfoModelCopyWith<$Res> implements $ZoomInfoModelCopyWith<$Res> {
  factory _$ZoomInfoModelCopyWith(_ZoomInfoModel value, $Res Function(_ZoomInfoModel) _then) = __$ZoomInfoModelCopyWithImpl;
@override @useResult
$Res call({
 List<double> zoomStepsDiscrete, int zoomIndexDiscrete, double zoomFreeIndex, double zoomValue
});




}
/// @nodoc
class __$ZoomInfoModelCopyWithImpl<$Res>
    implements _$ZoomInfoModelCopyWith<$Res> {
  __$ZoomInfoModelCopyWithImpl(this._self, this._then);

  final _ZoomInfoModel _self;
  final $Res Function(_ZoomInfoModel) _then;

/// Create a copy of ZoomInfoModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? zoomStepsDiscrete = null,Object? zoomIndexDiscrete = null,Object? zoomFreeIndex = null,Object? zoomValue = null,}) {
  return _then(_ZoomInfoModel(
zoomStepsDiscrete: null == zoomStepsDiscrete ? _self._zoomStepsDiscrete : zoomStepsDiscrete // ignore: cast_nullable_to_non_nullable
as List<double>,zoomIndexDiscrete: null == zoomIndexDiscrete ? _self.zoomIndexDiscrete : zoomIndexDiscrete // ignore: cast_nullable_to_non_nullable
as int,zoomFreeIndex: null == zoomFreeIndex ? _self.zoomFreeIndex : zoomFreeIndex // ignore: cast_nullable_to_non_nullable
as double,zoomValue: null == zoomValue ? _self.zoomValue : zoomValue // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
