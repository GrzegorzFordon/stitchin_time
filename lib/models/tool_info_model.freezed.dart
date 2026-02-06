// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tool_info_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ToolInfoModel {

 LineMode get lineMode; SquareMode get squareMode; int get brushSize; int get lineDelta; bool get isEraserSet;
/// Create a copy of ToolInfoModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ToolInfoModelCopyWith<ToolInfoModel> get copyWith => _$ToolInfoModelCopyWithImpl<ToolInfoModel>(this as ToolInfoModel, _$identity);

  /// Serializes this ToolInfoModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ToolInfoModel&&(identical(other.lineMode, lineMode) || other.lineMode == lineMode)&&(identical(other.squareMode, squareMode) || other.squareMode == squareMode)&&(identical(other.brushSize, brushSize) || other.brushSize == brushSize)&&(identical(other.lineDelta, lineDelta) || other.lineDelta == lineDelta)&&(identical(other.isEraserSet, isEraserSet) || other.isEraserSet == isEraserSet));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,lineMode,squareMode,brushSize,lineDelta,isEraserSet);

@override
String toString() {
  return 'ToolInfoModel(lineMode: $lineMode, squareMode: $squareMode, brushSize: $brushSize, lineDelta: $lineDelta, isEraserSet: $isEraserSet)';
}


}

/// @nodoc
abstract mixin class $ToolInfoModelCopyWith<$Res>  {
  factory $ToolInfoModelCopyWith(ToolInfoModel value, $Res Function(ToolInfoModel) _then) = _$ToolInfoModelCopyWithImpl;
@useResult
$Res call({
 LineMode lineMode, SquareMode squareMode, int brushSize, int lineDelta, bool isEraserSet
});




}
/// @nodoc
class _$ToolInfoModelCopyWithImpl<$Res>
    implements $ToolInfoModelCopyWith<$Res> {
  _$ToolInfoModelCopyWithImpl(this._self, this._then);

  final ToolInfoModel _self;
  final $Res Function(ToolInfoModel) _then;

/// Create a copy of ToolInfoModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? lineMode = null,Object? squareMode = null,Object? brushSize = null,Object? lineDelta = null,Object? isEraserSet = null,}) {
  return _then(_self.copyWith(
lineMode: null == lineMode ? _self.lineMode : lineMode // ignore: cast_nullable_to_non_nullable
as LineMode,squareMode: null == squareMode ? _self.squareMode : squareMode // ignore: cast_nullable_to_non_nullable
as SquareMode,brushSize: null == brushSize ? _self.brushSize : brushSize // ignore: cast_nullable_to_non_nullable
as int,lineDelta: null == lineDelta ? _self.lineDelta : lineDelta // ignore: cast_nullable_to_non_nullable
as int,isEraserSet: null == isEraserSet ? _self.isEraserSet : isEraserSet // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ToolInfoModel].
extension ToolInfoModelPatterns on ToolInfoModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ToolInfoModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ToolInfoModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ToolInfoModel value)  $default,){
final _that = this;
switch (_that) {
case _ToolInfoModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ToolInfoModel value)?  $default,){
final _that = this;
switch (_that) {
case _ToolInfoModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( LineMode lineMode,  SquareMode squareMode,  int brushSize,  int lineDelta,  bool isEraserSet)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ToolInfoModel() when $default != null:
return $default(_that.lineMode,_that.squareMode,_that.brushSize,_that.lineDelta,_that.isEraserSet);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( LineMode lineMode,  SquareMode squareMode,  int brushSize,  int lineDelta,  bool isEraserSet)  $default,) {final _that = this;
switch (_that) {
case _ToolInfoModel():
return $default(_that.lineMode,_that.squareMode,_that.brushSize,_that.lineDelta,_that.isEraserSet);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( LineMode lineMode,  SquareMode squareMode,  int brushSize,  int lineDelta,  bool isEraserSet)?  $default,) {final _that = this;
switch (_that) {
case _ToolInfoModel() when $default != null:
return $default(_that.lineMode,_that.squareMode,_that.brushSize,_that.lineDelta,_that.isEraserSet);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ToolInfoModel implements ToolInfoModel {
  const _ToolInfoModel({this.lineMode = LineMode.simple, this.squareMode = SquareMode.outline, this.brushSize = 0, this.lineDelta = 0, this.isEraserSet = false});
  factory _ToolInfoModel.fromJson(Map<String, dynamic> json) => _$ToolInfoModelFromJson(json);

@override@JsonKey() final  LineMode lineMode;
@override@JsonKey() final  SquareMode squareMode;
@override@JsonKey() final  int brushSize;
@override@JsonKey() final  int lineDelta;
@override@JsonKey() final  bool isEraserSet;

/// Create a copy of ToolInfoModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ToolInfoModelCopyWith<_ToolInfoModel> get copyWith => __$ToolInfoModelCopyWithImpl<_ToolInfoModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ToolInfoModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ToolInfoModel&&(identical(other.lineMode, lineMode) || other.lineMode == lineMode)&&(identical(other.squareMode, squareMode) || other.squareMode == squareMode)&&(identical(other.brushSize, brushSize) || other.brushSize == brushSize)&&(identical(other.lineDelta, lineDelta) || other.lineDelta == lineDelta)&&(identical(other.isEraserSet, isEraserSet) || other.isEraserSet == isEraserSet));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,lineMode,squareMode,brushSize,lineDelta,isEraserSet);

@override
String toString() {
  return 'ToolInfoModel(lineMode: $lineMode, squareMode: $squareMode, brushSize: $brushSize, lineDelta: $lineDelta, isEraserSet: $isEraserSet)';
}


}

/// @nodoc
abstract mixin class _$ToolInfoModelCopyWith<$Res> implements $ToolInfoModelCopyWith<$Res> {
  factory _$ToolInfoModelCopyWith(_ToolInfoModel value, $Res Function(_ToolInfoModel) _then) = __$ToolInfoModelCopyWithImpl;
@override @useResult
$Res call({
 LineMode lineMode, SquareMode squareMode, int brushSize, int lineDelta, bool isEraserSet
});




}
/// @nodoc
class __$ToolInfoModelCopyWithImpl<$Res>
    implements _$ToolInfoModelCopyWith<$Res> {
  __$ToolInfoModelCopyWithImpl(this._self, this._then);

  final _ToolInfoModel _self;
  final $Res Function(_ToolInfoModel) _then;

/// Create a copy of ToolInfoModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? lineMode = null,Object? squareMode = null,Object? brushSize = null,Object? lineDelta = null,Object? isEraserSet = null,}) {
  return _then(_ToolInfoModel(
lineMode: null == lineMode ? _self.lineMode : lineMode // ignore: cast_nullable_to_non_nullable
as LineMode,squareMode: null == squareMode ? _self.squareMode : squareMode // ignore: cast_nullable_to_non_nullable
as SquareMode,brushSize: null == brushSize ? _self.brushSize : brushSize // ignore: cast_nullable_to_non_nullable
as int,lineDelta: null == lineDelta ? _self.lineDelta : lineDelta // ignore: cast_nullable_to_non_nullable
as int,isEraserSet: null == isEraserSet ? _self.isEraserSet : isEraserSet // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
