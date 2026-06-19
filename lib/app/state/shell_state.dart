import 'package:flutter_riverpod/flutter_riverpod.dart';

class ShellState {
  const ShellState({required this.index, required this.triggerOnLeft});

  final int index;
  final bool triggerOnLeft;

  ShellState copyWith({int? index, bool? triggerOnLeft}) {
    return ShellState(
      index: index ?? this.index,
      triggerOnLeft: triggerOnLeft ?? this.triggerOnLeft,
    );
  }
}

class ShellController extends Notifier<ShellState> {
  @override
  ShellState build() => const ShellState(index: 0, triggerOnLeft: false);

  void setIndex(int index) {
    state = state.copyWith(index: index);
  }

  void setTriggerSide(bool triggerOnLeft) {
    state = state.copyWith(triggerOnLeft: triggerOnLeft);
  }
}

final shellStateProvider = NotifierProvider<ShellController, ShellState>(
  ShellController.new,
);
