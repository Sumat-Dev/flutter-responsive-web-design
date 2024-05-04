import 'package:flutter/material.dart';
import 'package:flutter_responsive_web_design/responsive.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveBuilder(
        mobileBuilder: (context, constraints) {
          return Column(
            children: [
              _buildHeader(),
              _buildContent1(),
              _buildContent2(),
              _buildContent3(),
              _buildFooter(),
            ],
          );
        },
        tabletBuilder: (context, constraints) {
          return Column(
            children: [
              _buildHeader(),
              Expanded(
                child: Row(
                  children: [
                    Flexible(
                      child: _buildContent1(),
                    ),
                    Flexible(
                      child: _buildContent2(),
                    ),
                  ],
                ),
              ),
              Flexible(
                child: _buildContent3(),
              ),
              _buildFooter(),
            ],
          );
        },
        desktopBuilder: (context, constraints) {
          return Column(
            children: [
              _buildHeader(),
              Expanded(
                child: Row(
                  children: [
                    Flexible(
                      child: _buildContent1(),
                    ),
                    Flexible(
                      child: _buildContent2(),
                    ),
                    Flexible(
                      child: _buildContent3(),
                    )
                  ],
                ),
              ),
              _buildFooter(),
            ],
          );
        },
      ),
    );
  }

  _buildHeader() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      color: Colors.blue,
      alignment: Alignment.center,
      child: const Text(
        "Header",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }

  _buildContent1() {
    return Expanded(
      child: Container(
        color: Colors.deepPurpleAccent,
        alignment: Alignment.center,
        child: const Text(
          "Content 1",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  _buildContent2() {
    return Expanded(
      child: Container(
        color: Colors.orange,
        alignment: Alignment.center,
        child: const Text(
          "Content 2",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  _buildContent3() {
    return Expanded(
      child: Container(
        color: Colors.green,
        alignment: Alignment.center,
        child: const Text(
          "Content 3",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  _buildFooter() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      color: Colors.pinkAccent,
      alignment: Alignment.center,
      child: const Text(
        "Footer",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
