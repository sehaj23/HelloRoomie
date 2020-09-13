import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
class CompilcatedImageDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Container(
          child: CarouselSlider(
            options: CarouselOptions(
              aspectRatio:2.0,
              enableInfiniteScroll: true,
              enlargeCenterPage: true,
              scrollDirection: Axis.horizontal,
              autoPlay: true,
            ),
            items: imageSliders,
          )
      ),
    );
  }
}
final List<Widget> imageSliders = imgList.map((item) => Container(
  child: Container(
    margin: EdgeInsets.all(5.0),
    child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        child: Stack(
          children: <Widget>[
            Image.network(item, fit: BoxFit.cover, width: 1000.0),
            Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(200, 0, 0, 0),
                      Color.fromARGB(0, 0, 0, 0)
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                child: Text(
                  'No. ${imgList.indexOf(item)} image',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        )
    ),
  ),
)).toList();

final List<String> imgList = [
  "https://bsmedia.business-standard.com/_media/bs/img/article/2018-06/08/full/1528397457-4687.jpg",
  "https://static1.squarespace.com/static/56f2595e8a65e2db95a7d983/59708dbdb3db2bb651d60316/5cf1199319db570001495ecd/1559388179796/Jodi+Flats+%284%29.jpg?format=1500w",
  "https://pushpainteriors.com/wp-content/uploads/2019/06/Jayabheri-The-Peak-4Bhk-Apartment-Interior-Designs.jpg?x36593",
  'https://www.abadbuilders.com/flats-in-kochi-for-sale/images/reflection.jpg',
  'https://www.abadbuilders.com/uploads/portfolio/thumb/abad-reflections.jpg',
  'https://www.altin-turk.com/images/projeler/AVRUPAKONUTLARI_ATAKENT4Z1.jpg'
];