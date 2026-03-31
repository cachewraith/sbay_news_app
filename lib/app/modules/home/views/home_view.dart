import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('News'), centerTitle: true),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        final articles = controller.news.value.articles;

        if (articles == null || articles.isEmpty) {
          return const Center(child: Text('No news available'));
        }

        return ListView.builder(
          itemCount: articles.length,
          itemBuilder: (context, index) {
            final article = articles[index];

            return Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadiusGeometry.circular(20),
                      child: CachedNetworkImage(
                        imageUrl: article.image!,
                        errorWidget: (context, url, error) => Icon(Icons.error),
                        placeholder: (context,url) => CircularProgressIndicator(),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "${article.title}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                    Text(
                      "${article.description}",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                      maxLines: 3,
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
