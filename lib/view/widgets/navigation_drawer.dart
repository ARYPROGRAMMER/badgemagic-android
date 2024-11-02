import 'package:flutter/material.dart';

class BMDrawer extends StatelessWidget {
  const BMDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.red,
            ),
            child: Center(
              child: Text(
                'Badge Magic',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          ListTile(
            dense: true,
            leading: const Icon(Icons.edit),
            title: const Text(
              'Create Badges',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
            onTap: () {
              // Check if the HomeScreen is already in the navigation stack
              if (Navigator.canPop(context) &&
                  ModalRoute.of(context)?.settings.name == '/') {
                // If it's already in the stack, pop to it
                Navigator.popUntil(context, ModalRoute.withName('/'));
              } else {
                // Otherwise, navigate to HomeScreen
                Navigator.pushNamed(context, '/');
              }
            },
          ),
          ListTile(
            dense: true,
            leading: Image.asset(
              "assets/icons/signature.png",
              height: 18,
              color: Colors.black,
            ),
            title: const Text(
              'Draw Clipart',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 14,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/drawBadge',
                (route) => route.isFirst,
              );
            },
          ),
          ListTile(
            dense: true,
            leading: Image.asset(
              "assets/icons/r_save.png",
              height: 18,
              color: Colors.black,
            ),
            title: const Text(
              'Saved Badges',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/savedBadge',
                (route) => route.isFirst,
              );
            },
          ),
          ListTile(
            dense: true,
            leading: Image.asset(
              "assets/icons/r_save.png",
              height: 18,
              color: Colors.black,
            ),
            title: const Text(
              'Saved Cliparts',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/savedClipart',
                (route) => route.isFirst,
              );
            },
          ),
          ListTile(
            dense: true,
            leading: Image.asset(
              "assets/icons/setting.png",
              height: 18,
              color: Colors.black,
            ),
            title: const Text(
              'Settings',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/settings',
                (route) => route.isFirst,
              );
            },
          ),
          ListTile(
            dense: true,
            leading: Image.asset(
              "assets/icons/r_team.png",
              height: 18,
              color: Colors.black,
            ),
            title: const Text(
              'About Us',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/aboutUs',
                (route) => route.isFirst,
              );
            },
          ),
          const Divider(),
          const Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
                child: Text(
                  'Other',
                  style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
          ListTile(
            dense: true,
            leading: Image.asset(
              "assets/icons/r_price.png",
              height: 18,
              color: Colors.black,
            ),
            title: const Text(
              'Buy Badge',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/buyBadge',
                (route) => route.isFirst,
              );
            },
          ),
          ListTile(
            dense: true,
            leading: const Icon(
              Icons.share,
              color: Colors.black,
            ),
            title: const Text(
              'Share',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/share',
                (route) => route.isFirst,
              );
            },
          ),
          ListTile(
            dense: true,
            leading: const Icon(
              Icons.star,
              color: Colors.black,
            ),
            title: const Text(
              'Rate Us',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/rateUs',
                (route) => route.isFirst,
              );
            },
          ),
          ListTile(
            dense: true,
            leading: Image.asset(
              "assets/icons/r_virus.png",
              height: 18,
              color: Colors.black,
            ),
            title: const Text(
              'Feedback/Bug Reports',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/feedback',
                (route) => route.isFirst,
              );
            },
          ),
          ListTile(
            dense: true,
            leading: Image.asset(
              "assets/icons/r_insurance.png",
              height: 18,
              color: Colors.black,
            ),
            title: const Text(
              'Privacy Policy',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/privacyPolicy',
                (route) => route.isFirst,
              );
            },
          ),
        ],
      ),
    );
  }
}
