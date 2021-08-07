import 'dart:convert';
import 'dart:io';
import 'package:e_commerce_app/MainScreens/Setting.dart';
import 'package:e_commerce_app/Services/SqlSetting/dbHelper.dart';
import 'package:e_commerce_app/Services/SqlSetting/model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'PurcaseList.dart';

class Drower extends StatefulWidget {

  @override
  _DrowerState createState() => _DrowerState();
}

class _DrowerState extends State<Drower> {

  //Todo Variables
  DbHelper? helper;
  SettingModel? profile;

  @override
  void initState() {
    super.initState();
    helper = DbHelper();
    initDb();
  }

  void initDb() async{
    profile=await helper!.allSettings();

  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(children: [

        FutureBuilder(
          future: helper!.allSettings(),
            builder: (context,AsyncSnapshot snap) {
            if(snap.connectionState!= ConnectionState.done){
              return UserAccountsDrawerHeader(
                  accountEmail: Text("No Email found"),
              accountName: Text( "No Name"  ),
              currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.grey,
              child :   Icon(
              Icons.person ,
              ), ) );
            }
            else if (snap.hasData){
              return UserAccountsDrawerHeader(
                accountEmail: Text("Momenm4123@gmail.com"),
                accountName: Text("${
                    profile == null ? "No Name" :
                    profile!.name
                }" ),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.grey,
                  child : profile!.imgUrl  == null  || profile ==null ?  Icon(
                    Icons.person ,
                    color: Colors.white,
                  )
                      : Image.memory(base64Decode(profile!.imgUrl)),
                ),
              );
            }
            else{return Text("Error in Drawer");}


            }),




    // ======== All Categories ===============//
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
        //==============================//
        Divider(
          height: 10,
        ),
        ListTile(
          onTap: () {
            Navigator.pushNamed(context, PurchaseList.id);
          },
          title: Text(
            "Cart List ",
            style: TextStyle(color: Colors.blueAccent),
          ),
          leading: Icon(
            Icons.shopping_cart,
            color: Colors.black,
            size: 50,

          ),
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
          leading: Image.asset(
          "assets/images/Jacket.png", height: 100,width: 50,
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
          leading: Image.asset("assets/images/drawer/electricDevices.png", height: 100,width: 50,)
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
            leading: Image.asset("assets/images/drawer/baby.png", height: 100,width: 50,)
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
            leading: Image.asset("assets/images/drawer/phone.png" , height: 100,width: 50,)
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
