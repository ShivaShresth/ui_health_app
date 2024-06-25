import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:infinite_carousel/infinite_carousel.dart';
import 'detail_screen.dart'; // Adjust the import as necessary

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late InfiniteScrollController controller;
  int selectedIndex = 0;

  // Example list of images with paths
  List<Map<String, String>> imageList = [
    {"image_path": 'assets/1.png'},
    {"image_path": 'assets/2.png'},
    {"image_path": 'assets/3.png'},
    {"image_path": 'assets/4.png'},
    {"image_path": 'assets/5.png'},
    {"image_path": 'assets/6.png'},
    {"image_path": 'assets/7.png'},
    {"image_path": 'assets/9.png'},
    {"image_path": 'assets/10.png'},
    {"image_path": 'assets/11.png'},
    {"image_path": 'assets/12.png'},
    {"image_path": 'assets/13.png'},
    {"image_path": 'assets/14.png'},
    // Add more image paths as needed
  ];

  @override
  void initState() {
    super.initState();
    controller = InfiniteScrollController();
  }

  @override
  void dispose() {
    controller.dispose(); // Dispose the controller to avoid memory leaks
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Container(
        height: 200, // Adjust height as needed
        alignment: Alignment.topCenter,
        child: InfiniteCarousel.builder(
          itemCount: imageList.length,
          itemExtent: MediaQuery.of(context).size.width * 0.8,
          center: true,
          anchor: 0.0,
          velocityFactor: 0.2,
          onIndexChanged: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          controller: controller,
          axisDirection: Axis.horizontal,
          loop: true,
          itemBuilder: (context, itemIndex, realIndex) {
            double scaleFactor =
                (1 - (0.2 * (itemIndex - selectedIndex).abs())).clamp(0.8, 1.0);

            return Center(
              child: Transform.scale(
                scale: scaleFactor,
                child: GestureDetector(
                  onTap: () {
                    print("hello");
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailScreen(
                          images: [imageList[itemIndex]["image_path"]!],
                        ),
                      ),
                    );
                  },
                  child: Stack(
                    children: [
                      // Background image with rounded corners
                      Container(
                        width: double.infinity,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.pink,
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: AssetImage(imageList[itemIndex]["image_path"]!),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      // Gradient border using a separate container
                      Container(
                        width: double.infinity,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Colors.black, // Make border invisible
                          ),
                        ),
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            border: const GradientBoxBorder(
                              gradient: LinearGradient(
                                colors: [Colors.blue, Colors.red],
                              ),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
