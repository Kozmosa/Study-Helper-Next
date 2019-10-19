class GlobalVars {
  String token = '';
  String rootServer = '';
  Map<String, List> users = {
    'users': [
      {'username': 'root', 'password': 'password'}
    ]
  };
  _globalVars(){
    // nothing
    this.token = 'xx';
  }
}