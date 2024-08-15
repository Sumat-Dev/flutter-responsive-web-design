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
        mobileBuilder: _buildMobileLayout,
        tabletBuilder: _buildTabletLayout,
        desktopBuilder: _buildDesktopLayout,
      ),
    );
  }

  Widget _buildMobileLayout(BuildContext context, BoxConstraints constraints) {
    return Column(
      children: [
        _buildHeader(),
        _buildContent1(),
        _buildContent2(),
        _buildContent3(),
        _buildFooter(),
      ],
    );
  }

  Widget _buildTabletLayout(BuildContext context, BoxConstraints constraints) {
    return Column(
      children: [
        _buildHeader(),
        Expanded(
          child: Row(
            children: [
              _buildFlexibleContent(_buildContent1()),
              _buildFlexibleContent(_buildContent2()),
            ],
          ),
        ),
        _buildFlexibleContent(_buildContent3()),
        _buildFooter(),
      ],
    );
  }

  Widget _buildDesktopLayout(BuildContext context, BoxConstraints constraints) {
    return Column(
      children: [
        _buildHeader(),
        Expanded(
          child: Row(
            children: [
              _buildFlexibleContent(_buildContent1()),
              _buildFlexibleContent(_buildContent2()),
              _buildFlexibleContent(_buildContent3()),
            ],
          ),
        ),
        _buildFooter(),
      ],
    );
  }

  Widget _buildHeader() {
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

  Widget _buildContent1() {
    return _buildContentContainer("Content 1", Colors.deepPurpleAccent);
  }

  Widget _buildContent2() {
    return _buildContentContainer("Content 2", Colors.orange);
  }

  Widget _buildContent3() {
    return _buildContentContainer("Content 3", Colors.green);
  }

  Widget _buildFooter() {
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

  Widget _buildContentContainer(String text, Color color) {
    return Expanded(
      child: Container(
        color: color,
        alignment: Alignment.center,
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildFlexibleContent(Widget content) {
    return Flexible(child: content);
  }
}
