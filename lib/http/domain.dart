class Domain {

  Domain._privateConstructor();

  static final Domain _instance = Domain._privateConstructor();

  static Domain get instance => _instance;

  // CoinCap Pro API v3 base URL
  final String coinGap = "https://rest.coincap.io";
  
  // Add your API key here or load from environment
  // Get your API key from: https://pro.coincap.io/dashboard
  final String? apiKey = "bdab8afc09738820d1b38803612ac4375811a041221e1c955cf120daa928e431";
  
}