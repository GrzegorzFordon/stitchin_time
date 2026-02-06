// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'grid_info_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GridInfoModel {

 int get rows; int get columns; int get cellWidth; int get cellHeight; CellWidthType get cellWidthType; int get highlightDelta; bool get isChangedAtEnd;
/// Create a copy of GridInfoModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GridInfoModelCopyWith<GridInfoModel> get copyWith => _$GridInfoModelCopyWithImpl<GridInfoModel>(this as GridInfoModel, _$identity);

  /// Serializes this GridInfoModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GridInfoModel&&(identical(other.rows, rows) || other.rows == rows)&&(identical(other.columns, columns) || other.columns == columns)&&(identical(other.cellWidth, cellWidth) || other.cellWidth == cellWidth)&&(identical(other.cellHeight, cellHeight) || other.cellHeight == cellHeight)&&(identical(other.cellWidthType, cellWidthType) || other.cellWidthType == cellWidthType)&&(identical(other.highlightDelta, highlightDelta) || other.highlightDelta == highlightDelta)&&(identical(other.isChangedAtEnd, isChangedAtEnd) || other.isChangedAtEnd == isChangedAtEnd));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,rows,columns,cellWidth,cellHeight,cellWidthType,highlightDelta,isChangedAtEnd);

@override
String toString() {
  return 'GridInfoModel(rows: $rows, columns: $columns, cellWidth: $cellWidth, cellHeight: $cellHeight, cellWidthType: $cellWidthType, highlightDelta: $highlightDelta, isChangedAtEnd: $isChangedAtEnd)';
}


}

