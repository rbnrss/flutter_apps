import 'package:bookme/components/state_manager.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'constants.dart';

class ListCard extends StatelessWidget {
  final String imageSource;
  final String salonName;
  final String services;
  final int ratings;
  final double price;
  final int time;
  final int? animateDuration;

  const ListCard(
      {Key? key,
      required this.imageSource,
      required this.salonName,
      required this.services,
      required this.ratings,
      required this.price,
      required this.time,
      this.animateDuration})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    int index = Provider.of<StateManager>(context).index;
    return AnimatedOpacity(
      duration: Duration(milliseconds: animateDuration ?? 500),
      opacity: index == 1 ? 1 : 0,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 5.0),
        child: Container(
          height: 300,
          color: Colors.transparent,
          alignment: Alignment.center,
          child: Card(
            elevation: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30.0, bottom: 30),
                  child: CircleAvatar(
                    radius: 50.0,
                    backgroundImage: NetworkImage(imageSource),
                    // child: CachedNetworkImage(
                    //   placeholder: (context, url) =>
                    //       const CircularProgressIndicator(),
                    //   imageUrl: imageSource,
                    // ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Text(
                    salonName,
                    style: kSalonName,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Text(services),
                ),
                const Divider(
                  height: 1.0,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 30.0, top: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const FaIcon(
                          FontAwesomeIcons.tag,
                          color: Colors.grey,
                        ),
                        Text(
                          ' From \$${price}0    ',
                          style: kSalonPrice,
                        ),
                        const Icon(
                          Icons.schedule,
                          color: Colors.grey,
                        ),
                        Text(
                          ' $time mins   ',
                          style: kSalonPrice,
                        ),
                        const FaIcon(
                          FontAwesomeIcons.star,
                          color: Colors.grey,
                          size: 18.0,
                        ),
                        Text(
                          ' $ratings/5',
                          style: kSalonPrice,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
