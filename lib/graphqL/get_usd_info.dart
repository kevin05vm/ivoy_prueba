class GetUsdInfo {
  static String getUsdInfo = '''
  query USDInfo(\$name: [String!]) {
    currencies(currencyCodes: \$name) {
       code
        name
        numericCode
        decimalDigits
        active
    }
  }
  ''';
}
