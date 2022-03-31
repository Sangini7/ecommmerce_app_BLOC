part of 'product_bloc.dart';

@immutable
abstract class ProductEvent {
  const ProductEvent();
  @override
  List<Object> get props => [];
}

class LoadProducts extends ProductEvent {}

class UpdateProducts extends ProductEvent {
  final List<Product> products;
  UpdateProducts({required this.products});
  @override
  List<Object> get props => [products];
}
