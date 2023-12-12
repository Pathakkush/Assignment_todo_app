part of 'switch_bloc.dart';

class SwitchState extends Equatable {
  final bool isDark;
  const SwitchState({required this.isDark});

  @override
  List<Object> get props => [isDark];

  Map<String, dynamic> toMap() {
    return {
      'isDark': isDark,
    };
  }

  factory SwitchState.fromMap(Map<String, dynamic> map) {
    return SwitchState(
      isDark: map['isDark'] ?? false,
    );
  }
}

final class SwitchInitial extends SwitchState {
  const SwitchInitial({required bool isDark}) : super(isDark: isDark);
}
