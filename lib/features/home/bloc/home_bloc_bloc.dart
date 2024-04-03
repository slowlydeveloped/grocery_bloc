import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:grocery_bloc/data/cart_items.dart';
import 'package:grocery_bloc/data/grocery_data.dart';
import 'package:grocery_bloc/data/wishlist_items.dart';
import 'package:grocery_bloc/features/home/model/home_product_model.dart';
import 'package:meta/meta.dart';

part 'home_bloc_event.dart';
part 'home_bloc_state.dart';

class HomeBlocBloc extends Bloc<HomeBlocEvent, HomeBlocState> {
  HomeBlocBloc() : super(HomeBlocInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeProductWishlistClickedEvent>(homeProductWishlistClickedEvent);
    on<HomeWishlistButtonNavigateEvent>(homeWishlistButtonNavigateEvent);
    on<HomeCartButtonNavigateEvent>(homeCartButtonNavigateEvent);
    on<HomeProductCartClickedEvent>(homeProductCartClickedEvent);
  }

  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeBlocState> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(Duration(seconds: 3));
    emit(HomeLoadedSuccessState(
        products: GroceryData()
            .groceryItems
            .map((e) => ProductDataModel(
                name: e['name'],
                quantity: e['quantity'],
                price: e['pricePerUnit'],
                category: e['category'],
                imageUrl: e['image']))
            .toList()));
  }

  FutureOr<void> homeProductWishlistClickedEvent(
      HomeProductWishlistClickedEvent event, Emitter<HomeBlocState> emit) {
    print("Wishlist product clicked");
    wishlistitems.add(event.clickedProduct);
    emit(HomeProductItemWishlistedActionState());
  }

  FutureOr<void> homeProductCartClickedEvent(
      HomeProductCartClickedEvent event, Emitter<HomeBlocState> emit) {
    print("Cart product clicked");
    cartItems.add(event.clickedProduct);
    emit(HomeProductItemCartedActionState());
  }

  FutureOr<void> homeWishlistButtonNavigateEvent(
      HomeWishlistButtonNavigateEvent event, Emitter<HomeBlocState> emit) {
    print("Wishlist clicked");
    emit(HomeNavigateToWishlistPageActionState());
  }

  FutureOr<void> homeCartButtonNavigateEvent(
      HomeCartButtonNavigateEvent event, Emitter<HomeBlocState> emit) {
    print("Cart clicked");
    emit(HomeNavigateToCartPageActionState());
  }
}
