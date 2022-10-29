part of 'productlist_bloc.dart';

@immutable
abstract class ProductlistEvent {}

class GetProductList extends ProductlistEvent {
  final String subCategoryID;
  GetProductList({required this.subCategoryID});
}
