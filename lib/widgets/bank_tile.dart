import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

class BankTile extends StatefulWidget {
  final String name;
  final String image;
  final String buy;
  final String sell;

  const BankTile({
    Key? key,
    required this.name,
    required this.image,
    required this.buy,
    required this.sell,
  }) : super(key: key);

  @override
  _BankTileState createState() => _BankTileState();
}

class _BankTileState extends State<BankTile> {
  Color? c;
  Future<Color> getPalGen() async {
    PaletteGenerator paletteGenerator =
        await PaletteGenerator.fromImageProvider(AssetImage(widget.image));
    return paletteGenerator.lightVibrantColor!.color;
  }

  @override
  void initState() {
    getPalGen().then((value) {
      c = value;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 30.0),
      decoration: BoxDecoration(
        color: c,
      ),
      child: Row(
        children: [
          Image(
            image: AssetImage(widget.image),
            width: 40.0,
          ),
          SizedBox(width: 10.0),
          Expanded(
            flex: 4,
            child: Text(
              '${widget.name}',
              style: TextStyle(color: Colors.white, fontSize: 28.0),
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              children: [
                Text(
                  'buy',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Text(
                  '${widget.buy}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28.0,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 10.0),
          Expanded(
            flex: 2,
            child: Column(
              children: [
                Text(
                  'sell',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Text(
                  '${widget.sell}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28.0,
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
