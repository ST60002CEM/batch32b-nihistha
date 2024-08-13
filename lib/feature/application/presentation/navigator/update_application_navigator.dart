import '../../../../app/navigator/navigator.dart';
import '../view/update_application_view.dart';

class UpdateApplicationNavigator{}
mixin UpdateApplicationViewRoute{
  void openUpdateApplicationView(String id){
    NavigateRoute.pushRoute(UpdateApplicationView(id: id));
  }
}