import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../components/constants.dart';
import '../components/list_card.dart';
import '../components/sliver_app_bar.dart';
import '../components/state_manager.dart';

class SecondScreen extends StatelessWidget {
  final List<String> descriptions = ['Services', 'About', 'Gallery'];

  SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void salonListScreen(context, index) {
      // Navigator.of(context).pushNamed(SalonBooking.id, arguments: index);
    }

    return Scaffold(
      backgroundColor: kGreyShade,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 80.0,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            const Expanded(
              child: SizedBox(
                width: 10.0,
              ),
            ),
            const Expanded(
              flex: 10,
              child: Text(
                'Discover',
                textAlign: TextAlign.center,
                style: kAppBarTextStyle,
              ),
            ),
            Expanded(
                child: Image.network(
              'https://cdn-icons-png.flaticon.com/512/54/54481.png',
              fit: BoxFit.fitHeight,
            ))
          ],
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            toolbarHeight: 80.0,
            backgroundColor: Colors.white,
            title: Row(
              children: const [
                SliverAppBarComponents(icon: Icons.cut, label: 'HairStyling'),
                SliverAppBarComponents(
                    icon: Icons.calendar_today_outlined, label: 'Any date'),
                SliverAppBarComponents(
                    icon: FontAwesomeIcons.tags, label: 'Any pricing'),
              ],
            ),
          ),
          Consumer<StateManager>(
            builder: (context, salonData, child) => SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return GestureDetector(
                    child: ListCard(
                      animateDuration: 1000 * index,
                      salonName: salonData.salons[index]['title'],
                      ratings: salonData.salons[index]['ratings'],
                      services: salonData.salons[index]['service'],
                      time: salonData.salons[index]['time'],
                      price: salonData.salons[index]['price'],
                      imageSource: salonData.salons[index]['image'],
                    ),
                    onTap: () {
                      salonListScreen(context, index);
                    },
                  );
                },
                childCount: 4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
