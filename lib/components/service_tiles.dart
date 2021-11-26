import 'package:flutter/material.dart';
import 'constants.dart';

class ServiceTile extends StatelessWidget {
  final String serviceText;
  final String priceText;

  const ServiceTile(
      {Key? key, required this.serviceText, required this.priceText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding:
          const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
      tileColor: Colors.white,
      leading: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(serviceText,
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 12.0)),
          Text(priceText)
        ],
      ),
      trailing: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          onPrimary: kCustomBlue,
          primary: kGreyShade,
        ),
        onPressed: () {},
        child: const Text(
          'Book now',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.0),
        ),
      ),
    );
  }
}
