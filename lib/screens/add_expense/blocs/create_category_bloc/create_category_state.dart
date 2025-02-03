part of 'create_category_bloc.dart';

sealed class CreateCategoryState extends Equatable {
  const CreateCategoryState();
  
  @override
  List<Object> get props => [];
}

final class CreateCategoryInitial extends CreateCategoryState {}
