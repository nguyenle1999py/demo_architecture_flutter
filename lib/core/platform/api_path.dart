enum APIPath {
  fetch_user,
  login,
  login_facebook,
  login_google,
  check_register,
  register,
}

class APIPathHelper{
  static String getValue(APIPath path){
    switch(path) {
      case APIPath.fetch_user:
        return '/user';
      case APIPath.login:
        return '/auth/login';
      case APIPath.login_facebook:
        return '/auth/loginfacebook';
      case APIPath.login_google:
        return '/auth/logingoogle';
      case APIPath.check_register:
        return '/auth/checkregister';
      case APIPath.register:
        return '/auth/register';
      default:
        return '';
    }
  }
}
