import 'package:get/get.dart';

/// All strings and translations goes here.
class Str extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          "app_name": 'Wizdom',
          "join_wizdom": 'Join Wizdom.',
          "sign_up_with_google": 'Sign up with Google',
          "sign_up_with_facebook": 'Sign up with Facebook',
          "sign_up_with_email": 'Sign up with Email',
        },
        'hi_IN': {
          "join_wizdom": 'विजडम से जुड़ें।',
        }
      };
}
