// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

import 'package:ui_health_app/information_page.dart';

class HomePage extends StatefulWidget {
  int? h1;
  HomePage({
    Key? key,
     this.h1,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController();
  final Set<int> _pressedIndices = {0}; // Initialize with index 0

  bool _isFirstSectionSelected = false;
  bool _isSecondSectionSelected = false;
  bool _isThirdSectionSelected = false;

  void _onTileTap(int index) {
    setState(() {
      _pressedIndices.add(index);
    });

    // Check if conditions are met to navigate to the second page (index 1)
    if (index == 1 && !(_isFirstSectionSelected && _isSecondSectionSelected && _isThirdSectionSelected)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please complete all selections in the first page first.'),
        ),
      );
      return; // Prevent navigation
    }

    _pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            children: [
              Text(
                "Select Your Category!",
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(height: 20),
              Container(
                width: 320,
                child: Text("Your exercises will be curated according to the category that you have selected."),
              ),
              SizedBox(height: 16),
              Container(
                height: 30,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(6, (index) {
                      return GestureDetector(
                        onTap: () {
                          if (_isFirstSectionSelected && _isSecondSectionSelected && _isThirdSectionSelected) {
                            _onTileTap(index);
                          }
                        },
                        child: Container(
                          width: 60, // Adjust the width as needed
                          child: TimelineTile(
                            axis: TimelineAxis.horizontal,
                            alignment: TimelineAlign.start,
                            isFirst: index == 0,
                            isLast: index == 5,
                            beforeLineStyle: LineStyle(
                              color: Colors.black,
                              thickness: 2.0,
                            ),
                            afterLineStyle: LineStyle(
                              color: Colors.black,
                              thickness: 2.0,
                            ),
                            indicatorStyle: IndicatorStyle(
                              width: 20,
                              height: 20,
                              indicator: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black, width: 2),
                                  shape: BoxShape.circle,
                                  color: _pressedIndices.contains(index)
                                      ? Colors.black
                                      : (_isFirstSectionSelected && _isSecondSectionSelected && _isThirdSectionSelected)
                                          ? _getIndicatorColor(index)
                                          : Colors.grey,
                                ),
                                child: _pressedIndices.contains(index)
                                    ? Icon(Icons.check, color: Colors.white, size: 13)
                                    : null,
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ),
              Expanded(
                child: PageView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: _pageController,
                  children: List.generate(6, (index) {
                    // Define the pages for the PageView here
                    switch (index) {
                      case 0:
                        return DemoApp1(
                          isFirstSectionSelected: _isFirstSectionSelected,
                          secondSectionSelected: _isSecondSectionSelected,
                          thirdSectionSelected: _isThirdSectionSelected,
                          onChangedFirst: (bool value) {
                            setState(() {
                              _isFirstSectionSelected = value;
                            });
                          },
                          onChangedSecond: (bool value) {
                            setState(() {
                              _isSecondSectionSelected = value;
                            });
                          },
                          onChangedThird: (bool value) {
                            setState(() {
                              _isThirdSectionSelected = value;
                            });
                          },
                        );
                      case 1:
                        return _isFirstSectionSelected && _isSecondSectionSelected && _isThirdSectionSelected
                            ? DemoApp2()
                            : Scaffold(body: Center(child: Text('Please complete selections on the first page.')));
                      // Add other cases for DemoApp3(), DemoApp4(), etc.
                      default:
                        return Center(child: Text('Page not found'));
                    }
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getIndicatorColor(int index) {
    if (index == 1 && _isFirstSectionSelected && _isSecondSectionSelected && _isThirdSectionSelected) {
      return Colors.white;
    }
    return Colors.grey;
  }
}
