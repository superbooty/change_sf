import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Home extends StatelessWidget {
  // final String title;
  // final double price;

  // ProductDetailScreen(this.title, this.price);
  static const routeName = '/home';

  final String appBarText = 'Change SF';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarText),
      ),
      body: Container(
        child: ImageHandler(),
      ),
    );
  }
}

class ImageHandler extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<ImageHandler> {
  File _image;

  final descController = TextEditingController();

  _showTagEventOptions(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (ctx) {
        return Container(
          child: ListView(
            children: <Widget>[
              ListTile(
                onLongPress: () {},
                title: Text(
                  'Encampment',
                  style: TextStyle(),
                ),
                trailing: Checkbox(
                  activeColor: Colors.lightBlueAccent,
                  value: false,
                  onChanged: (newVal) {},
                ),
              ),
              ListTile(
                onLongPress: () {},
                title: Text(
                  'Agressive Behavior',
                  style: TextStyle(),
                ),
                trailing: Checkbox(
                  activeColor: Colors.lightBlueAccent,
                  value: false,
                  onChanged: (newVal) {},
                ),
              ),
              ListTile(
                onLongPress: () {},
                title: Text(
                  'Needles',
                  style: TextStyle(),
                ),
                trailing: Checkbox(
                  activeColor: Colors.lightBlueAccent,
                  value: false,
                  onChanged: (newVal) {},
                ),
              ),
              ListTile(
                onLongPress: () {},
                title: Text(
                  'Weapons',
                  style: TextStyle(),
                ),
                trailing: Checkbox(
                  activeColor: Colors.lightBlueAccent,
                  value: false,
                  onChanged: (newVal) {},
                ),
              ),
              ListTile(
                onLongPress: () {},
                title: Text(
                  'Drugs',
                  style: TextStyle(),
                ),
                trailing: Checkbox(
                  activeColor: Colors.lightBlueAccent,
                  value: false,
                  onChanged: (newVal) {},
                ),
              ),
              ListTile(
                onLongPress: () {},
                title: Text(
                  'Trash / Debris',
                  style: TextStyle(),
                ),
                trailing: Checkbox(
                  activeColor: Colors.lightBlueAccent,
                  value: false,
                  onChanged: (newVal) {},
                ),
              ),
              ListTile(
                onLongPress: () {},
                title: Text(
                  'Blocked Sidewalk',
                  style: TextStyle(),
                ),
                trailing: Checkbox(
                  activeColor: Colors.lightBlueAccent,
                  value: false,
                  onChanged: (newVal) {},
                ),
              ),
              ListTile(
                onLongPress: () {},
                title: Text(
                  'Human waste',
                  style: TextStyle(),
                ),
                trailing: Checkbox(
                  activeColor: Colors.lightBlueAccent,
                  value: false,
                  onChanged: (newVal) {},
                ),
              ),
              ListTile(
                onLongPress: () {},
                title: Text(
                  'Graffiti',
                  style: TextStyle(),
                ),
                trailing: Checkbox(
                  activeColor: Colors.lightBlueAccent,
                  value: false,
                  onChanged: (newVal) {},
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  _selectImageContext(BuildContext ctx) {
    showModalBottomSheet(
      elevation: 3,
      context: ctx,
      builder: (ctx) {
        return Container(
            height: 150,
            padding: EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FlatButton.icon(
                  // shape: Border.all(
                  //   color: Colors.black,
                  //   width: 1.0,
                  // ),
                  //color: Colors.brown[600],
                  label: Text(
                    'From Camera'.toUpperCase(),
                    style: TextStyle(
                      color: Colors.brown[700],
                    ),
                  ),
                  icon: Icon(
                    Icons.camera_alt,
                    color: Colors.brown[700],
                  ),
                  onPressed: () {
                    getImage();
                  },
                ),
                FlatButton.icon(
                  // shape: Border.all(
                  //   color: Colors.black,
                  //   width: 1.0,
                  // ),
                  //color: Colors.brown[600],
                  label: Text(
                    'From Gallery'.toUpperCase(),
                    style: TextStyle(
                      color: Colors.brown[700],
                    ),
                  ),
                  icon: Icon(
                    Icons.image,
                    color: Colors.brown[700],
                  ),
                  onPressed: () {},
                ),
              ],
            ));
      },
    );
  }

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            CarouselSlider(
              //height: mediaQuery.size.height * .5,
              enlargeCenterPage: true,
              viewportFraction: 1.0,
              autoPlayInterval: Duration(seconds: 10),
              autoPlay: true,
              aspectRatio: 2.2,
              items: <Widget>[
                Image.network(
                  'https://s.hdnux.com/photos/45/22/01/9773154/11/rawImage.jpg',
                  fit: BoxFit.contain,
                ),
                Image.network(
                  'http://media.bizj.us/view/img/8391832/homeless-3*750xx7360-4152-0-589.jpg',
                  fit: BoxFit.contain,
                ),
                Image.network(
                  'https://hoodwork-production.s3.amazonaws.com/uploads/story/image/28458/shotwell_tents.jpg',
                  fit: BoxFit.contain,
                ),
              ],
            ),
            Center(
              child: FlatButton(
                //color: Color(0XFFc41130),
                textColor: Colors.brown[700],
                child: Text(
                  'WHAT\'S HAPPENING NOW?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                //padding: EdgeInsets.all(15.0),
                onPressed: () {
                  _selectImageContext(context);
                },
              ),
            ),
            _image == null
                ? Text('No image selected.')
                : Container(
                    height: 250,
                    width: 250,
                    child: Card(
                      child: Image.file(
                        _image,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
            SizedBox(height: 20),
            TextField(
              controller: descController,
              decoration: InputDecoration(
                labelText: 'Describe the moment',
                alignLabelWithHint: true,
                labelStyle: TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: FlatButton(
                //color: Color(0XFFc41130),
                textColor: Colors.brown[700],
                shape: Border.all(),
                child: Text(
                  'TAG THIS MOMENT',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                //padding: EdgeInsets.all(15.0),
                onPressed: () {
                  _showTagEventOptions(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
