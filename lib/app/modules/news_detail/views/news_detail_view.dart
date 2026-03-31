import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/news_detail_controller.dart';

class NewsDetailView extends GetView<NewsDetailController> {
  const NewsDetailView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NewsDetailView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'NewsDetailView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
