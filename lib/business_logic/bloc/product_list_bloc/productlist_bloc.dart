import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:module1/data/dataproviders/network/api_call.dart';
import 'package:module1/data/model/product_list.dart';

part 'productlist_event.dart';
part 'productlist_state.dart';

class ProductlistBloc extends Bloc<ProductlistEvent, ProductlistState> {
  ProductlistBloc() : super(ProductlistInitial());

  @override
  Stream<ProductlistState> mapEventToState(
    ProductlistEvent event,
  ) async* {
    if (event is GetProductList) {
      yield ProductlistLoading();
      ProductList? productList = await Api.getProductList(event.subCategoryID);
      if (productList == null) {
        yield ProductlistFailed();
      } else if (productList.status == "1") {
        yield ProductlistLoaded(productList: productList);
      }
    }
  }
}
