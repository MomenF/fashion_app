import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Drower extends StatefulWidget {
  const Drower({Key? key}) : super(key: key);

  @override
  _DrowerState createState() => _DrowerState();
}

class _DrowerState extends State<Drower> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(children: [
        UserAccountsDrawerHeader(
          accountEmail: Text("Momenm4123@gmail.com"),
          accountName: Text("Momen Mahmoud"),
          currentAccountPicture: CircleAvatar(
            backgroundColor: Colors.grey,
            child: Icon(
              Icons.person,
              color: Colors.white,
            ),
          ),
        ),
        //======== All Categories ===============//
        ListTile(
          onTap: () {
            Navigator.pushNamed(context, "/home");
          },
          title: Text(
            "All Categories ",
            style: TextStyle(color: Colors.blueAccent),
          ),
          leading: CircleAvatar(
            backgroundColor: Colors.blueAccent,
            child: Icon(
              Icons.home,
              color: Colors.white,
            ),
          ),
        ),
        Divider(
          height: 10,
          thickness: 3,
        ),
        //======== Fashion App ===============//
        ListTile(
          onTap: () {
            Navigator.pushNamed(context, "/fashionApp");
          },
          title: Text(
            "Fashion Category ",
            style: TextStyle(color: Colors.teal),
          ),
          leading: CircleAvatar(
            backgroundColor: Colors.teal,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
                child: Positioned(
                  top: 0,
                  left: 0,
                  child: Image.asset(
              "assets/images/Jacket.png",
              height: 30,
            ),
                )),
          ),
        ),
        Divider(
          height: 10,
        ),
        //======== Electrical App ===============//
        ListTile(
          onTap: () {
            Navigator.pushNamed(context, "/electronicApp");
          },
          title: Text(
            "Electrical Devices",
            style: TextStyle(color: Colors.teal),
          ),
          leading: CircleAvatar(
            backgroundColor: Colors.teal,
            child: Icon(
              Icons.category,
              color: Colors.white,
            ),
          ),
        ),
        Divider(
          height: 10,
        ),
        //======== Babes App ===============//
        ListTile(
          onTap: () {
            Navigator.pushNamed(context, "/babyApp");
          },
          title: Text(
            "Babes Products",
            style: TextStyle(color: Colors.teal),
          ),
          leading: CircleAvatar(
            backgroundColor: Colors.teal,
            child: Icon(
              Icons.category,
              color: Colors.white,
            ),
          ),
        ),
        Divider(
          height: 10,
        ),
        //======== Phones Product ===============//
        ListTile(
          onTap: () {
            Navigator.pushNamed(context, "/phoneApp");
          },
          title: Text(
            "Phones Devices",
            style: TextStyle(color: Colors.teal),
          ),
          leading: CircleAvatar(
            backgroundColor: Colors.teal,
            child: Icon(
              Icons.category,
              color: Colors.white,
            ),
          ),
        ),
        //======== Setting===============//
        Divider(
          height: 10,
          thickness: 3,
        ),
        ListTile(
          onTap: () {
            Navigator.pushNamed(context, "/setting");
          },
          title: Text(
            "Setting",
            style: TextStyle(color: Colors.grey),
          ),
          leading: CircleAvatar(
            backgroundColor: Colors.grey,
            child: Icon(
              Icons.settings,
              color: Colors.white,
            ),
          ),
        ),
        //======== Log Out ===============//

        Divider(
          height: 10,
        ),

        ListTile(
          onTap: () {
            Navigator.pushNamedAndRemoveUntil(
                context, "/loginPage", (route) => false);
          },
          title: Text(
            "Log out",
            style: TextStyle(color: Colors.red),
          ),
          leading: CircleAvatar(
            backgroundColor: Colors.red,
            child: Icon(
              Icons.logout,
              color: Colors.white,
            ),
          ),
        ),
      ]),
    );
  }
}
