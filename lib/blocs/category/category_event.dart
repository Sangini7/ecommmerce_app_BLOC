part of 'category_bloc.dart';

@immutable
abstract class CategoryEvent {
  const CategoryEvent();
  @override
  List<Object> get props => [];
}

class LoadCategories extends CategoryEvent {}

class UpdateCategories extends CategoryEvent {
  final List<Category> categories;
  UpdateCategories({required this.categories});
  @override
  List<Object> get props => [categories];
}
