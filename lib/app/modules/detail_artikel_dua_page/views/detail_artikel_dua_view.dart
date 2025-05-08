import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motion_hack/app/shared/theme/color.dart';

import '../controllers/detail_artikel_dua_controller.dart';

class DetailArtikelDuaView extends GetView<DetailArtikelDuaController> {
  const DetailArtikelDuaView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Artikel: Stop Merokok'),
        centerTitle: true,
        backgroundColor: primaryColor,
        foregroundColor: white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/images/items/no_smoking.png'),
            const SizedBox(height: 16),
            const Text(
              'Stop Merokok: Langkah Awal Menuju Hidup Sehat',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Diterbitkan pada: 12 Juli 2024',
              style: TextStyle(fontSize: 12, color: Colors.grey[600]),
            ),
            const SizedBox(height: 20),
            const Text(
              '''Ini adalah konten placeholder untuk artikel kedua. Disini akan dibahas berbagai tips dan motivasi untuk berhenti merokok dan memulai perjalanan menuju kualitas hidup yang lebih baik. Poin-poin penting akan dijabarkan secara rinci.

              Mengapa berhenti merokok itu penting? Asap rokok mengandung ribuan zat kimia berbahaya yang dapat merusak hampir setiap organ dalam tubuh. Berhenti merokok adalah salah satu keputusan terbaik yang dapat Anda buat untuk kesehatan Anda.

              Manfaat berhenti merokok akan terasa segera dan berlanjut dalam jangka panjang. Dalam beberapa jam setelah berhenti, tubuh Anda mulai pulih. Dalam beberapa minggu, fungsi paru-paru Anda akan membaik, dan risiko serangan jantung mulai menurun. Dalam setahun, risiko penyakit jantung koroner berkurang setengahnya.

              Tantangan dalam berhenti merokok memang ada, terutama terkait dengan gejala penarikan nikotin. Namun, dengan strategi yang tepat dan dukungan yang memadai, Anda bisa berhasil. Beberapa strategi yang bisa dicoba antara lain terapi penggantian nikotin, konseling, dan dukungan dari keluarga serta teman.

              Mulailah hari ini, ambil langkah pertama menuju hidup yang lebih sehat dan bebas rokok. Setiap hari tanpa rokok adalah kemenangan bagi kesehatan Anda.''',
              style: TextStyle(fontSize: 16, height: 1.5),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
} 