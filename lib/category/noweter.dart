import 'package:flutter/material.dart';

class NoWeaterbody extends StatelessWidget {
  const NoWeaterbody({super.key,});
  
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('There is No Weather  😞 Start ',
                style: TextStyle(
                    fontSize: 25,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold)),
            Text('searching now 🔍 ',
                style: TextStyle(
                    fontSize: 25,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
