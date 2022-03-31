part of 'wishlist_bloc.dart';

abstract class WishlistEvent extends Equatable {
  const WishlistEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class StartWishlist extends WishlistEvent {}

class AddWishlistProduct extends WishlistEvent {
  final Product product;
  const AddWishlistProduct(this.product);
  @override
  // TODO: implement props
  List<Object?> get props => [product];
}

class DeleteWishlistProduct extends WishlistEvent {
  final Product product;
  const DeleteWishlistProduct(this.product);
  @override
  // TODO: implement props
  List<Object?> get props => [product];
}
