import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  final List<String> images; // Changed to List<String>

  DetailScreen({
    Key? key,
    required this.images, // Use required to ensure images are not null
  }) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(10), // Added padding for better UI
          child: Column(
            children: [
              if (widget.images.isNotEmpty)
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: AssetImage(widget.images[0]), // Access the first image in the list
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                )
              else
                Center(
                  child: Text('No image available'),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
