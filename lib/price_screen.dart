import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'bitcoiner.dart';
import 'coin_data.dart';
import 'coin_data.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  Bitcoiner coin = Bitcoiner();
  String selectedCurrency = 'USD';
  int exchangeRate = 0;
  String cryptoCurrency = 'BTC';
  List<Text> getDDItems() {
    List<Text> dropdownItems = [];
    for (String currency in currenciesList)
      dropdownItems.add(Text(
        currency,
        style: TextStyle(color: Colors.white),
      ));
    return dropdownItems;
  }

  List<Text> getCDItems() {
    List<Text> dropdownItems = [];
    for (String currency in cryptoList)
      dropdownItems.add(Text(
        currency,
        style: TextStyle(color: Colors.white),
      ));
    return dropdownItems;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('🤑 Coin Ticker')),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Column(
              children: <Widget>[
                Card(
                  color: Colors.lightBlueAccent,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                    child: Text(
                      '1 $cryptoCurrency = $exchangeRate $selectedCurrency',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: CupertinoPicker(
                    itemExtent: 32,
                    onSelectedItemChanged: (selectedIndex) async {
                      var coinData = await Bitcoiner().getExchangeData(
                          crebto: cryptoCurrency, normal: selectedCurrency);
                      setState(() {
                        cryptoCurrency = cryptoList[selectedIndex];
                        exchangeRate = coinData['rate'].toInt();
                      });
                    },
                    children: getCDItems(),
                    backgroundColor: Colors.lightBlue,
                  ),
                ),
                Expanded(
                  child: CupertinoPicker(
                    itemExtent: 32,
                    onSelectedItemChanged: (selectedIndex) async {
                      var coinData = await Bitcoiner().getExchangeData(
                          crebto: cryptoCurrency, normal: selectedCurrency);
                      setState(() {
                        exchangeRate = coinData['rate'].toInt();
                        selectedCurrency = currenciesList[selectedIndex];
                      });
                    },
                    children: getDDItems(),
                    backgroundColor: Colors.lightBlue,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
