import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FullScreen extends StatefulWidget {
  final String imageUrl;

  const FullScreen({super.key, required this.imageUrl});
  @override
  State<FullScreen> createState() => _FullScreenState();
}

class _FullScreenState extends State<FullScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Container(
                child: Image.network(widget.imageUrl),
              ),
            ),
            Container(
              height: 60,
              width: double.infinity,
              child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Set WallPaper',
                    style: TextStyle(color: Colors.white),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