/// @nodoc
abstract mixin class $GridInfoModelCopyWith<$Res>  {
  factory $GridInfoModelCopyWith(GridInfoModel value, $Res Function(GridInfoModel) _then) = _$GridInfoModelCopyWithImpl;
@useResult
$Res call({
 int rows, int columns, int cellWidth, int cellHeight, CellWidthType cellWidthType, int highlightDelta, bool isChangedAtEnd
});




}
/// @nodoc
class _$GridInfoModelCopyWithImpl<$Res>
    implements $GridInfoModelCopyWith<$Res> {
  _$GridInfoModelCopyWithImpl(this._self, this._then);

  final GridInfoModel _self;
  final $Res Function(GridInfoModel) _then;

/// Create a copy of GridInfoModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? rows = null,Object? columns = null,Object? cellWidth = null,Object? cellHeight = null,Object? cellWidthType = null,Object? highlightDelta = null,Object? isChangedAtEnd = null,}) {
  return _then(_self.copyWith(
rows: null == rows ? _self.rows : rows // ignore: cast_nullable_to_non_nullable
as int,columns: null == columns ? _self.columns : columns // ignore: cast_nullable_to_non_nullable
as int,cellWidth: null == cellWidth ? _self.cellWidth : cellWidth // ignore: cast_nullable_to_non_nullable
as int,cellHeight: null == cellHeight ? _self.cellHeight : cellHeight // ignore: cast_nullable_to_non_nullable
as int,cellWidthType: null == cellWidthType ? _self.cellWidthType : cellWidthType // ignore: cast_nullable_to_non_nullable
as CellWidthType,highlightDelta: null == highlightDelta ? _self.highlightDelta : highlightDelta // ignore: cast_nullable_to_non_nullable
as int,isChangedAtEnd: null == isChangedAtEnd ? _self.isChangedAtEnd : isChangedAtEnd // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [GridInfoModel].
extension GridInfoModelPatterns on GridInfoModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GridInfoModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GridInfoModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GridInfoModel value)  $default,){
final _that = this;
switch (_that) {
case _GridInfoModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GridInfoModel value)?  $default,){
final _that = this;
switch (_that) {
case _GridInfoModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int rows,  int columns,  int cellWidth,  int cellHeight,  CellWidthType cellWidthType,  int highlightDelta,  bool isChangedAtEnd)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GridInfoModel() when $default != null:
return $default(_that.rows,_that.columns,_that.cellWidth,_that.cellHeight,_that.cellWidthType,_that.highlightDelta,_that.isChangedAtEnd);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int rows,  int columns,  int cellWidth,  int cellHeight,  CellWidthType cellWidthType,  int highlightDelta,  bool isChangedAtEnd)  $default,) {final _that = this;
switch (_that) {
case _GridInfoModel():
return $default(_that.rows,_that.columns,_that.cellWidth,_that.cellHeight,_that.cellWidthType,_that.highlightDelta,_that.isChangedAtEnd);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int rows,  int columns,  int cellWidth,  int cellHeight,  CellWidthType cellWidthType,  int highlightDelta,  bool isChangedAtEnd)?  $default,) {final _that = this;
switch (_that) {
case _GridInfoModel() when $default != null:
return $default(_that.rows,_that.columns,_that.cellWidth,_that.cellHeight,_that.cellWidthType,_that.highlightDelta,_that.isChangedAtEnd);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GridInfoModel extends GridInfoModel {
  const _GridInfoModel({this.rows = 20, this.columns = 20, this.cellWidth = 30, this.cellHeight = 30, this.cellWidthType = CellWidthType.square, this.highlightDelta = 10, this.isChangedAtEnd = true}): super._();
  factory _GridInfoModel.fromJson(Map<String, dynamic> json) => _$GridInfoModelFromJson(json);

@override@JsonKey() final  int rows;
@override@JsonKey() final  int columns;
@override@JsonKey() final  int cellWidth;
@override@JsonKey() final  int cellHeight;
@override@JsonKey() final  CellWidthType cellWidthType;
@override@JsonKey() final  int highlightDelta;
@override@JsonKey() final  bool isChangedAtEnd;

/// Create a copy of GridInfoModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GridInfoModelCopyWith<_GridInfoModel> get copyWith => __$GridInfoModelCopyWithImpl<_GridInfoModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GridInfoModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GridInfoModel&&(identical(other.rows, rows) || other.rows == rows)&&(identical(other.columns, columns) || other.columns == columns)&&(identical(other.cellWidth, cellWidth) || other.cellWidth == cellWidth)&&(identical(other.cellHeight, cellHeight) || other.cellHeight == cellHeight)&&(identical(other.cellWidthType, cellWidthType) || other.cellWidthType == cellWidthType)&&(identical(other.highlightDelta, highlightDelta) || other.highlightDelta == highlightDelta)&&(identical(other.isChangedAtEnd, isChangedAtEnd) || other.isChangedAtEnd == isChangedAtEnd));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,rows,columns,cellWidth,cellHeight,cellWidthType,highlightDelta,isChangedAtEnd);

@override
String toString() {
  return 'GridInfoModel(rows: $rows, columns: $columns, cellWidth: $cellWidth, cellHeight: $cellHeight, cellWidthType: $cellWidthType, highlightDelta: $highlightDelta, isChangedAtEnd: $isChangedAtEnd)';
}


}

/// @nodoc
abstract mixin class _$GridInfoModelCopyWith<$Res> implements $GridInfoModelCopyWith<$Res> {
  factory _$GridInfoModelCopyWith(_GridInfoModel value, $Res Function(_GridInfoModel) _then) = __$GridInfoModelCopyWithImpl;
@override @useResult
$Res call({
 int rows, int columns, int cellWidth, int cellHeight, CellWidthType cellWidthType, int highlightDelta, bool isChangedAtEnd
});




}
/// @nodoc
class __$GridInfoModelCopyWithImpl<$Res>
    implements _$GridInfoModelCopyWith<$Res> {
  __$GridInfoModelCopyWithImpl(this._self, this._then);

  final _GridInfoModel _self;
  final $Res Function(_GridInfoModel) _then;

/// Create a copy of GridInfoModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? rows = null,Object? columns = null,Object? cellWidth = null,Object? cellHeight = null,Object? cellWidthType = null,Object? highlightDelta = null,Object? isChangedAtEnd = null,}) {
  return _then(_GridInfoModel(
rows: null == rows ? _self.rows : rows // ignore: cast_nullable_to_non_nullable
as int,columns: null == columns ? _self.columns : columns // ignore: cast_nullable_to_non_nullable
as int,cellWidth: null == cellWidth ? _self.cellWidth : cellWidth // ignore: cast_nullable_to_non_nullable
as int,cellHeight: null == cellHeight ? _self.cellHeight : cellHeight // ignore: cast_nullable_to_non_nullable
as int,cellWidthType: null == cellWidthType ? _self.cellWidthType : cellWidthType // ignore: cast_nullable_to_non_nullable
as CellWidthType,highlightDelta: null == highlightDelta ? _self.highlightDelta : highlightDelta // ignore: cast_nullable_to_non_nullable
as int,isChangedAtEnd: null == isChangedAtEnd ? _self.isChangedAtEnd : isChangedAtEnd // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
