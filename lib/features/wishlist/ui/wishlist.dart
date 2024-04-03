import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_bloc/features/wishlist/bloc/wishlist_bloc_bloc.dart';
import 'package:grocery_bloc/features/wishlist/ui/wishlist_tile_widget.dart';

class MyWishlist extends StatefulWidget {
  const MyWishlist({super.key});

  @override
  State<MyWishlist> createState() => _MyWishlistState();
}

class _MyWishlistState extends State<MyWishlist> {
  final WishlistBlocBloc wishlistBlocBloc = WishlistBlocBloc();

  @override
  void initState() {
    wishlistBlocBloc.add(WishlistInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products Page"),
      ),
      body: BlocConsumer<WishlistBlocBloc, WishlistBlocState>(
        bloc: wishlistBlocBloc,
        listener: (context, state) {},
        builder: (context, state) {
          switch (state.runtimeType) {
            case WishlistSuccessState:
              final succesState = state as WishlistSuccessState;
              return ListView.builder(
                  itemCount: succesState.wishlistItems.length,
                  itemBuilder: (context, index) {
                    return WishlistTileWidget(
                        wishlistBlocBloc: wishlistBlocBloc,
                        productDataModel: succesState.wishlistItems[index]);
                  });
            default:
          }
          return Container();
        },
      ),
    );
  }
}
