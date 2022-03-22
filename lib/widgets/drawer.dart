import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final imageUrl =
        "https://storage.googleapis.com/cms-storage-bucket/70760bf1e88b184bb1bc.png";
    return Drawer(
      child: Container(
        color: Colors.deepPurple,
        child: ListView(
          children: [
            DrawerHeader(
              margin: EdgeInsets.zero,
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                margin: EdgeInsets.zero,
                accountEmail: Text(
                  "santanu@gmail.com",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                accountName: Text(
                  "Santanu Agarwal",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(imageUrl),
                ),
              ),
            ),
            Divider(
              thickness: 2,
              color: Colors.black12,
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.home,
                color: Colors.white,
              ),
              title: Text(
                "Home",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.profile_circled,
                color: Colors.white,
              ),
              title: Text(
                "Profile",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.mail,
                color: Colors.white,
              ),
              title: Text(
                "Email me",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
