class Country {
  String countryCode;
  String countryName;
  String capitalCity;
  String region;
  int population;
  String currency;
  String flag;

  Country.fromJson(Map<String, dynamic> json) {
    countryCode = json['alpha3Code'];
    countryName = json['name'];
    capitalCity = json['capital'];
    region = json['region'];
    population = json['population'];
    currency = json['currencies'][0]['name'];
    flag = json['flag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['countryCode'] = this.countryCode;
    data['countryName'] = this.countryName;
    data['capitalCity'] = this.capitalCity;
    data['region'] = this.region;
    data['population'] = this.population;
    data['currency'] = this.currency;
    data['flag'] = this.flag;
    return data;
  }

}