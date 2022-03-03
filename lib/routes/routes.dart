import 'package:cropify/screens/welcome_screen.dart';
import 'package:get/get.dart';

class GetPages {
  static List<GetPage> init() {
    return <GetPage>[GetPage(name: "/", page: () => const WelcomeScreen())];
  }
}
