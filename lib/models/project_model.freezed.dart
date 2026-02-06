// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProjectModel {

 String get title; String get uuid; PatternModel get pattern; CanvasModel get canvas; PaletteModel get palette;// @Default(ReferencesModel()) ReferencesModel references,
 ViewModel get view;
/// Create a copy of ProjectModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProjectModelCopyWith<ProjectModel> get copyWith => _$ProjectModelCopyWithImpl<ProjectModel>(this as ProjectModel, _$identity);

  /// Serializes this ProjectModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectModel&&(identical(other.title, title) || other.title == title)&&(identical(other.uuid, uuid) || other.uuid == uuid)&&(identical(other.pattern, pattern) || other.pattern == pattern)&&(identical(other.canvas, canvas) || other.canvas == canvas)&&(identical(other.palette, palette) || other.palette == palette)&&(identical(other.view, view) || other.view == view));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,uuid,pattern,canvas,palette,view);

@override
String toString() {
  return 'ProjectModel(title: $title, uuid: $uuid, pattern: $pattern, canvas: $canvas, palette: $palette, view: $view)';
}


}

/// @nodoc
abstract mixin class $ProjectModelCopyWith<$Res>  {
  factory $ProjectModelCopyWith(ProjectModel value, $Res Function(ProjectModel) _then) = _$ProjectModelCopyWithImpl;
@useResult
$Res call({
 String title, String uuid, PatternModel pattern, CanvasModel canvas, PaletteModel palette, ViewModel view
});


$PatternModelCopyWith<$Res> get pattern;$CanvasModelCopyWith<$Res> get canvas;$PaletteModelCopyWith<$Res> get palette;$ViewModelCopyWith<$Res> get view;

}
/// @nodoc
class _$ProjectModelCopyWithImpl<$Res>
    implements $ProjectModelCopyWith<$Res> {
  _$ProjectModelCopyWithImpl(this._self, this._then);

  final ProjectModel _self;
  final $Res Function(ProjectModel) _then;

/// Create a copy of ProjectModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? uuid = null,Object? pattern = null,Object? canvas = null,Object? palette = null,Object? view = null,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,uuid: null == uuid ? _self.uuid : uuid // ignore: cast_nullable_to_non_nullable
as String,pattern: null == pattern ? _self.pattern : pattern // ignore: cast_nullable_to_non_nullable
as PatternModel,canvas: null == canvas ? _self.canvas : canvas // ignore: cast_nullable_to_non_nullable
as CanvasModel,palette: null == palette ? _self.palette : palette // ignore: cast_nullable_to_non_nullable
as PaletteModel,view: null == view ? _self.view : view // ignore: cast_nullable_to_non_nullable
as ViewModel,
  ));
}
/// Create a copy of ProjectModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PatternModelCopyWith<$Res> get pattern {
  
  return $PatternModelCopyWith<$Res>(_self.pattern, (value) {
    return _then(_self.copyWith(pattern: value));
  });
}/// Create a copy of ProjectModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CanvasModelCopyWith<$Res> get canvas {
  
  return $CanvasModelCopyWith<$Res>(_self.canvas, (value) {
    return _then(_self.copyWith(canvas: value));
  });
}/// Create a copy of ProjectModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaletteModelCopyWith<$Res> get palette {
  
  return $PaletteModelCopyWith<$Res>(_self.palette, (value) {
    return _then(_self.copyWith(palette: value));
  });
}/// Create a copy of ProjectModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ViewModelCopyWith<$Res> get view {
  
  return $ViewModelCopyWith<$Res>(_self.view, (value) {
    return _then(_self.copyWith(view: value));
  });
}
}


