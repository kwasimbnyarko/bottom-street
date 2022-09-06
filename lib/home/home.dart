import 'package:bottom_street/components/section_property.dart';
import 'package:flutter/material.dart';
import '../utils/constants.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bottom Street"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                    "Overview",
                    style: sectionTitleTextStyle,
                  )
                ],
              ),
              const Divider(thickness: 1, color: Colors.grey),
              ListView.builder(
                  itemCount: 2,
                  itemBuilder: (BuildContext context, int index) {
                    return SectionProperty(value: "hehe", name: "hehe");
                  })
            ],
          ),
        ),
      ),
    );
  }
}
