import 'package:flutter/material.dart';
import 'package:flutter_japanese_restaurant_app/core/app_asset.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
              padding: const EdgeInsets.all(30),
              child: Image.asset(
                AppAsset.profileImage,
                width: 300,
              )),
          Text(
            "Hello Sina!",
            style: Theme.of(context).textTheme.headline1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                AppAsset.githubImage,
                width: 60,
              ),
              const SizedBox(width: 10),
              Text(
                "https://github.com/SinaSys",
                style: Theme.of(context).textTheme.headline3,
              )
            ],
          )
        ],
      ),
    );
  }
}
