part of 'wishlist_bloc_bloc.dart';

@immutable
abstract class WishlistBlocEvent {}

class WishlistInitialEvent extends WishlistBlocEvent {}

class WishlistRemovefromWishlistEvent extends WishlistBlocEvent{}