/// Adds pattern-matching-related methods to [ProjectModel].
extension ProjectModelPatterns on ProjectModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProjectModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProjectModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProjectModel value)  $default,){
final _that = this;
switch (_that) {
case _ProjectModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProjectModel value)?  $default,){
final _that = this;
switch (_that) {
case _ProjectModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  String uuid,  PatternModel pattern,  CanvasModel canvas,  PaletteModel palette,  ViewModel view)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProjectModel() when $default != null:
return $default(_that.title,_that.uuid,_that.pattern,_that.canvas,_that.palette,_that.view);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  String uuid,  PatternModel pattern,  CanvasModel canvas,  PaletteModel palette,  ViewModel view)  $default,) {final _that = this;
switch (_that) {
case _ProjectModel():
return $default(_that.title,_that.uuid,_that.pattern,_that.canvas,_that.palette,_that.view);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  String uuid,  PatternModel pattern,  CanvasModel canvas,  PaletteModel palette,  ViewModel view)?  $default,) {final _that = this;
switch (_that) {
case _ProjectModel() when $default != null:
return $default(_that.title,_that.uuid,_that.pattern,_that.canvas,_that.palette,_that.view);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProjectModel implements ProjectModel {
  const _ProjectModel({this.title = "New Project", this.uuid = "defaultValue", this.pattern = const PatternModel(), this.canvas = const CanvasModel(), this.palette = const PaletteModel(), this.view = const ViewModel()});
  factory _ProjectModel.fromJson(Map<String, dynamic> json) => _$ProjectModelFromJson(json);

@override@JsonKey() final  String title;
@override@JsonKey() final  String uuid;
@override@JsonKey() final  PatternModel pattern;
@override@JsonKey() final  CanvasModel canvas;
@override@JsonKey() final  PaletteModel palette;
// @Default(ReferencesModel()) ReferencesModel references,
@override@JsonKey() final  ViewModel view;

/// Create a copy of ProjectModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProjectModelCopyWith<_ProjectModel> get copyWith => __$ProjectModelCopyWithImpl<_ProjectModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProjectModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProjectModel&&(identical(other.title, title) || other.title == title)&&(identical(other.uuid, uuid) || other.uuid == uuid)&&(identical(other.pattern, pattern) || other.pattern == pattern)&&(identical(other.canvas, canvas) || other.canvas == canvas)&&(identical(other.palette, palette) || other.palette == palette)&&(identical(other.view, view) || other.view == view));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,uuid,pattern,canvas,palette,view);

@override
String toString() {
  return 'ProjectModel(title: $title, uuid: $uuid, pattern: $pattern, canvas: $canvas, palette: $palette, view: $view)';
}


}

/// @nodoc
abstract mixin class _$ProjectModelCopyWith<$Res> implements $ProjectModelCopyWith<$Res> {
  factory _$ProjectModelCopyWith(_ProjectModel value, $Res Function(_ProjectModel) _then) = __$ProjectModelCopyWithImpl;
@override @useResult
$Res call({
 String title, String uuid, PatternModel pattern, CanvasModel canvas, PaletteModel palette, ViewModel view
});


@override $PatternModelCopyWith<$Res> get pattern;@override $CanvasModelCopyWith<$Res> get canvas;@override $PaletteModelCopyWith<$Res> get palette;@override $ViewModelCopyWith<$Res> get view;

}
/// @nodoc
class __$ProjectModelCopyWithImpl<$Res>
    implements _$ProjectModelCopyWith<$Res> {
  __$ProjectModelCopyWithImpl(this._self, this._then);

  final _ProjectModel _self;
  final $Res Function(_ProjectModel) _then;

/// Create a copy of ProjectModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? uuid = null,Object? pattern = null,Object? canvas = null,Object? palette = null,Object? view = null,}) {
  return _then(_ProjectModel(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,uuid: null == uuid ? _self.uuid : uuid // ignore: cast_nullable_to_non_nullable
as String,pattern: null == pattern ? _self.pattern : pattern // ignore: cast_nullable_to_non_nullable
as PatternModel,canvas: null == canvas ? _self.canvas : canvas // ignore: cast_nullable_to_non_nullable
as CanvasModel,palette: null == palette ? _self.palette : palette // ignore: cast_nullable_to_non_nullable
as PaletteModel,view: null == view ? _self.view : view // ignore: cast_nullable_to_non_nullable
as ViewModel,
  ));
}

/// Create a copy of ProjectModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PatternModelCopyWith<$Res> get pattern {
  
  return $PatternModelCopyWith<$Res>(_self.pattern, (value) {
    return _then(_self.copyWith(pattern: value));
  });
}/// Create a copy of ProjectModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CanvasModelCopyWith<$Res> get canvas {
  
  return $CanvasModelCopyWith<$Res>(_self.canvas, (value) {
    return _then(_self.copyWith(canvas: value));
  });
}/// Create a copy of ProjectModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaletteModelCopyWith<$Res> get palette {
  
  return $PaletteModelCopyWith<$Res>(_self.palette, (value) {
    return _then(_self.copyWith(palette: value));
  });
}/// Create a copy of ProjectModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ViewModelCopyWith<$Res> get view {
  
  return $ViewModelCopyWith<$Res>(_self.view, (value) {
    return _then(_self.copyWith(view: value));
  });
}
}

// dart format on
