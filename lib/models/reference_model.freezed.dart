// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reference_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReferenceModel {

 double get posX; double get posY; double get scale; double get opacity; double get rotAngle; String get base64encodedImageString;@BytesConverter() Uint8List? get bytes;@ImageConverter() ui.Image? get refImg;
/// Create a copy of ReferenceModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReferenceModelCopyWith<ReferenceModel> get copyWith => _$ReferenceModelCopyWithImpl<ReferenceModel>(this as ReferenceModel, _$identity);

  /// Serializes this ReferenceModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReferenceModel&&(identical(other.posX, posX) || other.posX == posX)&&(identical(other.posY, posY) || other.posY == posY)&&(identical(other.scale, scale) || other.scale == scale)&&(identical(other.opacity, opacity) || other.opacity == opacity)&&(identical(other.rotAngle, rotAngle) || other.rotAngle == rotAngle)&&(identical(other.base64encodedImageString, base64encodedImageString) || other.base64encodedImageString == base64encodedImageString)&&const DeepCollectionEquality().equals(other.bytes, bytes)&&(identical(other.refImg, refImg) || other.refImg == refImg));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,posX,posY,scale,opacity,rotAngle,base64encodedImageString,const DeepCollectionEquality().hash(bytes),refImg);

@override
String toString() {
  return 'ReferenceModel(posX: $posX, posY: $posY, scale: $scale, opacity: $opacity, rotAngle: $rotAngle, base64encodedImageString: $base64encodedImageString, bytes: $bytes, refImg: $refImg)';
}


}

/// @nodoc
abstract mixin class $ReferenceModelCopyWith<$Res>  {
  factory $ReferenceModelCopyWith(ReferenceModel value, $Res Function(ReferenceModel) _then) = _$ReferenceModelCopyWithImpl;
@useResult
$Res call({
 double posX, double posY, double scale, double opacity, double rotAngle, String base64encodedImageString,@BytesConverter() Uint8List? bytes,@ImageConverter() ui.Image? refImg
});




}
/// @nodoc
class _$ReferenceModelCopyWithImpl<$Res>
    implements $ReferenceModelCopyWith<$Res> {
  _$ReferenceModelCopyWithImpl(this._self, this._then);

  final ReferenceModel _self;
  final $Res Function(ReferenceModel) _then;

/// Create a copy of ReferenceModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? posX = null,Object? posY = null,Object? scale = null,Object? opacity = null,Object? rotAngle = null,Object? base64encodedImageString = null,Object? bytes = freezed,Object? refImg = freezed,}) {
  return _then(_self.copyWith(
posX: null == posX ? _self.posX : posX // ignore: cast_nullable_to_non_nullable
as double,posY: null == posY ? _self.posY : posY // ignore: cast_nullable_to_non_nullable
as double,scale: null == scale ? _self.scale : scale // ignore: cast_nullable_to_non_nullable
as double,opacity: null == opacity ? _self.opacity : opacity // ignore: cast_nullable_to_non_nullable
as double,rotAngle: null == rotAngle ? _self.rotAngle : rotAngle // ignore: cast_nullable_to_non_nullable
as double,base64encodedImageString: null == base64encodedImageString ? _self.base64encodedImageString : base64encodedImageString // ignore: cast_nullable_to_non_nullable
as String,bytes: freezed == bytes ? _self.bytes : bytes // ignore: cast_nullable_to_non_nullable
as Uint8List?,refImg: freezed == refImg ? _self.refImg : refImg // ignore: cast_nullable_to_non_nullable
as ui.Image?,
  ));
}

}


