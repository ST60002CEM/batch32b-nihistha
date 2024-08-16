
import 'package:adoptapet/feature/root/presentation/navigator/root_navigator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final rootViewModelProvider = Provider<RootViewModel>((ref) {
  final navigator = ref.read(rootNavigationProvider);
  return RootViewModel(navigator);
});

class RootViewModel{
  final RootNavigator navigator;
  RootViewModel(this.navigator);

  void openRootView(String id){
    navigator.openMailNavigatorView();
  }
}