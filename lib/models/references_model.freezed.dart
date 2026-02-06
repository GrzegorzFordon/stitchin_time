// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'references_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReferencesModel {

 String get uuid; List<ReferenceModel> get references; int get activeIndex; ReferenceModel get cachedRefData;
/// Create a copy of ReferencesModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReferencesModelCopyWith<ReferencesModel> get copyWith => _$ReferencesModelCopyWithImpl<ReferencesModel>(this as ReferencesModel, _$identity);

  /// Serializes this ReferencesModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReferencesModel&&(identical(other.uuid, uuid) || other.uuid == uuid)&&const DeepCollectionEquality().equals(other.references, references)&&(identical(other.activeIndex, activeIndex) || other.activeIndex == activeIndex)&&(identical(other.cachedRefData, cachedRefData) || other.cachedRefData == cachedRefData));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,uuid,const DeepCollectionEquality().hash(references),activeIndex,cachedRefData);

@override
String toString() {
  return 'ReferencesModel(uuid: $uuid, references: $references, activeIndex: $activeIndex, cachedRefData: $cachedRefData)';
}


}

/// @nodoc
abstract mixin class $ReferencesModelCopyWith<$Res>  {
  factory $ReferencesModelCopyWith(ReferencesModel value, $Res Function(ReferencesModel) _then) = _$ReferencesModelCopyWithImpl;
@useResult
$Res call({
 String uuid, List<ReferenceModel> references, int activeIndex, ReferenceModel cachedRefData
});


$ReferenceModelCopyWith<$Res> get cachedRefData;

}
/// @nodoc
class _$ReferencesModelCopyWithImpl<$Res>
    implements $ReferencesModelCopyWith<$Res> {
  _$ReferencesModelCopyWithImpl(this._self, this._then);

  final ReferencesModel _self;
  final $Res Function(ReferencesModel) _then;

/// Create a copy of ReferencesModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? uuid = null,Object? references = null,Object? activeIndex = null,Object? cachedRefData = null,}) {
  return _then(_self.copyWith(
uuid: null == uuid ? _self.uuid : uuid // ignore: cast_nullable_to_non_nullable
as String,references: null == references ? _self.references : references // ignore: cast_nullable_to_non_nullable
as List<ReferenceModel>,activeIndex: null == activeIndex ? _self.activeIndex : activeIndex // ignore: cast_nullable_to_non_nullable
as int,cachedRefData: null == cachedRefData ? _self.cachedRefData : cachedRefData // ignore: cast_nullable_to_non_nullable
as ReferenceModel,
  ));
}
/// Create a copy of ReferencesModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReferenceModelCopyWith<$Res> get cachedRefData {
  
  return $ReferenceModelCopyWith<$Res>(_self.cachedRefData, (value) {
    return _then(_self.copyWith(cachedRefData: value));
  });
}
}


/// Adds pattern-matching-related methods to [ReferencesModel].
extension ReferencesModelPatterns on ReferencesModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReferencesModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReferencesModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReferencesModel value)  $default,){
final _that = this;
switch (_that) {
case _ReferencesModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReferencesModel value)?  $default,){
final _that = this;
switch (_that) {
case _ReferencesModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String uuid,  List<ReferenceModel> references,  int activeIndex,  ReferenceModel cachedRefData)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReferencesModel() when $default != null:
return $default(_that.uuid,_that.references,_that.activeIndex,_that.cachedRefData);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String uuid,  List<ReferenceModel> references,  int activeIndex,  ReferenceModel cachedRefData)  $default,) {final _that = this;
switch (_that) {
case _ReferencesModel():
return $default(_that.uuid,_that.references,_that.activeIndex,_that.cachedRefData);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String uuid,  List<ReferenceModel> references,  int activeIndex,  ReferenceModel cachedRefData)?  $default,) {final _that = this;
switch (_that) {
case _ReferencesModel() when $default != null:
return $default(_that.uuid,_that.references,_that.activeIndex,_that.cachedRefData);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReferencesModel implements ReferencesModel {
  const _ReferencesModel({this.uuid = "defaultValue", final  List<ReferenceModel> references = const [], this.activeIndex = 0, this.cachedRefData = const ReferenceModel()}): _references = references;
  factory _ReferencesModel.fromJson(Map<String, dynamic> json) => _$ReferencesModelFromJson(json);

@override@JsonKey() final  String uuid;
 final  List<ReferenceModel> _references;
@override@JsonKey() List<ReferenceModel> get references {
  if (_references is EqualUnmodifiableListView) return _references;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_references);
}

@override@JsonKey() final  int activeIndex;
@override@JsonKey() final  ReferenceModel cachedRefData;

/// Create a copy of ReferencesModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReferencesModelCopyWith<_ReferencesModel> get copyWith => __$ReferencesModelCopyWithImpl<_ReferencesModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReferencesModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReferencesModel&&(identical(other.uuid, uuid) || other.uuid == uuid)&&const DeepCollectionEquality().equals(other._references, _references)&&(identical(other.activeIndex, activeIndex) || other.activeIndex == activeIndex)&&(identical(other.cachedRefData, cachedRefData) || other.cachedRefData == cachedRefData));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,uuid,const DeepCollectionEquality().hash(_references),activeIndex,cachedRefData);

@override
String toString() {
  return 'ReferencesModel(uuid: $uuid, references: $references, activeIndex: $activeIndex, cachedRefData: $cachedRefData)';
}


}

/// @nodoc
abstract mixin class _$ReferencesModelCopyWith<$Res> implements $ReferencesModelCopyWith<$Res> {
  factory _$ReferencesModelCopyWith(_ReferencesModel value, $Res Function(_ReferencesModel) _then) = __$ReferencesModelCopyWithImpl;
@override @useResult
$Res call({
 String uuid, List<ReferenceModel> references, int activeIndex, ReferenceModel cachedRefData
});


@override $ReferenceModelCopyWith<$Res> get cachedRefData;

}
/// @nodoc
class __$ReferencesModelCopyWithImpl<$Res>
    implements _$ReferencesModelCopyWith<$Res> {
  __$ReferencesModelCopyWithImpl(this._self, this._then);

  final _ReferencesModel _self;
  final $Res Function(_ReferencesModel) _then;

/// Create a copy of ReferencesModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? uuid = null,Object? references = null,Object? activeIndex = null,Object? cachedRefData = null,}) {
  return _then(_ReferencesModel(
uuid: null == uuid ? _self.uuid : uuid // ignore: cast_nullable_to_non_nullable
as String,references: null == references ? _self._references : references // ignore: cast_nullable_to_non_nullable
as List<ReferenceModel>,activeIndex: null == activeIndex ? _self.activeIndex : activeIndex // ignore: cast_nullable_to_non_nullable
as int,cachedRefData: null == cachedRefData ? _self.cachedRefData : cachedRefData // ignore: cast_nullable_to_non_nullable
as ReferenceModel,
  ));
}

/// Create a copy of ReferencesModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReferenceModelCopyWith<$Res> get cachedRefData {
  
  return $ReferenceModelCopyWith<$Res>(_self.cachedRefData, (value) {
    return _then(_self.copyWith(cachedRefData: value));
  });
}
}

// dart format on
