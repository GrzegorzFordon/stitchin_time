// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'palette_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PaletteModel {

 List<SwatchModel> get swatches; int get activeSwatchIndex;
/// Create a copy of PaletteModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaletteModelCopyWith<PaletteModel> get copyWith => _$PaletteModelCopyWithImpl<PaletteModel>(this as PaletteModel, _$identity);

  /// Serializes this PaletteModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaletteModel&&const DeepCollectionEquality().equals(other.swatches, swatches)&&(identical(other.activeSwatchIndex, activeSwatchIndex) || other.activeSwatchIndex == activeSwatchIndex));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(swatches),activeSwatchIndex);

@override
String toString() {
  return 'PaletteModel(swatches: $swatches, activeSwatchIndex: $activeSwatchIndex)';
}


}

/// @nodoc
abstract mixin class $PaletteModelCopyWith<$Res>  {
  factory $PaletteModelCopyWith(PaletteModel value, $Res Function(PaletteModel) _then) = _$PaletteModelCopyWithImpl;
@useResult
$Res call({
 List<SwatchModel> swatches, int activeSwatchIndex
});




}
/// @nodoc
class _$PaletteModelCopyWithImpl<$Res>
    implements $PaletteModelCopyWith<$Res> {
  _$PaletteModelCopyWithImpl(this._self, this._then);

  final PaletteModel _self;
  final $Res Function(PaletteModel) _then;

/// Create a copy of PaletteModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? swatches = null,Object? activeSwatchIndex = null,}) {
  return _then(_self.copyWith(
swatches: null == swatches ? _self.swatches : swatches // ignore: cast_nullable_to_non_nullable
as List<SwatchModel>,activeSwatchIndex: null == activeSwatchIndex ? _self.activeSwatchIndex : activeSwatchIndex // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [PaletteModel].
extension PaletteModelPatterns on PaletteModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaletteModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaletteModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaletteModel value)  $default,){
final _that = this;
switch (_that) {
case _PaletteModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaletteModel value)?  $default,){
final _that = this;
switch (_that) {
case _PaletteModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<SwatchModel> swatches,  int activeSwatchIndex)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaletteModel() when $default != null:
return $default(_that.swatches,_that.activeSwatchIndex);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<SwatchModel> swatches,  int activeSwatchIndex)  $default,) {final _that = this;
switch (_that) {
case _PaletteModel():
return $default(_that.swatches,_that.activeSwatchIndex);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<SwatchModel> swatches,  int activeSwatchIndex)?  $default,) {final _that = this;
switch (_that) {
case _PaletteModel() when $default != null:
return $default(_that.swatches,_that.activeSwatchIndex);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaletteModel implements PaletteModel {
  const _PaletteModel({final  List<SwatchModel> swatches = const [SwatchModel(hue: 20.0, sat: 0.2, val: 0.45), SwatchModel(hue: 0.0), SwatchModel(hue: 120.0), SwatchModel(hue: 240.0)], this.activeSwatchIndex = 1}): _swatches = swatches;
  factory _PaletteModel.fromJson(Map<String, dynamic> json) => _$PaletteModelFromJson(json);

 final  List<SwatchModel> _swatches;
@override@JsonKey() List<SwatchModel> get swatches {
  if (_swatches is EqualUnmodifiableListView) return _swatches;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_swatches);
}

@override@JsonKey() final  int activeSwatchIndex;

/// Create a copy of PaletteModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaletteModelCopyWith<_PaletteModel> get copyWith => __$PaletteModelCopyWithImpl<_PaletteModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaletteModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaletteModel&&const DeepCollectionEquality().equals(other._swatches, _swatches)&&(identical(other.activeSwatchIndex, activeSwatchIndex) || other.activeSwatchIndex == activeSwatchIndex));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_swatches),activeSwatchIndex);

@override
String toString() {
  return 'PaletteModel(swatches: $swatches, activeSwatchIndex: $activeSwatchIndex)';
}


}

/// @nodoc
abstract mixin class _$PaletteModelCopyWith<$Res> implements $PaletteModelCopyWith<$Res> {
  factory _$PaletteModelCopyWith(_PaletteModel value, $Res Function(_PaletteModel) _then) = __$PaletteModelCopyWithImpl;
@override @useResult
$Res call({
 List<SwatchModel> swatches, int activeSwatchIndex
});




}
/// @nodoc
class __$PaletteModelCopyWithImpl<$Res>
    implements _$PaletteModelCopyWith<$Res> {
  __$PaletteModelCopyWithImpl(this._self, this._then);

  final _PaletteModel _self;
  final $Res Function(_PaletteModel) _then;

/// Create a copy of PaletteModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? swatches = null,Object? activeSwatchIndex = null,}) {
  return _then(_PaletteModel(
swatches: null == swatches ? _self._swatches : swatches // ignore: cast_nullable_to_non_nullable
as List<SwatchModel>,activeSwatchIndex: null == activeSwatchIndex ? _self.activeSwatchIndex : activeSwatchIndex // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
