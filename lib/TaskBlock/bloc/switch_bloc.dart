import 'package:equatable/equatable.dart';
import 'package:todo_app/TaskBlock/bloc_export.dart';

part 'switch_event.dart';
part 'switch_state.dart';

class SwitchBloc extends HydratedBloc<SwitchEvent, SwitchState> {
  SwitchBloc() : super(const SwitchInitial(isDark: false)) {
    on<SwitchOnEvent>((event, emit) {
      emit(const SwitchInitial(isDark: true));
    });
    on<SwitchOffEvent>((event, emit) {
      emit(const SwitchInitial(isDark: false));
    });
  }

  @override
  SwitchState? fromJson(Map<String, dynamic> json) {
    return SwitchState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(SwitchState state) {
    return state.toMap();
  }
}
