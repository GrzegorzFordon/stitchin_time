// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pixel_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PixelModel {

 int get row; int get column; dynamic get mySwatchIndex;
/// Create a copy of PixelModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PixelModelCopyWith<PixelModel> get copyWith => _$PixelModelCopyWithImpl<PixelModel>(this as PixelModel, _$identity);

  /// Serializes this PixelModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PixelModel&&(identical(other.row, row) || other.row == row)&&(identical(other.column, column) || other.column == column)&&const DeepCollectionEquality().equals(other.mySwatchIndex, mySwatchIndex));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,row,column,const DeepCollectionEquality().hash(mySwatchIndex));

@override
String toString() {
  return 'PixelModel(row: $row, column: $column, mySwatchIndex: $mySwatchIndex)';
}


}

/// @nodoc
abstract mixin class $PixelModelCopyWith<$Res>  {
  factory $PixelModelCopyWith(PixelModel value, $Res Function(PixelModel) _then) = _$PixelModelCopyWithImpl;
@useResult
$Res call({
 int row, int column, dynamic mySwatchIndex
});




}
/// @nodoc
class _$PixelModelCopyWithImpl<$Res>
    implements $PixelModelCopyWith<$Res> {
  _$PixelModelCopyWithImpl(this._self, this._then);

  final PixelModel _self;
  final $Res Function(PixelModel) _then;

/// Create a copy of PixelModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? row = null,Object? column = null,Object? mySwatchIndex = freezed,}) {
  return _then(_self.copyWith(
row: null == row ? _self.row : row // ignore: cast_nullable_to_non_nullable
as int,column: null == column ? _self.column : column // ignore: cast_nullable_to_non_nullable
as int,mySwatchIndex: freezed == mySwatchIndex ? _self.mySwatchIndex : mySwatchIndex // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}

}


/// Adds pattern-matching-related methods to [PixelModel].
extension PixelModelPatterns on PixelModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PixelModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PixelModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PixelModel value)  $default,){
final _that = this;
switch (_that) {
case _PixelModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PixelModel value)?  $default,){
final _that = this;
switch (_that) {
case _PixelModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int row,  int column,  dynamic mySwatchIndex)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PixelModel() when $default != null:
return $default(_that.row,_that.column,_that.mySwatchIndex);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int row,  int column,  dynamic mySwatchIndex)  $default,) {final _that = this;
switch (_that) {
case _PixelModel():
return $default(_that.row,_that.column,_that.mySwatchIndex);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int row,  int column,  dynamic mySwatchIndex)?  $default,) {final _that = this;
switch (_that) {
case _PixelModel() when $default != null:
return $default(_that.row,_that.column,_that.mySwatchIndex);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PixelModel implements PixelModel {
  const _PixelModel({this.row = -1, this.column = -1, this.mySwatchIndex = 0});
  factory _PixelModel.fromJson(Map<String, dynamic> json) => _$PixelModelFromJson(json);

@override@JsonKey() final  int row;
@override@JsonKey() final  int column;
@override@JsonKey() final  dynamic mySwatchIndex;

/// Create a copy of PixelModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PixelModelCopyWith<_PixelModel> get copyWith => __$PixelModelCopyWithImpl<_PixelModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PixelModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PixelModel&&(identical(other.row, row) || other.row == row)&&(identical(other.column, column) || other.column == column)&&const DeepCollectionEquality().equals(other.mySwatchIndex, mySwatchIndex));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,row,column,const DeepCollectionEquality().hash(mySwatchIndex));

@override
String toString() {
  return 'PixelModel(row: $row, column: $column, mySwatchIndex: $mySwatchIndex)';
}


}

/// @nodoc
abstract mixin class _$PixelModelCopyWith<$Res> implements $PixelModelCopyWith<$Res> {
  factory _$PixelModelCopyWith(_PixelModel value, $Res Function(_PixelModel) _then) = __$PixelModelCopyWithImpl;
@override @useResult
$Res call({
 int row, int column, dynamic mySwatchIndex
});




}
/// @nodoc
class __$PixelModelCopyWithImpl<$Res>
    implements _$PixelModelCopyWith<$Res> {
  __$PixelModelCopyWithImpl(this._self, this._then);

  final _PixelModel _self;
  final $Res Function(_PixelModel) _then;

/// Create a copy of PixelModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? row = null,Object? column = null,Object? mySwatchIndex = freezed,}) {
  return _then(_PixelModel(
row: null == row ? _self.row : row // ignore: cast_nullable_to_non_nullable
as int,column: null == column ? _self.column : column // ignore: cast_nullable_to_non_nullable
as int,mySwatchIndex: freezed == mySwatchIndex ? _self.mySwatchIndex : mySwatchIndex // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}


}

// dart format on
