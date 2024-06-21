import 'package:flutter/material.dart';
import 'package:accordion/accordion.dart';

class DemoApp1 extends StatefulWidget {
  final bool isFirstSectionSelected;
  final bool secondSectionSelected;
  final bool thirdSectionSelected;
  final ValueChanged<bool> onChangedFirst;
  final ValueChanged<bool> onChangedSecond;
  final ValueChanged<bool> onChangedThird;

  const DemoApp1({
    Key? key,
    required this.isFirstSectionSelected,
    required this.secondSectionSelected,
    required this.thirdSectionSelected,
    required this.onChangedFirst,
    required this.onChangedSecond,
    required this.onChangedThird,
  }) : super(key: key);

  @override
  State<DemoApp1> createState() => _DemoApp1State();
}

class _DemoApp1State extends State<DemoApp1> {
  String _isChecked1 = "";
  String _food = "";
  String _week = "";

  bool _isFirstSectionExpanded = false;
  bool _isSecondSectionExpanded = false;
  bool _isThirdSectionExpanded = false;

  @override
  void initState() {
    super.initState();
    _isChecked1 = widget.isFirstSectionSelected ? "Yes" : "";
    _food = widget.secondSectionSelected ? "None" : "";
    _week = widget.thirdSectionSelected ? "Never" : "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Accordion(
                      children: [
                        AccordionSection(
                          isOpen: _isFirstSectionExpanded,
                          onOpenSection: () => setState(() => _isFirstSectionExpanded = true),
                          onCloseSection: () => setState(() => _isFirstSectionExpanded = false),
                          headerBackgroundColor: Colors.blue.shade600,
                          contentBackgroundColor: Colors.blue.shade200,
                          rightIcon: const Icon(Icons.arrow_back),
                          header: Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Do you have any chronic health conditions?",
                                  style: TextStyle(color: Colors.black),
                                ),
                                Text("(e.g, diabetes, hypertension)"),
                              ],
                            ),
                          ),
                          content: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  widget.onChangedFirst(true);
                                  setState(() {
                                    _isChecked1 = "Yes";
                                    _isSecondSectionExpanded = true;
                                                                        _isFirstSectionExpanded=false;

                                  });
                                },
                                child: Row(
                                  children: [
                                    Radio(
                                      activeColor: Colors.black,
                                      value: "Yes",
                                      groupValue: _isChecked1,
                                      onChanged: (value) {
                                        widget.onChangedFirst(true);
                                        setState(() {
                                          _isChecked1 = value!;
                                          _isSecondSectionExpanded = true;
                                        });
                                      },
                                    ),
                                    Text("Yes")
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  widget.onChangedFirst(false);
                                  setState(() {
                                    _isChecked1 = "NO";
                                    _isSecondSectionExpanded = true;
                                  });
                                },
                                child: Row(
                                  children: [
                                    Radio(
                                      activeColor: Colors.black,
                                      value: "NO",
                                      groupValue: _isChecked1,
                                      onChanged: (value) {
                                        widget.onChangedFirst(false);
                                        setState(() {
                                          _isChecked1 = value!;
                                          _isSecondSectionExpanded = true;
                                        });
                                      },
                                    ),
                                    Text("NO")
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        
                        AccordionSection(
                          isOpen: _isSecondSectionExpanded,
                          onOpenSection: () {
                            if (widget.isFirstSectionSelected) {
                              setState(() => _isSecondSectionExpanded = true);
                            }
                          },
                          onCloseSection: () => setState(() => _isSecondSectionExpanded = false),
                          headerBackgroundColor: widget.isFirstSectionSelected
                              ? Colors.amber
                              : Colors.grey,
                          contentBackgroundColor: widget.isFirstSectionSelected
                              ? Colors.amber.shade100
                              : Colors.grey.shade300,
                          rightIcon: const Icon(Icons.arrow_back),
                          header: Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Do you follow any specific diet plan?",
                                  style: TextStyle(
                                      color: widget.isFirstSectionSelected
                                          ? Colors.black
                                          : Colors.black),
                                ),
                                Text("(e.g, vegan, keto, gluten-free)"),
                              ],
                            ),
                          ),
                          content: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  if (widget.isFirstSectionSelected) {
                                    widget.onChangedSecond(true);
                                    setState(() {
                                      _food = "None";
                                      _isThirdSectionExpanded = true;
                                    });
                                  }
                                },
                                child: Row(
                                  children: [
                                    Radio(
                                      activeColor: widget.isFirstSectionSelected
                                          ? Colors.black
                                          : Colors.grey,
                                      value: "None",
                                      groupValue: _food,
                                      onChanged: (value) {
                                        if (widget.isFirstSectionSelected) {
                                          widget.onChangedSecond(true);
                                          setState(() {
                                            _food = value!;
                                            _isThirdSectionExpanded = true;
                                          });
                                        }
                                      },
                                    ),
                                    Text("None")
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  if (widget.isFirstSectionSelected) {
                                    widget.onChangedSecond(true);
                                    setState(() {
                                      _food = "Vegan";
                                      _isThirdSectionExpanded = true;
                                    });
                                  }
                                },
                                child: Row(
                                  children: [
                                    Radio(
                                      activeColor: widget.isFirstSectionSelected
                                          ? Colors.black
                                          : Colors.grey,
                                      value: "Vegan",
                                      groupValue: _food,
                                      onChanged: (value) {
                                        if (widget.isFirstSectionSelected) {
                                          widget.onChangedSecond(true);
                                          setState(() {
                                            _food = value!;
                                            _isThirdSectionExpanded = true;
                                          });
                                        }
                                      },
                                    ),
                                    Text("Vegan")
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  if (widget.isFirstSectionSelected) {
                                    widget.onChangedSecond(true);
                                    setState(() {
                                      _food = "Vegetarian";
                                      _isThirdSectionExpanded = true;
                                    });
                                  }
                                },
                                child: Row(
                                  children: [
                                    Radio(
                                      activeColor: widget.isFirstSectionSelected
                                          ? Colors.black
                                          : Colors.grey,
                                      value: "Vegetarian",
                                      groupValue: _food,
                                      onChanged: (value) {
                                        if (widget.isFirstSectionSelected) {
                                          widget.onChangedSecond(true);
                                          setState(() {
                                            _food = value!;
                                            _isThirdSectionExpanded = true;
                                          });
                                        }
                                      },
                                    ),
                                    Text("Vegetarian")
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        AccordionSection(
                          isOpen: _isThirdSectionExpanded,
                          onOpenSection: () {
                            if (widget.secondSectionSelected) {
                              setState(() => _isThirdSectionExpanded = true);
                            }
                          },
                          onCloseSection: () => setState(() => _isThirdSectionExpanded = false),
                          headerBackgroundColor: widget.secondSectionSelected
                              ? Colors.red
                              : Colors.grey,
                          contentBackgroundColor: widget.secondSectionSelected
                              ? Colors.redAccent.shade100
                              : Colors.grey.shade300,
                          rightIcon: const Icon(Icons.arrow_back),
                          header: Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "How often do you currently exercise?",
                                  style: TextStyle(
                                      color: widget.secondSectionSelected
                                          ? Colors.black
                                          : Colors.black),
                                ),
                                Text("Experienced and long term fitness freak"),
                              ],
                            ),
                          ),
                          content: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  if (widget.secondSectionSelected) {
                                    widget.onChangedThird(true);
                                    setState(() {
                                      _week = "Never";
                                    });
                                  }
                                },
                                child: Row(
                                  children: [
                                    Radio(
                                      activeColor: widget.secondSectionSelected
                                          ? Colors.black
                                          : Colors.grey,
                                      value: "Never",
                                      groupValue: _week,
                                      onChanged: (value) {
                                        if (widget.secondSectionSelected) {
                                          widget.onChangedThird(true);
                                          setState(() {
                                            _week = value!;
                                          });
                                        }
                                      },
                                    ),
                                    Text("Never")
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  if (widget.secondSectionSelected) {
                                    widget.onChangedThird(true);
                                    setState(() {
                                      _week = "Once a week";
                                    });
                                  }
                                },
                                child: Row(
                                  children: [
                                    Radio(
                                      activeColor: widget.secondSectionSelected
                                          ? Colors.black
                                          : Colors.grey,
                                      value: "Once a week",
                                      groupValue: _week,
                                      onChanged: (value) {
                                        if (widget.secondSectionSelected) {
                                          widget.onChangedThird(true);
                                          setState(() {
                                            _week = value!;
                                          });
                                        }
                                      },
                                    ),
                                    Text("Once a week")
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  if (widget.secondSectionSelected) {
                                    widget.onChangedThird(true);
                                    setState(() {
                                      _week = "2-3 times a week";
                                    });
                                  }
                                },
                                child: Row(
                                  children: [
                                    Radio(
                                      activeColor: widget.secondSectionSelected
                                          ? Colors.black
                                          : Colors.grey,
                                      value: "2-3 times a week",
                                      groupValue: _week,
                                      onChanged: (value) {
                                        if (widget.secondSectionSelected) {
                                          widget.onChangedThird(true);
                                          setState(() {
                                            _week = value!;
                                          });
                                        }
                                      },
                                    ),
                                    Text("2-3 times a week")
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DemoApp2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Center(
        child: Text('This is the second page'),
      ),
    );
  }
}
