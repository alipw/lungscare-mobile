import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motion_hack/app/routes/app_pages.dart';
import 'package:motion_hack/app/shared/theme/color.dart';

import '../controllers/berita_page_controller.dart';

class BeritaPageView extends GetView<BeritaPageController> {
  const BeritaPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Berita LungsCare'),
        centerTitle: true,
        backgroundColor: primaryColor,
        foregroundColor: white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          _buildArticleCard(
            title: 'Memahami Perbedaan Perokok Aktif dan Pasif',
            snippet: 'Ketahui dampak asap rokok bagi perokok aktif maupun pasif serta bahayanya bagi kesehatan paru-paru...',
            imagePath: 'assets/images/items/healthy_vs_smoker_lungs.png',
            onTap: () => Get.toNamed(Routes.DETAIL_ARTIKEL_SATU_PAGE),
          ),
          const SizedBox(height: 16),
          _buildArticleCard(
            title: 'Stop Merokok: Langkah Awal Menuju Hidup Sehat',
            snippet: 'Berbagai tips dan motivasi untuk berhenti merokok dan memulai perjalanan menuju kualitas hidup yang lebih baik...',
            imagePath: 'assets/images/items/no_smoking.png',
            onTap: () => Get.toNamed(Routes.DETAIL_ARTIKEL_DUA_PAGE),
          ),
        ],
      ),
    );
  }

  Widget _buildArticleCard({
    required String title,
    required String snippet,
    required String imagePath,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(15),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  imagePath,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      snippet,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[700],
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
} 