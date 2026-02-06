// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'swatch_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SwatchModel {

 dynamic get hue; dynamic get sat; dynamic get val;
/// Create a copy of SwatchModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SwatchModelCopyWith<SwatchModel> get copyWith => _$SwatchModelCopyWithImpl<SwatchModel>(this as SwatchModel, _$identity);

  /// Serializes this SwatchModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SwatchModel&&const DeepCollectionEquality().equals(other.hue, hue)&&const DeepCollectionEquality().equals(other.sat, sat)&&const DeepCollectionEquality().equals(other.val, val));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(hue),const DeepCollectionEquality().hash(sat),const DeepCollectionEquality().hash(val));

@override
String toString() {
  return 'SwatchModel(hue: $hue, sat: $sat, val: $val)';
}


}

/// @nodoc
abstract mixin class $SwatchModelCopyWith<$Res>  {
  factory $SwatchModelCopyWith(SwatchModel value, $Res Function(SwatchModel) _then) = _$SwatchModelCopyWithImpl;
@useResult
$Res call({
 dynamic hue, dynamic sat, dynamic val
});




}
/// @nodoc
class _$SwatchModelCopyWithImpl<$Res>
    implements $SwatchModelCopyWith<$Res> {
  _$SwatchModelCopyWithImpl(this._self, this._then);

  final SwatchModel _self;
  final $Res Function(SwatchModel) _then;

/// Create a copy of SwatchModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? hue = freezed,Object? sat = freezed,Object? val = freezed,}) {
  return _then(_self.copyWith(
hue: freezed == hue ? _self.hue : hue // ignore: cast_nullable_to_non_nullable
as dynamic,sat: freezed == sat ? _self.sat : sat // ignore: cast_nullable_to_non_nullable
as dynamic,val: freezed == val ? _self.val : val // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}

}


/// Adds pattern-matching-related methods to [SwatchModel].
extension SwatchModelPatterns on SwatchModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SwatchModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SwatchModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SwatchModel value)  $default,){
final _that = this;
switch (_that) {
case _SwatchModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SwatchModel value)?  $default,){
final _that = this;
switch (_that) {
case _SwatchModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( dynamic hue,  dynamic sat,  dynamic val)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SwatchModel() when $default != null:
return $default(_that.hue,_that.sat,_that.val);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( dynamic hue,  dynamic sat,  dynamic val)  $default,) {final _that = this;
switch (_that) {
case _SwatchModel():
return $default(_that.hue,_that.sat,_that.val);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( dynamic hue,  dynamic sat,  dynamic val)?  $default,) {final _that = this;
switch (_that) {
case _SwatchModel() when $default != null:
return $default(_that.hue,_that.sat,_that.val);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SwatchModel extends SwatchModel {
  const _SwatchModel({this.hue = 0.0, this.sat = 0.3, this.val = 0.3}): super._();
  factory _SwatchModel.fromJson(Map<String, dynamic> json) => _$SwatchModelFromJson(json);

@override@JsonKey() final  dynamic hue;
@override@JsonKey() final  dynamic sat;
@override@JsonKey() final  dynamic val;

/// Create a copy of SwatchModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SwatchModelCopyWith<_SwatchModel> get copyWith => __$SwatchModelCopyWithImpl<_SwatchModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SwatchModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SwatchModel&&const DeepCollectionEquality().equals(other.hue, hue)&&const DeepCollectionEquality().equals(other.sat, sat)&&const DeepCollectionEquality().equals(other.val, val));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(hue),const DeepCollectionEquality().hash(sat),const DeepCollectionEquality().hash(val));

@override
String toString() {
  return 'SwatchModel(hue: $hue, sat: $sat, val: $val)';
}


}

/// @nodoc
abstract mixin class _$SwatchModelCopyWith<$Res> implements $SwatchModelCopyWith<$Res> {
  factory _$SwatchModelCopyWith(_SwatchModel value, $Res Function(_SwatchModel) _then) = __$SwatchModelCopyWithImpl;
@override @useResult
$Res call({
 dynamic hue, dynamic sat, dynamic val
});




}
/// @nodoc
class __$SwatchModelCopyWithImpl<$Res>
    implements _$SwatchModelCopyWith<$Res> {
  __$SwatchModelCopyWithImpl(this._self, this._then);

  final _SwatchModel _self;
  final $Res Function(_SwatchModel) _then;

/// Create a copy of SwatchModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? hue = freezed,Object? sat = freezed,Object? val = freezed,}) {
  return _then(_SwatchModel(
hue: freezed == hue ? _self.hue : hue // ignore: cast_nullable_to_non_nullable
as dynamic,sat: freezed == sat ? _self.sat : sat // ignore: cast_nullable_to_non_nullable
as dynamic,val: freezed == val ? _self.val : val // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}


}

// dart format on
