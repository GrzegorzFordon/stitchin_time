// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pattern_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PatternModel {

 Map<String, PixelModel> get pixelMap;
/// Create a copy of PatternModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PatternModelCopyWith<PatternModel> get copyWith => _$PatternModelCopyWithImpl<PatternModel>(this as PatternModel, _$identity);

  /// Serializes this PatternModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PatternModel&&const DeepCollectionEquality().equals(other.pixelMap, pixelMap));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(pixelMap));

@override
String toString() {
  return 'PatternModel(pixelMap: $pixelMap)';
}


}

/// @nodoc
abstract mixin class $PatternModelCopyWith<$Res>  {
  factory $PatternModelCopyWith(PatternModel value, $Res Function(PatternModel) _then) = _$PatternModelCopyWithImpl;
@useResult
$Res call({
 Map<String, PixelModel> pixelMap
});




}
/// @nodoc
class _$PatternModelCopyWithImpl<$Res>
    implements $PatternModelCopyWith<$Res> {
  _$PatternModelCopyWithImpl(this._self, this._then);

  final PatternModel _self;
  final $Res Function(PatternModel) _then;

/// Create a copy of PatternModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? pixelMap = null,}) {
  return _then(_self.copyWith(
pixelMap: null == pixelMap ? _self.pixelMap : pixelMap // ignore: cast_nullable_to_non_nullable
as Map<String, PixelModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [PatternModel].
extension PatternModelPatterns on PatternModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PatternModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PatternModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PatternModel value)  $default,){
final _that = this;
switch (_that) {
case _PatternModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PatternModel value)?  $default,){
final _that = this;
switch (_that) {
case _PatternModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Map<String, PixelModel> pixelMap)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PatternModel() when $default != null:
return $default(_that.pixelMap);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Map<String, PixelModel> pixelMap)  $default,) {final _that = this;
switch (_that) {
case _PatternModel():
return $default(_that.pixelMap);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Map<String, PixelModel> pixelMap)?  $default,) {final _that = this;
switch (_that) {
case _PatternModel() when $default != null:
return $default(_that.pixelMap);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PatternModel extends PatternModel {
  const _PatternModel({this.pixelMap = const {}}): super._();
  factory _PatternModel.fromJson(Map<String, dynamic> json) => _$PatternModelFromJson(json);

@override@JsonKey() final  Map<String, PixelModel> pixelMap;

/// Create a copy of PatternModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PatternModelCopyWith<_PatternModel> get copyWith => __$PatternModelCopyWithImpl<_PatternModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PatternModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PatternModel&&const DeepCollectionEquality().equals(other.pixelMap, pixelMap));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(pixelMap));

@override
String toString() {
  return 'PatternModel(pixelMap: $pixelMap)';
}


}

/// @nodoc
abstract mixin class _$PatternModelCopyWith<$Res> implements $PatternModelCopyWith<$Res> {
  factory _$PatternModelCopyWith(_PatternModel value, $Res Function(_PatternModel) _then) = __$PatternModelCopyWithImpl;
@override @useResult
$Res call({
 Map<String, PixelModel> pixelMap
});




}
/// @nodoc
class __$PatternModelCopyWithImpl<$Res>
    implements _$PatternModelCopyWith<$Res> {
  __$PatternModelCopyWithImpl(this._self, this._then);

  final _PatternModel _self;
  final $Res Function(_PatternModel) _then;

/// Create a copy of PatternModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? pixelMap = null,}) {
  return _then(_PatternModel(
pixelMap: null == pixelMap ? _self.pixelMap : pixelMap // ignore: cast_nullable_to_non_nullable
as Map<String, PixelModel>,
  ));
}


}

// dart format on
