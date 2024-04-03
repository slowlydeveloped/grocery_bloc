import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_bloc/features/cart/bloc/cart_bloc.dart';
import 'package:grocery_bloc/features/cart/ui/cart_tile_widget.dart';

class MyCart extends StatefulWidget {
  const MyCart({super.key});

  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  final CartBloc cartBloc = CartBloc();

  @override
  void initState() {
    cartBloc.add(CartInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Cart Items"),
        ),
        body: BlocConsumer<CartBloc, CartState>(
          bloc: cartBloc,
          listenWhen: (previous, current) => current is CartActionState,
          buildWhen: (previous, current) => current is! CartActionState,
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            switch (state.runtimeType) { 
              case CartSuccessState:
                final succesState = state as CartSuccessState;
                return ListView.builder(
                    itemCount: succesState.cartItems.length,
                    itemBuilder: (context, index) {
                      return CartTileWidget(
                          cartBloc: cartBloc,
                          productDataModel: succesState.cartItems[index]);
                    });
              default:
            }
            return Container();
          },
        ));
  }
}
