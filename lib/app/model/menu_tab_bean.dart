import 'enum.dart';

class MenuTabBean {
  int icon;
  String name;
  ActionType value;

  MenuTabBean({required this.icon, required this.name, this.value = ActionType.GROUP_CHAT});
}
