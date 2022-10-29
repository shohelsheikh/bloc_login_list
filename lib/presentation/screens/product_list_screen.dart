import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:module1/business_logic/bloc/product_list_bloc/productlist_bloc.dart';
import 'package:module1/data/model/product_list.dart';
import 'package:module1/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductListScreen extends StatelessWidget {
  String? mobileNo;

  ProductListScreen({Key? key, required this.mobileNo}) : super(key: key);
  List<ProductListElement> productList = [];

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ProductlistBloc>(context).add(
      GetProductList(subCategoryID: '2'),
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('List'),
        actions: [
          InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return ElevatedButton(
                    onPressed: () async {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      prefs.clear();
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => MyApp(),
                        ),
                      );
                    },
                    child: const Text('Logout'),
                  );
                },
              );
            },
            child: const CircleAvatar(
              backgroundImage: NetworkImage(
                'https://placeimg.com/480/480/any',
              ),
            ),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Logged in as $mobileNo",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              flex: 1,
              child: BlocBuilder<ProductlistBloc, ProductlistState>(
                builder: (context, state) {
                  if (state is ProductlistLoaded) {
                    productList = state.productList!.productList!;
                    return ListView.builder(
                      itemBuilder: (context, index) {
                        return ListItem(product: productList[index]);
                      },
                      itemCount: productList.length,
                    );
                  }
                  if (state is ProductlistLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return Container();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  const ListItem({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductListElement product;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(product.productName!),
      subtitle: Text(product.productStatus!),
      leading: CircleAvatar(
        child: Text(
          product.productId.toString(),
        ),
      ),
      trailing: TextButton(
        onPressed: () {
          showDialog(
            context: context,
            barrierDismissible: true,
            builder: (context) {
              return AlertDialog(
                title: const Text('Images'),
                content: SingleChildScrollView(
                  child: ListBody(
                    children: [
                      /* product.productImage1 ==""? */
                      Image.asset(
                          "assets/images/noImage.jpeg") /* :Image.network(product.productImage1!) */,
                    ],
                  ),
                ),
                actions: [
                  TextButton(
                    child: const Text('Ok'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        },
        child: const Text("Show Image"),
      ),
    );
  }
}
