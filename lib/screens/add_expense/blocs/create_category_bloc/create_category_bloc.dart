import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'create_category_event.dart';
part 'create_category_state.dart';

class CreateCategoryBloc extends Bloc<CreateCategoryEvent, CreateCategoryState> {
  CreateCategoryBloc() : super(CreateCategoryInitial()) {
    on<CreateCategoryEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
