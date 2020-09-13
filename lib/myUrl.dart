class MyUrl {
  static String url(String endPoint) {
    if (endPoint.substring(0, 1) == "/") endPoint = endPoint.substring(1);

    return "http://0.0.0.0:5000/$endPoint";
  }
}