// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'sold_product_report_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$SoldProductReportModelTearOff {
  const _$SoldProductReportModelTearOff();

// ignore: unused_element
  _SoldProductReportModel call(
      {String productName,
      int quantity,
      double totalPrice,
      double totalDiscount,
      double totalSold}) {
    return _SoldProductReportModel(
      productName: productName,
      quantity: quantity,
      totalPrice: totalPrice,
      totalDiscount: totalDiscount,
      totalSold: totalSold,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $SoldProductReportModel = _$SoldProductReportModelTearOff();

/// @nodoc
mixin _$SoldProductReportModel {
  String get productName;
  int get quantity;
  double get totalPrice;
  double get totalDiscount;
  double get totalSold;

  @JsonKey(ignore: true)
  $SoldProductReportModelCopyWith<SoldProductReportModel> get copyWith;
}

/// @nodoc
abstract class $SoldProductReportModelCopyWith<$Res> {
  factory $SoldProductReportModelCopyWith(SoldProductReportModel value,
          $Res Function(SoldProductReportModel) then) =
      _$SoldProductReportModelCopyWithImpl<$Res>;
  $Res call(
      {String productName,
      int quantity,
      double totalPrice,
      double totalDiscount,
      double totalSold});
}

/// @nodoc
class _$SoldProductReportModelCopyWithImpl<$Res>
    implements $SoldProductReportModelCopyWith<$Res> {
  _$SoldProductReportModelCopyWithImpl(this._value, this._then);

  final SoldProductReportModel _value;
  // ignore: unused_field
  final $Res Function(SoldProductReportModel) _then;

  @override
  $Res call({
    Object productName = freezed,
    Object quantity = freezed,
    Object totalPrice = freezed,
    Object totalDiscount = freezed,
    Object totalSold = freezed,
  }) {
    return _then(_value.copyWith(
      productName:
          productName == freezed ? _value.productName : productName as String,
      quantity: quantity == freezed ? _value.quantity : quantity as int,
      totalPrice:
          totalPrice == freezed ? _value.totalPrice : totalPrice as double,
      totalDiscount: totalDiscount == freezed
          ? _value.totalDiscount
          : totalDiscount as double,
      totalSold: totalSold == freezed ? _value.totalSold : totalSold as double,
    ));
  }
}

/// @nodoc
abstract class _$SoldProductReportModelCopyWith<$Res>
    implements $SoldProductReportModelCopyWith<$Res> {
  factory _$SoldProductReportModelCopyWith(_SoldProductReportModel value,
          $Res Function(_SoldProductReportModel) then) =
      __$SoldProductReportModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String productName,
      int quantity,
      double totalPrice,
      double totalDiscount,
      double totalSold});
}

/// @nodoc
class __$SoldProductReportModelCopyWithImpl<$Res>
    extends _$SoldProductReportModelCopyWithImpl<$Res>
    implements _$SoldProductReportModelCopyWith<$Res> {
  __$SoldProductReportModelCopyWithImpl(_SoldProductReportModel _value,
      $Res Function(_SoldProductReportModel) _then)
      : super(_value, (v) => _then(v as _SoldProductReportModel));

  @override
  _SoldProductReportModel get _value => super._value as _SoldProductReportModel;

  @override
  $Res call({
    Object productName = freezed,
    Object quantity = freezed,
    Object totalPrice = freezed,
    Object totalDiscount = freezed,
    Object totalSold = freezed,
  }) {
    return _then(_SoldProductReportModel(
      productName:
          productName == freezed ? _value.productName : productName as String,
      quantity: quantity == freezed ? _value.quantity : quantity as int,
      totalPrice:
          totalPrice == freezed ? _value.totalPrice : totalPrice as double,
      totalDiscount: totalDiscount == freezed
          ? _value.totalDiscount
          : totalDiscount as double,
      totalSold: totalSold == freezed ? _value.totalSold : totalSold as double,
    ));
  }
}

/// @nodoc
class _$_SoldProductReportModel implements _SoldProductReportModel {
  _$_SoldProductReportModel(
      {this.productName,
      this.quantity,
      this.totalPrice,
      this.totalDiscount,
      this.totalSold});

  @override
  final String productName;
  @override
  final int quantity;
  @override
  final double totalPrice;
  @override
  final double totalDiscount;
  @override
  final double totalSold;

  @override
  String toString() {
    return 'SoldProductReportModel(productName: $productName, quantity: $quantity, totalPrice: $totalPrice, totalDiscount: $totalDiscount, totalSold: $totalSold)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SoldProductReportModel &&
            (identical(other.productName, productName) ||
                const DeepCollectionEquality()
                    .equals(other.productName, productName)) &&
            (identical(other.quantity, quantity) ||
                const DeepCollectionEquality()
                    .equals(other.quantity, quantity)) &&
            (identical(other.totalPrice, totalPrice) ||
                const DeepCollectionEquality()
                    .equals(other.totalPrice, totalPrice)) &&
            (identical(other.totalDiscount, totalDiscount) ||
                const DeepCollectionEquality()
                    .equals(other.totalDiscount, totalDiscount)) &&
            (identical(other.totalSold, totalSold) ||
                const DeepCollectionEquality()
                    .equals(other.totalSold, totalSold)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(productName) ^
      const DeepCollectionEquality().hash(quantity) ^
      const DeepCollectionEquality().hash(totalPrice) ^
      const DeepCollectionEquality().hash(totalDiscount) ^
      const DeepCollectionEquality().hash(totalSold);

  @JsonKey(ignore: true)
  @override
  _$SoldProductReportModelCopyWith<_SoldProductReportModel> get copyWith =>
      __$SoldProductReportModelCopyWithImpl<_SoldProductReportModel>(
          this, _$identity);
}

abstract class _SoldProductReportModel implements SoldProductReportModel {
  factory _SoldProductReportModel(
      {String productName,
      int quantity,
      double totalPrice,
      double totalDiscount,
      double totalSold}) = _$_SoldProductReportModel;

  @override
  String get productName;
  @override
  int get quantity;
  @override
  double get totalPrice;
  @override
  double get totalDiscount;
  @override
  double get totalSold;
  @override
  @JsonKey(ignore: true)
  _$SoldProductReportModelCopyWith<_SoldProductReportModel> get copyWith;
}
