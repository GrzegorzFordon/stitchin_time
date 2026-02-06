// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ViewModel {

 int get activeRow; int get activeCol; bool get startAtBottom; bool get isLeftToRight; bool get isZigZag; int get fallOff; int get maxBlockLength; int get rowRepeats; int get currentRepeat; ZoomInfoModel get zoomInfo; bool get showSettings;
/// Create a copy of ViewModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ViewModelCopyWith<ViewModel> get copyWith => _$ViewModelCopyWithImpl<ViewModel>(this as ViewModel, _$identity);

  /// Serializes this ViewModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ViewModel&&(identical(other.activeRow, activeRow) || other.activeRow == activeRow)&&(identical(other.activeCol, activeCol) || other.activeCol == activeCol)&&(identical(other.startAtBottom, startAtBottom) || other.startAtBottom == startAtBottom)&&(identical(other.isLeftToRight, isLeftToRight) || other.isLeftToRight == isLeftToRight)&&(identical(other.isZigZag, isZigZag) || other.isZigZag == isZigZag)&&(identical(other.fallOff, fallOff) || other.fallOff == fallOff)&&(identical(other.maxBlockLength, maxBlockLength) || other.maxBlockLength == maxBlockLength)&&(identical(other.rowRepeats, rowRepeats) || other.rowRepeats == rowRepeats)&&(identical(other.currentRepeat, currentRepeat) || other.currentRepeat == currentRepeat)&&(identical(other.zoomInfo, zoomInfo) || other.zoomInfo == zoomInfo)&&(identical(other.showSettings, showSettings) || other.showSettings == showSettings));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,activeRow,activeCol,startAtBottom,isLeftToRight,isZigZag,fallOff,maxBlockLength,rowRepeats,currentRepeat,zoomInfo,showSettings);

@override
String toString() {
  return 'ViewModel(activeRow: $activeRow, activeCol: $activeCol, startAtBottom: $startAtBottom, isLeftToRight: $isLeftToRight, isZigZag: $isZigZag, fallOff: $fallOff, maxBlockLength: $maxBlockLength, rowRepeats: $rowRepeats, currentRepeat: $currentRepeat, zoomInfo: $zoomInfo, showSettings: $showSettings)';
}


}

