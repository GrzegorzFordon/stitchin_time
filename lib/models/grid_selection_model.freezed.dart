// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'grid_selection_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GridSelectionModel {

 PixelModel get startPixel; PixelModel get endPixel; bool get isActive;
/// Create a copy of GridSelectionModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GridSelectionModelCopyWith<GridSelectionModel> get copyWith => _$GridSelectionModelCopyWithImpl<GridSelectionModel>(this as GridSelectionModel, _$identity);

  /// Serializes this GridSelectionModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GridSelectionModel&&(identical(other.startPixel, startPixel) || other.startPixel == startPixel)&&(identical(other.endPixel, endPixel) || other.endPixel == endPixel)&&(identical(other.isActive, isActive) || other.isActive == isActive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,startPixel,endPixel,isActive);

@override
String toString() {
  return 'GridSelectionModel(startPixel: $startPixel, endPixel: $endPixel, isActive: $isActive)';
}


}

/// @nodoc
abstract mixin class $GridSelectionModelCopyWith<$Res>  {
  factory $GridSelectionModelCopyWith(GridSelectionModel value, $Res Function(GridSelectionModel) _then) = _$GridSelectionModelCopyWithImpl;
@useResult
$Res call({
 PixelModel startPixel, PixelModel endPixel, bool isActive
});


$PixelModelCopyWith<$Res> get startPixel;$PixelModelCopyWith<$Res> get endPixel;

}
/// @nodoc
class _$GridSelectionModelCopyWithImpl<$Res>
    implements $GridSelectionModelCopyWith<$Res> {
  _$GridSelectionModelCopyWithImpl(this._self, this._then);

  final GridSelectionModel _self;
  final $Res Function(GridSelectionModel) _then;

/// Create a copy of GridSelectionModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? startPixel = null,Object? endPixel = null,Object? isActive = null,}) {
  return _then(_self.copyWith(
startPixel: null == startPixel ? _self.startPixel : startPixel // ignore: cast_nullable_to_non_nullable
as PixelModel,endPixel: null == endPixel ? _self.endPixel : endPixel // ignore: cast_nullable_to_non_nullable
as PixelModel,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of GridSelectionModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PixelModelCopyWith<$Res> get startPixel {
  
  return $PixelModelCopyWith<$Res>(_self.startPixel, (value) {
    return _then(_self.copyWith(startPixel: value));
  });
}/// Create a copy of GridSelectionModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PixelModelCopyWith<$Res> get endPixel {
  
  return $PixelModelCopyWith<$Res>(_self.endPixel, (value) {
    return _then(_self.copyWith(endPixel: value));
  });
}
}


/// Adds pattern-matching-related methods to [GridSelectionModel].
extension GridSelectionModelPatterns on GridSelectionModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GridSelectionModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GridSelectionModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GridSelectionModel value)  $default,){
final _that = this;
switch (_that) {
case _GridSelectionModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GridSelectionModel value)?  $default,){
final _that = this;
switch (_that) {
case _GridSelectionModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PixelModel startPixel,  PixelModel endPixel,  bool isActive)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GridSelectionModel() when $default != null:
return $default(_that.startPixel,_that.endPixel,_that.isActive);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PixelModel startPixel,  PixelModel endPixel,  bool isActive)  $default,) {final _that = this;
switch (_that) {
case _GridSelectionModel():
return $default(_that.startPixel,_that.endPixel,_that.isActive);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PixelModel startPixel,  PixelModel endPixel,  bool isActive)?  $default,) {final _that = this;
switch (_that) {
case _GridSelectionModel() when $default != null:
return $default(_that.startPixel,_that.endPixel,_that.isActive);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GridSelectionModel implements GridSelectionModel {
  const _GridSelectionModel({this.startPixel = const PixelModel(), this.endPixel = const PixelModel(), this.isActive = false});
  factory _GridSelectionModel.fromJson(Map<String, dynamic> json) => _$GridSelectionModelFromJson(json);

@override@JsonKey() final  PixelModel startPixel;
@override@JsonKey() final  PixelModel endPixel;
@override@JsonKey() final  bool isActive;

/// Create a copy of GridSelectionModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GridSelectionModelCopyWith<_GridSelectionModel> get copyWith => __$GridSelectionModelCopyWithImpl<_GridSelectionModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GridSelectionModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GridSelectionModel&&(identical(other.startPixel, startPixel) || other.startPixel == startPixel)&&(identical(other.endPixel, endPixel) || other.endPixel == endPixel)&&(identical(other.isActive, isActive) || other.isActive == isActive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,startPixel,endPixel,isActive);

@override
String toString() {
  return 'GridSelectionModel(startPixel: $startPixel, endPixel: $endPixel, isActive: $isActive)';
}


}

/// @nodoc
abstract mixin class _$GridSelectionModelCopyWith<$Res> implements $GridSelectionModelCopyWith<$Res> {
  factory _$GridSelectionModelCopyWith(_GridSelectionModel value, $Res Function(_GridSelectionModel) _then) = __$GridSelectionModelCopyWithImpl;
@override @useResult
$Res call({
 PixelModel startPixel, PixelModel endPixel, bool isActive
});


@override $PixelModelCopyWith<$Res> get startPixel;@override $PixelModelCopyWith<$Res> get endPixel;

}
/// @nodoc
class __$GridSelectionModelCopyWithImpl<$Res>
    implements _$GridSelectionModelCopyWith<$Res> {
  __$GridSelectionModelCopyWithImpl(this._self, this._then);

  final _GridSelectionModel _self;
  final $Res Function(_GridSelectionModel) _then;

/// Create a copy of GridSelectionModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? startPixel = null,Object? endPixel = null,Object? isActive = null,}) {
  return _then(_GridSelectionModel(
startPixel: null == startPixel ? _self.startPixel : startPixel // ignore: cast_nullable_to_non_nullable
as PixelModel,endPixel: null == endPixel ? _self.endPixel : endPixel // ignore: cast_nullable_to_non_nullable
as PixelModel,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of GridSelectionModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PixelModelCopyWith<$Res> get startPixel {
  
  return $PixelModelCopyWith<$Res>(_self.startPixel, (value) {
    return _then(_self.copyWith(startPixel: value));
  });
}/// Create a copy of GridSelectionModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PixelModelCopyWith<$Res> get endPixel {
  
  return $PixelModelCopyWith<$Res>(_self.endPixel, (value) {
    return _then(_self.copyWith(endPixel: value));
  });
}
}

// dart format on
