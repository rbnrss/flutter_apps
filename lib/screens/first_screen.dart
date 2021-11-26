import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../components/category_buttons.dart';
import '../components/constants.dart';
import '../components/state_manager.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({
    Key? key,
  }) : super(key: key);

  double opacity(context) {
    double _opacity = 0;
    if (Provider.of<StateManager>(context).index == 0) {
      _opacity = 1.0;
    } else if (Provider.of<StateManager>(context).index == 1) {
      _opacity = 0;
    }
    return _opacity;
  }

  @override
  Widget build(BuildContext context) {
    int currentIndex = Provider.of<StateManager>(context).index;
    return Stack(
      children: [
        AnimatedPositioned(
          top: currentIndex == 0 ? 30.0 : 0,
          duration: const Duration(milliseconds: 300),
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            opacity: currentIndex == 0 ? 1 : 0,
            child: Container(
              height: MediaQuery.of(context).size.height * .15,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 40.0,
                    width: 100.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        color: Colors.white,
                        border: Border.all(
                          color: kGreyShade,
                          width: 1.5,
                        )),
                    child: Center(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        FaIcon(
                          FontAwesomeIcons.cog,
                          size: 16.0,
                        ),
                        Text('  Settings'),
                      ],
                    )),
                  ),
                  const CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 35.0,
                    child: CircleAvatar(
                      radius: 30.0,
                      backgroundImage: NetworkImage(
                          'https://images.unsplash.com/photo-1474978528675-4a50a4508dc3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        AnimatedPositioned(
          duration: const Duration(milliseconds: 300),
          top: currentIndex == 0 ? 180.0 : 80,
          left: MediaQuery.of(context).size.width * .2,
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            opacity: opacity(context),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * .6,
              child: Column(
                children: const [
                  Text(
                    'Welcome back, Robin',
                    style: TextStyle(
                        color: kCustomBlue,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w700),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 15.0),
                    child: Text(
                      'What are you\n looking for?',
                      style: kHeadingText,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        AnimatedPositioned(
          duration: const Duration(milliseconds: 500),
          bottom: currentIndex == 0 ? 0 : -500.0,
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 500),
            opacity: opacity(context),
            child: Container(
              padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0),
              child: GridView.count(
                crossAxisCount: 3,
                children: const [
                  CategoryImageButton(
                      src:
                          'https://cdn-icons-png.flaticon.com/512/4614/4614200.png',
                      label: 'Hairstyling'),
                  CategoryImageButton(
                      src:
                          'https://cdn-icons-png.flaticon.com/512/1995/1995573.png',
                      label: 'Barber'),
                  CategoryImageButton(
                      src:
                          'https://cdn-icons-png.flaticon.com/512/1940/1940922.png',
                      label: 'Make-up'),
                  CategoryImageButton(
                      src:
                          'https://cdn-icons-png.flaticon.com/512/3501/3501241.png',
                      label: 'Cosmetics'),
                  CategoryImageButton(
                      src:
                          'https://cdn-icons-png.flaticon.com/512/452/452757.png',
                      label: 'Nails'),
                  CategoryImageButton(
                      src:
                          'https://cdn-icons-png.flaticon.com/512/622/622669.png',
                      label: 'Other'),
                ],
              ),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * .45,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25.0),
                  topRight: Radius.circular(25.0),
                ),
              ),
            ),
          ),
        ),
        AnimatedPositioned(
          duration: const Duration(milliseconds: 500),
          bottom: currentIndex == 0 ? 15 : -100.0,
          left: MediaQuery.of(context).size.width * .05,
          child: Container(
            height: 60.0,
            decoration: const BoxDecoration(
              color: kGreyShade,
            ),
            width: MediaQuery.of(context).size.width * .9,
            child: ListTile(
              leading: const Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: FaIcon(
                  FontAwesomeIcons.calendarAlt,
                  color: kCustomBlue,
                  size: 28.0,
                ),
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Tomorrow at 12:30',
                    style: kAppointmentTimeTextStyle,
                  ),
                  Text('Hairstyling at Salon Name')
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
