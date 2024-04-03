part of 'home_bloc_bloc.dart';

@immutable
abstract class HomeBlocState {}

abstract class HomeActionState extends HomeBlocState {}

final class HomeBlocInitial extends HomeBlocState {}

final class HomeLoadingState extends HomeBlocState {}

final class HomeLoadedSuccessState extends HomeBlocState {
  final List<ProductDataModel> products;

  HomeLoadedSuccessState({required this.products});
}

final class HomeLoadingErrorState extends HomeBlocState {}

final class HomeNavigateToWishlistPageActionState extends HomeActionState {}

final class HomeNavigateToCartPageActionState extends HomeActionState {}

final class HomeProductItemWishlistedActionState extends HomeActionState {}

final class HomeProductItemCartedActionState extends HomeActionState {}
