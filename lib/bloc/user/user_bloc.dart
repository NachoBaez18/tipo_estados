import 'package:bloc/bloc.dart';
import 'package:estado_app/models/usuario.dart';
import 'package:meta/meta.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(const UserInitailState()) {
    on<ActivateUser>((event, emit) => emit(
          UserSetState(event.user),
        ));

    on<DeleteUser>((event, emit) => emit(
          const UserInitailState(),
        ));

    on<ChangeUserAge>((event, emit) {
      if (!state.existUser) return;
      emit(UserSetState(state.user!.copyWith(edad: event.age)));
    });

    on<AddProfession>((event, emit) {
      if (!state.existUser) return;
      final profesionNew = [...state.user!.profesiones, event.profesion];
      emit(UserSetState(state.user!.copyWith(profesiones: profesionNew)));
    });
  }
}
