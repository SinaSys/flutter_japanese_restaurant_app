part of 'category_bloc.dart';

class CategoryEvent extends Equatable {
  final FoodCategory category;

  @override
  List<Object?> get props => [category];

  const CategoryEvent({required this.category});
}