/// @nodoc
abstract mixin class $ViewModelCopyWith<$Res>  {
  factory $ViewModelCopyWith(ViewModel value, $Res Function(ViewModel) _then) = _$ViewModelCopyWithImpl;
@useResult
$Res call({
 int activeRow, int activeCol, bool startAtBottom, bool isLeftToRight, bool isZigZag, int fallOff, int maxBlockLength, int rowRepeats, int currentRepeat, ZoomInfoModel zoomInfo, bool showSettings
});


$ZoomInfoModelCopyWith<$Res> get zoomInfo;

}
/// @nodoc
class _$ViewModelCopyWithImpl<$Res>
    implements $ViewModelCopyWith<$Res> {
  _$ViewModelCopyWithImpl(this._self, this._then);

  final ViewModel _self;
  final $Res Function(ViewModel) _then;

/// Create a copy of ViewModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? activeRow = null,Object? activeCol = null,Object? startAtBottom = null,Object? isLeftToRight = null,Object? isZigZag = null,Object? fallOff = null,Object? maxBlockLength = null,Object? rowRepeats = null,Object? currentRepeat = null,Object? zoomInfo = null,Object? showSettings = null,}) {
  return _then(_self.copyWith(
activeRow: null == activeRow ? _self.activeRow : activeRow // ignore: cast_nullable_to_non_nullable
as int,activeCol: null == activeCol ? _self.activeCol : activeCol // ignore: cast_nullable_to_non_nullable
as int,startAtBottom: null == startAtBottom ? _self.startAtBottom : startAtBottom // ignore: cast_nullable_to_non_nullable
as bool,isLeftToRight: null == isLeftToRight ? _self.isLeftToRight : isLeftToRight // ignore: cast_nullable_to_non_nullable
as bool,isZigZag: null == isZigZag ? _self.isZigZag : isZigZag // ignore: cast_nullable_to_non_nullable
as bool,fallOff: null == fallOff ? _self.fallOff : fallOff // ignore: cast_nullable_to_non_nullable
as int,maxBlockLength: null == maxBlockLength ? _self.maxBlockLength : maxBlockLength // ignore: cast_nullable_to_non_nullable
as int,rowRepeats: null == rowRepeats ? _self.rowRepeats : rowRepeats // ignore: cast_nullable_to_non_nullable
as int,currentRepeat: null == currentRepeat ? _self.currentRepeat : currentRepeat // ignore: cast_nullable_to_non_nullable
as int,zoomInfo: null == zoomInfo ? _self.zoomInfo : zoomInfo // ignore: cast_nullable_to_non_nullable
as ZoomInfoModel,showSettings: null == showSettings ? _self.showSettings : showSettings // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of ViewModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ZoomInfoModelCopyWith<$Res> get zoomInfo {
  
  return $ZoomInfoModelCopyWith<$Res>(_self.zoomInfo, (value) {
    return _then(_self.copyWith(zoomInfo: value));
  });
}
}


/// Adds pattern-matching-related methods to [ViewModel].
extension ViewModelPatterns on ViewModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ViewModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ViewModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ViewModel value)  $default,){
final _that = this;
switch (_that) {
case _ViewModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ViewModel value)?  $default,){
final _that = this;
switch (_that) {
case _ViewModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int activeRow,  int activeCol,  bool startAtBottom,  bool isLeftToRight,  bool isZigZag,  int fallOff,  int maxBlockLength,  int rowRepeats,  int currentRepeat,  ZoomInfoModel zoomInfo,  bool showSettings)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ViewModel() when $default != null:
return $default(_that.activeRow,_that.activeCol,_that.startAtBottom,_that.isLeftToRight,_that.isZigZag,_that.fallOff,_that.maxBlockLength,_that.rowRepeats,_that.currentRepeat,_that.zoomInfo,_that.showSettings);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int activeRow,  int activeCol,  bool startAtBottom,  bool isLeftToRight,  bool isZigZag,  int fallOff,  int maxBlockLength,  int rowRepeats,  int currentRepeat,  ZoomInfoModel zoomInfo,  bool showSettings)  $default,) {final _that = this;
switch (_that) {
case _ViewModel():
return $default(_that.activeRow,_that.activeCol,_that.startAtBottom,_that.isLeftToRight,_that.isZigZag,_that.fallOff,_that.maxBlockLength,_that.rowRepeats,_that.currentRepeat,_that.zoomInfo,_that.showSettings);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int activeRow,  int activeCol,  bool startAtBottom,  bool isLeftToRight,  bool isZigZag,  int fallOff,  int maxBlockLength,  int rowRepeats,  int currentRepeat,  ZoomInfoModel zoomInfo,  bool showSettings)?  $default,) {final _that = this;
switch (_that) {
case _ViewModel() when $default != null:
return $default(_that.activeRow,_that.activeCol,_that.startAtBottom,_that.isLeftToRight,_that.isZigZag,_that.fallOff,_that.maxBlockLength,_that.rowRepeats,_that.currentRepeat,_that.zoomInfo,_that.showSettings);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ViewModel implements ViewModel {
  const _ViewModel({this.activeRow = 0, this.activeCol = 0, this.startAtBottom = true, this.isLeftToRight = false, this.isZigZag = false, this.fallOff = 25, this.maxBlockLength = 5, this.rowRepeats = 1, this.currentRepeat = 1, this.zoomInfo = const ZoomInfoModel(), this.showSettings = false});
  factory _ViewModel.fromJson(Map<String, dynamic> json) => _$ViewModelFromJson(json);

@override@JsonKey() final  int activeRow;
@override@JsonKey() final  int activeCol;
@override@JsonKey() final  bool startAtBottom;
@override@JsonKey() final  bool isLeftToRight;
@override@JsonKey() final  bool isZigZag;
@override@JsonKey() final  int fallOff;
@override@JsonKey() final  int maxBlockLength;
@override@JsonKey() final  int rowRepeats;
@override@JsonKey() final  int currentRepeat;
@override@JsonKey() final  ZoomInfoModel zoomInfo;
@override@JsonKey() final  bool showSettings;

/// Create a copy of ViewModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ViewModelCopyWith<_ViewModel> get copyWith => __$ViewModelCopyWithImpl<_ViewModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ViewModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ViewModel&&(identical(other.activeRow, activeRow) || other.activeRow == activeRow)&&(identical(other.activeCol, activeCol) || other.activeCol == activeCol)&&(identical(other.startAtBottom, startAtBottom) || other.startAtBottom == startAtBottom)&&(identical(other.isLeftToRight, isLeftToRight) || other.isLeftToRight == isLeftToRight)&&(identical(other.isZigZag, isZigZag) || other.isZigZag == isZigZag)&&(identical(other.fallOff, fallOff) || other.fallOff == fallOff)&&(identical(other.maxBlockLength, maxBlockLength) || other.maxBlockLength == maxBlockLength)&&(identical(other.rowRepeats, rowRepeats) || other.rowRepeats == rowRepeats)&&(identical(other.currentRepeat, currentRepeat) || other.currentRepeat == currentRepeat)&&(identical(other.zoomInfo, zoomInfo) || other.zoomInfo == zoomInfo)&&(identical(other.showSettings, showSettings) || other.showSettings == showSettings));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,activeRow,activeCol,startAtBottom,isLeftToRight,isZigZag,fallOff,maxBlockLength,rowRepeats,currentRepeat,zoomInfo,showSettings);

@override
String toString() {
  return 'ViewModel(activeRow: $activeRow, activeCol: $activeCol, startAtBottom: $startAtBottom, isLeftToRight: $isLeftToRight, isZigZag: $isZigZag, fallOff: $fallOff, maxBlockLength: $maxBlockLength, rowRepeats: $rowRepeats, currentRepeat: $currentRepeat, zoomInfo: $zoomInfo, showSettings: $showSettings)';
}


}

/// @nodoc
abstract mixin class _$ViewModelCopyWith<$Res> implements $ViewModelCopyWith<$Res> {
  factory _$ViewModelCopyWith(_ViewModel value, $Res Function(_ViewModel) _then) = __$ViewModelCopyWithImpl;
@override @useResult
$Res call({
 int activeRow, int activeCol, bool startAtBottom, bool isLeftToRight, bool isZigZag, int fallOff, int maxBlockLength, int rowRepeats, int currentRepeat, ZoomInfoModel zoomInfo, bool showSettings
});


@override $ZoomInfoModelCopyWith<$Res> get zoomInfo;

}
/// @nodoc
class __$ViewModelCopyWithImpl<$Res>
    implements _$ViewModelCopyWith<$Res> {
  __$ViewModelCopyWithImpl(this._self, this._then);

  final _ViewModel _self;
  final $Res Function(_ViewModel) _then;

/// Create a copy of ViewModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? activeRow = null,Object? activeCol = null,Object? startAtBottom = null,Object? isLeftToRight = null,Object? isZigZag = null,Object? fallOff = null,Object? maxBlockLength = null,Object? rowRepeats = null,Object? currentRepeat = null,Object? zoomInfo = null,Object? showSettings = null,}) {
  return _then(_ViewModel(
activeRow: null == activeRow ? _self.activeRow : activeRow // ignore: cast_nullable_to_non_nullable
as int,activeCol: null == activeCol ? _self.activeCol : activeCol // ignore: cast_nullable_to_non_nullable
as int,startAtBottom: null == startAtBottom ? _self.startAtBottom : startAtBottom // ignore: cast_nullable_to_non_nullable
as bool,isLeftToRight: null == isLeftToRight ? _self.isLeftToRight : isLeftToRight // ignore: cast_nullable_to_non_nullable
as bool,isZigZag: null == isZigZag ? _self.isZigZag : isZigZag // ignore: cast_nullable_to_non_nullable
as bool,fallOff: null == fallOff ? _self.fallOff : fallOff // ignore: cast_nullable_to_non_nullable
as int,maxBlockLength: null == maxBlockLength ? _self.maxBlockLength : maxBlockLength // ignore: cast_nullable_to_non_nullable
as int,rowRepeats: null == rowRepeats ? _self.rowRepeats : rowRepeats // ignore: cast_nullable_to_non_nullable
as int,currentRepeat: null == currentRepeat ? _self.currentRepeat : currentRepeat // ignore: cast_nullable_to_non_nullable
as int,zoomInfo: null == zoomInfo ? _self.zoomInfo : zoomInfo // ignore: cast_nullable_to_non_nullable
as ZoomInfoModel,showSettings: null == showSettings ? _self.showSettings : showSettings // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of ViewModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ZoomInfoModelCopyWith<$Res> get zoomInfo {
  
  return $ZoomInfoModelCopyWith<$Res>(_self.zoomInfo, (value) {
    return _then(_self.copyWith(zoomInfo: value));
  });
}
}

// dart format on
