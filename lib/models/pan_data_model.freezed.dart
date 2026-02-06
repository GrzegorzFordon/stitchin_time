// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pan_data_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PanDataModel {

 PatternModel? get pattern; int get dx; int get dy;
/// Create a copy of PanDataModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PanDataModelCopyWith<PanDataModel> get copyWith => _$PanDataModelCopyWithImpl<PanDataModel>(this as PanDataModel, _$identity);

  /// Serializes this PanDataModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PanDataModel&&(identical(other.pattern, pattern) || other.pattern == pattern)&&(identical(other.dx, dx) || other.dx == dx)&&(identical(other.dy, dy) || other.dy == dy));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,pattern,dx,dy);

@override
String toString() {
  return 'PanDataModel(pattern: $pattern, dx: $dx, dy: $dy)';
}


}

/// @nodoc
abstract mixin class $PanDataModelCopyWith<$Res>  {
  factory $PanDataModelCopyWith(PanDataModel value, $Res Function(PanDataModel) _then) = _$PanDataModelCopyWithImpl;
@useResult
$Res call({
 PatternModel? pattern, int dx, int dy
});


$PatternModelCopyWith<$Res>? get pattern;

}
/// @nodoc
class _$PanDataModelCopyWithImpl<$Res>
    implements $PanDataModelCopyWith<$Res> {
  _$PanDataModelCopyWithImpl(this._self, this._then);

  final PanDataModel _self;
  final $Res Function(PanDataModel) _then;

/// Create a copy of PanDataModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? pattern = freezed,Object? dx = null,Object? dy = null,}) {
  return _then(_self.copyWith(
pattern: freezed == pattern ? _self.pattern : pattern // ignore: cast_nullable_to_non_nullable
as PatternModel?,dx: null == dx ? _self.dx : dx // ignore: cast_nullable_to_non_nullable
as int,dy: null == dy ? _self.dy : dy // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of PanDataModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PatternModelCopyWith<$Res>? get pattern {
    if (_self.pattern == null) {
    return null;
  }

  return $PatternModelCopyWith<$Res>(_self.pattern!, (value) {
    return _then(_self.copyWith(pattern: value));
  });
}
}


/// Adds pattern-matching-related methods to [PanDataModel].
extension PanDataModelPatterns on PanDataModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PanDataModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PanDataModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PanDataModel value)  $default,){
final _that = this;
switch (_that) {
case _PanDataModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PanDataModel value)?  $default,){
final _that = this;
switch (_that) {
case _PanDataModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PatternModel? pattern,  int dx,  int dy)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PanDataModel() when $default != null:
return $default(_that.pattern,_that.dx,_that.dy);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PatternModel? pattern,  int dx,  int dy)  $default,) {final _that = this;
switch (_that) {
case _PanDataModel():
return $default(_that.pattern,_that.dx,_that.dy);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PatternModel? pattern,  int dx,  int dy)?  $default,) {final _that = this;
switch (_that) {
case _PanDataModel() when $default != null:
return $default(_that.pattern,_that.dx,_that.dy);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PanDataModel extends PanDataModel {
  const _PanDataModel({this.pattern, this.dx = 0, this.dy = 0}): super._();
  factory _PanDataModel.fromJson(Map<String, dynamic> json) => _$PanDataModelFromJson(json);

@override final  PatternModel? pattern;
@override@JsonKey() final  int dx;
@override@JsonKey() final  int dy;

/// Create a copy of PanDataModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PanDataModelCopyWith<_PanDataModel> get copyWith => __$PanDataModelCopyWithImpl<_PanDataModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PanDataModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PanDataModel&&(identical(other.pattern, pattern) || other.pattern == pattern)&&(identical(other.dx, dx) || other.dx == dx)&&(identical(other.dy, dy) || other.dy == dy));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,pattern,dx,dy);

@override
String toString() {
  return 'PanDataModel(pattern: $pattern, dx: $dx, dy: $dy)';
}


}

/// @nodoc
abstract mixin class _$PanDataModelCopyWith<$Res> implements $PanDataModelCopyWith<$Res> {
  factory _$PanDataModelCopyWith(_PanDataModel value, $Res Function(_PanDataModel) _then) = __$PanDataModelCopyWithImpl;
@override @useResult
$Res call({
 PatternModel? pattern, int dx, int dy
});


@override $PatternModelCopyWith<$Res>? get pattern;

}
/// @nodoc
class __$PanDataModelCopyWithImpl<$Res>
    implements _$PanDataModelCopyWith<$Res> {
  __$PanDataModelCopyWithImpl(this._self, this._then);

  final _PanDataModel _self;
  final $Res Function(_PanDataModel) _then;

/// Create a copy of PanDataModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? pattern = freezed,Object? dx = null,Object? dy = null,}) {
  return _then(_PanDataModel(
pattern: freezed == pattern ? _self.pattern : pattern // ignore: cast_nullable_to_non_nullable
as PatternModel?,dx: null == dx ? _self.dx : dx // ignore: cast_nullable_to_non_nullable
as int,dy: null == dy ? _self.dy : dy // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of PanDataModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PatternModelCopyWith<$Res>? get pattern {
    if (_self.pattern == null) {
    return null;
  }

  return $PatternModelCopyWith<$Res>(_self.pattern!, (value) {
    return _then(_self.copyWith(pattern: value));
  });
}
}

// dart format on
