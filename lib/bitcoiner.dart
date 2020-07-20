import 'package:flutter/cupertino.dart';

import 'networking.dart';

const apiKey = 'E562644C-3336-4884-B364-311B59EBB209';
const apiKey1 = '9F61B3D6-8667-42C6-9665-46523919A488';
const CoinAPI = 'https://rest.coinapi.io/v1/exchangerate';

class Bitcoiner {
  Future<dynamic> getExchangeData(
      {@required String crebto, @required String normal}) async {
    NetworkHelper NH =
        NetworkHelper(url: '$CoinAPI/$crebto/$normal?apikey=$apiKey1');
    var coinData = await NH.getData();
    return coinData;
  }

//  Future<dynamic> getCityWeather(String city) async {
//    NetworkHelper NH =
//        NetworkHelper(url: '$CoinAPI?q=$city&appid=$apiKey&units=metric');
//    var weatherData = await NH.getData();
//    return weatherData;
//  }
}
