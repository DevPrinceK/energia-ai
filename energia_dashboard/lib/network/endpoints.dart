class APIEndpoints {
  static const String baseUrl = "http://192.168.137.1:8000/"; //no vpn ip
  static const String login = "${baseUrl}account/login/";
  static const String powerByAllRegions = "${baseUrl}api/power-by-all-regions/";
  static const String predictPowerOutage = "${baseUrl}api/predict-outage/";
}
