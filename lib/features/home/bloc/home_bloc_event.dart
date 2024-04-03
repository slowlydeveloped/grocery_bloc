part of 'home_bloc_bloc.dart';

@immutable
sealed class HomeBlocEvent {}

class HomeInitialEvent extends HomeBlocEvent {}

class HomeProductWishlistClickedEvent extends HomeBlocEvent {
  final ProductDataModel clickedProduct;

  HomeProductWishlistClickedEvent({required this.clickedProduct});

}

class HomeProductCartClickedEvent extends HomeBlocEvent {
  final ProductDataModel clickedProduct;

  HomeProductCartClickedEvent({required this.clickedProduct});
}

class HomeWishlistButtonNavigateEvent extends HomeBlocEvent {}

class HomeCartButtonNavigateEvent extends HomeBlocEvent {}