/// Adds pattern-matching-related methods to [ReferenceModel].
extension ReferenceModelPatterns on ReferenceModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReferenceModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReferenceModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReferenceModel value)  $default,){
final _that = this;
switch (_that) {
case _ReferenceModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReferenceModel value)?  $default,){
final _that = this;
switch (_that) {
case _ReferenceModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double posX,  double posY,  double scale,  double opacity,  double rotAngle,  String base64encodedImageString, @BytesConverter()  Uint8List? bytes, @ImageConverter()  ui.Image? refImg)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReferenceModel() when $default != null:
return $default(_that.posX,_that.posY,_that.scale,_that.opacity,_that.rotAngle,_that.base64encodedImageString,_that.bytes,_that.refImg);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double posX,  double posY,  double scale,  double opacity,  double rotAngle,  String base64encodedImageString, @BytesConverter()  Uint8List? bytes, @ImageConverter()  ui.Image? refImg)  $default,) {final _that = this;
switch (_that) {
case _ReferenceModel():
return $default(_that.posX,_that.posY,_that.scale,_that.opacity,_that.rotAngle,_that.base64encodedImageString,_that.bytes,_that.refImg);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double posX,  double posY,  double scale,  double opacity,  double rotAngle,  String base64encodedImageString, @BytesConverter()  Uint8List? bytes, @ImageConverter()  ui.Image? refImg)?  $default,) {final _that = this;
switch (_that) {
case _ReferenceModel() when $default != null:
return $default(_that.posX,_that.posY,_that.scale,_that.opacity,_that.rotAngle,_that.base64encodedImageString,_that.bytes,_that.refImg);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReferenceModel implements ReferenceModel {
  const _ReferenceModel({this.posX = 0.0, this.posY = 0.0, this.scale = 1.0, this.opacity = 0.5, this.rotAngle = 0, this.base64encodedImageString = "", @BytesConverter() this.bytes, @ImageConverter() this.refImg});
  factory _ReferenceModel.fromJson(Map<String, dynamic> json) => _$ReferenceModelFromJson(json);

@override@JsonKey() final  double posX;
@override@JsonKey() final  double posY;
@override@JsonKey() final  double scale;
@override@JsonKey() final  double opacity;
@override@JsonKey() final  double rotAngle;
@override@JsonKey() final  String base64encodedImageString;
@override@BytesConverter() final  Uint8List? bytes;
@override@ImageConverter() final  ui.Image? refImg;

/// Create a copy of ReferenceModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReferenceModelCopyWith<_ReferenceModel> get copyWith => __$ReferenceModelCopyWithImpl<_ReferenceModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReferenceModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReferenceModel&&(identical(other.posX, posX) || other.posX == posX)&&(identical(other.posY, posY) || other.posY == posY)&&(identical(other.scale, scale) || other.scale == scale)&&(identical(other.opacity, opacity) || other.opacity == opacity)&&(identical(other.rotAngle, rotAngle) || other.rotAngle == rotAngle)&&(identical(other.base64encodedImageString, base64encodedImageString) || other.base64encodedImageString == base64encodedImageString)&&const DeepCollectionEquality().equals(other.bytes, bytes)&&(identical(other.refImg, refImg) || other.refImg == refImg));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,posX,posY,scale,opacity,rotAngle,base64encodedImageString,const DeepCollectionEquality().hash(bytes),refImg);

@override
String toString() {
  return 'ReferenceModel(posX: $posX, posY: $posY, scale: $scale, opacity: $opacity, rotAngle: $rotAngle, base64encodedImageString: $base64encodedImageString, bytes: $bytes, refImg: $refImg)';
}


}

/// @nodoc
abstract mixin class _$ReferenceModelCopyWith<$Res> implements $ReferenceModelCopyWith<$Res> {
  factory _$ReferenceModelCopyWith(_ReferenceModel value, $Res Function(_ReferenceModel) _then) = __$ReferenceModelCopyWithImpl;
@override @useResult
$Res call({
 double posX, double posY, double scale, double opacity, double rotAngle, String base64encodedImageString,@BytesConverter() Uint8List? bytes,@ImageConverter() ui.Image? refImg
});




}
/// @nodoc
class __$ReferenceModelCopyWithImpl<$Res>
    implements _$ReferenceModelCopyWith<$Res> {
  __$ReferenceModelCopyWithImpl(this._self, this._then);

  final _ReferenceModel _self;
  final $Res Function(_ReferenceModel) _then;

/// Create a copy of ReferenceModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? posX = null,Object? posY = null,Object? scale = null,Object? opacity = null,Object? rotAngle = null,Object? base64encodedImageString = null,Object? bytes = freezed,Object? refImg = freezed,}) {
  return _then(_ReferenceModel(
posX: null == posX ? _self.posX : posX // ignore: cast_nullable_to_non_nullable
as double,posY: null == posY ? _self.posY : posY // ignore: cast_nullable_to_non_nullable
as double,scale: null == scale ? _self.scale : scale // ignore: cast_nullable_to_non_nullable
as double,opacity: null == opacity ? _self.opacity : opacity // ignore: cast_nullable_to_non_nullable
as double,rotAngle: null == rotAngle ? _self.rotAngle : rotAngle // ignore: cast_nullable_to_non_nullable
as double,base64encodedImageString: null == base64encodedImageString ? _self.base64encodedImageString : base64encodedImageString // ignore: cast_nullable_to_non_nullable
as String,bytes: freezed == bytes ? _self.bytes : bytes // ignore: cast_nullable_to_non_nullable
as Uint8List?,refImg: freezed == refImg ? _self.refImg : refImg // ignore: cast_nullable_to_non_nullable
as ui.Image?,
  ));
}


}

// dart format on
