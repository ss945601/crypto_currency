class Domain {

  Domain._privateConstructor();

  static final Domain _instance = Domain._privateConstructor();

  static Domain get instance => _instance;

  final String coinGap = "http://api.coincap.io";
  
}