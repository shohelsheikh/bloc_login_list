part of 'productlist_bloc.dart';

@immutable
abstract class ProductlistState {}

class ProductlistInitial extends ProductlistState {}

class ProductlistLoading extends ProductlistState {}

class ProductlistLoaded extends ProductlistState {
  final ProductList? productList;
  ProductlistLoaded({this.productList});
}

class ProductlistFailed extends ProductlistState {}
