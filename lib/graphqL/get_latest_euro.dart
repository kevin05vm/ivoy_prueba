class GetLatestEuro {
  static String getLatestEuro = """
  query LatestEuro{
    latest(baseCurrency: "EUR", quoteCurrencies: ["USD", "CHF", "HKD"]) {
      date
      baseCurrency
      quoteCurrency
      quote
    }
  }
  """;
}
