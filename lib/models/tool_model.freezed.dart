// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tool_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ToolModel {

 ToolType get activeTool; ReferenceType get activeReferenceTool;
/// Create a copy of ToolModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ToolModelCopyWith<ToolModel> get copyWith => _$ToolModelCopyWithImpl<ToolModel>(this as ToolModel, _$identity);

  /// Serializes this ToolModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ToolModel&&(identical(other.activeTool, activeTool) || other.activeTool == activeTool)&&(identical(other.activeReferenceTool, activeReferenceTool) || other.activeReferenceTool == activeReferenceTool));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,activeTool,activeReferenceTool);

@override
String toString() {
  return 'ToolModel(activeTool: $activeTool, activeReferenceTool: $activeReferenceTool)';
}


}

/// @nodoc
abstract mixin class $ToolModelCopyWith<$Res>  {
  factory $ToolModelCopyWith(ToolModel value, $Res Function(ToolModel) _then) = _$ToolModelCopyWithImpl;
@useResult
$Res call({
 ToolType activeTool, ReferenceType activeReferenceTool
});




}
/// @nodoc
class _$ToolModelCopyWithImpl<$Res>
    implements $ToolModelCopyWith<$Res> {
  _$ToolModelCopyWithImpl(this._self, this._then);

  final ToolModel _self;
  final $Res Function(ToolModel) _then;

/// Create a copy of ToolModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? activeTool = null,Object? activeReferenceTool = null,}) {
  return _then(_self.copyWith(
activeTool: null == activeTool ? _self.activeTool : activeTool // ignore: cast_nullable_to_non_nullable
as ToolType,activeReferenceTool: null == activeReferenceTool ? _self.activeReferenceTool : activeReferenceTool // ignore: cast_nullable_to_non_nullable
as ReferenceType,
  ));
}

}


/// Adds pattern-matching-related methods to [ToolModel].
extension ToolModelPatterns on ToolModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ToolModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ToolModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ToolModel value)  $default,){
final _that = this;
switch (_that) {
case _ToolModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ToolModel value)?  $default,){
final _that = this;
switch (_that) {
case _ToolModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ToolType activeTool,  ReferenceType activeReferenceTool)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ToolModel() when $default != null:
return $default(_that.activeTool,_that.activeReferenceTool);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ToolType activeTool,  ReferenceType activeReferenceTool)  $default,) {final _that = this;
switch (_that) {
case _ToolModel():
return $default(_that.activeTool,_that.activeReferenceTool);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ToolType activeTool,  ReferenceType activeReferenceTool)?  $default,) {final _that = this;
switch (_that) {
case _ToolModel() when $default != null:
return $default(_that.activeTool,_that.activeReferenceTool);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ToolModel implements ToolModel {
  const _ToolModel({this.activeTool = ToolType.brush, this.activeReferenceTool = ReferenceType.move});
  factory _ToolModel.fromJson(Map<String, dynamic> json) => _$ToolModelFromJson(json);

@override@JsonKey() final  ToolType activeTool;
@override@JsonKey() final  ReferenceType activeReferenceTool;

/// Create a copy of ToolModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ToolModelCopyWith<_ToolModel> get copyWith => __$ToolModelCopyWithImpl<_ToolModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ToolModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ToolModel&&(identical(other.activeTool, activeTool) || other.activeTool == activeTool)&&(identical(other.activeReferenceTool, activeReferenceTool) || other.activeReferenceTool == activeReferenceTool));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,activeTool,activeReferenceTool);

@override
String toString() {
  return 'ToolModel(activeTool: $activeTool, activeReferenceTool: $activeReferenceTool)';
}


}

/// @nodoc
abstract mixin class _$ToolModelCopyWith<$Res> implements $ToolModelCopyWith<$Res> {
  factory _$ToolModelCopyWith(_ToolModel value, $Res Function(_ToolModel) _then) = __$ToolModelCopyWithImpl;
@override @useResult
$Res call({
 ToolType activeTool, ReferenceType activeReferenceTool
});




}
/// @nodoc
class __$ToolModelCopyWithImpl<$Res>
    implements _$ToolModelCopyWith<$Res> {
  __$ToolModelCopyWithImpl(this._self, this._then);

  final _ToolModel _self;
  final $Res Function(_ToolModel) _then;

/// Create a copy of ToolModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? activeTool = null,Object? activeReferenceTool = null,}) {
  return _then(_ToolModel(
activeTool: null == activeTool ? _self.activeTool : activeTool // ignore: cast_nullable_to_non_nullable
as ToolType,activeReferenceTool: null == activeReferenceTool ? _self.activeReferenceTool : activeReferenceTool // ignore: cast_nullable_to_non_nullable
as ReferenceType,
  ));
}


}

// dart format on
