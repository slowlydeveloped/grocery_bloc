import 'package:flutter/material.dart';
import 'package:grocery_bloc/features/home/model/home_product_model.dart';
import 'package:grocery_bloc/features/wishlist/bloc/wishlist_bloc_bloc.dart';

class WishlistTileWidget extends StatelessWidget {
  final WishlistBlocBloc wishlistBlocBloc;
  final ProductDataModel productDataModel;
  const WishlistTileWidget(
      {super.key,
      required this.productDataModel,
      required this.wishlistBlocBloc});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          border: Border.all(), borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.maxFinite,
            height: 200,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(productDataModel.imageUrl, scale: 1))),
          ),
          Text(
            productDataModel.name,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(productDataModel.category),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Price: ₹ ${productDataModel.price}',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        // cartBloc.add(HomeProductWishlistClickedEvent(
                        //   clickedProduct: productDataModel
                        // ));
                      },
                      icon: const Icon(Icons.favorite)),
                  IconButton(
                      onPressed: () {
                        // homeBloc.add(HomeProductCartClickedEvent(
                        //   clickedProduct: productDataModel
                        // ));
                      },
                      icon: const Icon(Icons.shopping_bag_outlined))
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
