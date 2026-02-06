
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_state_provider.g.dart';

@riverpod
class AppState extends _$AppState {
  @override
  AppStateType build() {
    return AppStateType.home;
  }

  void set(AppStateType newState) {
    state = newState;
    if (newState == AppStateType.chart){
    }
  }
}

enum AppStateType { home, edit, chart }
