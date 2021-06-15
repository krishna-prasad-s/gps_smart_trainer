import 'package:flutter/material.dart';

class myLayout extends StatefulWidget {
  const myLayout({Key? key}) : super(key: key);

  @override
  _myLayoutState createState() => _myLayoutState();
}

class _myLayoutState extends State<myLayout> {

  @override
  Widget build(BuildContext context) {

    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(bottom: 8),
                child: Text(
                  'Yeno ondu irali gotagakke',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                'Mysuru in Karunadu',
                style: TextStyle(
                  color: Colors.deepOrange[500],
                ),
              )
            ],
          ),
          ),
          Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          Text('41'),
        ],
      ),
    );

    Column _buildButtonColumn(Color color, IconData icon, String label) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color),
          Container(
            margin: const EdgeInsets.only(top: 8),
            child: Text(
              label,
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: color
              ),
            ),
          ),
        ],
      );
    }

    Color pColor = Theme
        .of(context)
        .primaryColor;

    Widget buttonSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButtonColumn(pColor, Icons.ac_unit, "Chill"),
          _buildButtonColumn(pColor, Icons.airline_seat_flat_angled_outlined, "angle"),
          _buildButtonColumn(pColor, Icons.wash_sharp, "wash"),
        ],
      ),
    );

    Widget textSection = Container(
      padding: EdgeInsets.all(32),
      child: Text(
        'Lake Thonnur lies to the south of malkote and north of pandavapura'
            'Tippu sultan called it Moti Talab'
            'It seems that he was boating and one of his pearl drops fell into the lake'
            'the lake was so clear he could see his pearl at the bottom of the lake'
            'Thus, the Thonnur lake got another name Moti Talab.',
            softWrap: true,
      )
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Location'),
      ),
      body: Column(
        children: [
          Image.asset(
            'images/lake.jpeg',
            width: 600,
            height: 240,
            fit: BoxFit.cover,
          ),
          titleSection,
          buttonSection,
          textSection,

        ],
      ),
    );
  }
}
