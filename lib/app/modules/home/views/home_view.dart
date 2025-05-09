import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:motion_hack/app/controllers/auth_controller.dart';
import 'package:motion_hack/app/routes/app_pages.dart';
import 'package:motion_hack/app/shared/theme/color.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authC = Get.find<AuthController>();
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 315,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/background/blue.png"),
                fit: BoxFit.fill,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 25,
                vertical: 50,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FutureBuilder(
                        future: authC.getData(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else if (snapshot.hasError) {
                            return Text("${snapshot.error}");
                          } else if (snapshot.hasData) {
                            Map<String, dynamic>? user = snapshot.data!.data();
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Selamat Pagi,",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: white,
                                  ),
                                ),
                                Text(
                                  user!['fullname'],
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: white,
                                  ),
                                ),
                              ],
                            );
                          } else {
                            return const Text('No Data');
                          }
                        },
                      ),
                      Image.asset(
                        "assets/images/profile/test_profile.png",
                        width: 50,
                        height: 50,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  Card(
                    color: white,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 22,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Waktu Bebas Rokok",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            "Setiap detik adalah kesempatan baru untuk hidup lebih sehat.",
                            style: TextStyle(
                              fontSize: 14,
                              color: grey,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      backgroundColor: primaryColor,
                                    ),
                                    onPressed: () {
                                      Get.toNamed(
                                          Routes.DETAIL_PROGRESS_TRACKER);
                                    },
                                    child: Text(
                                      "Detail",
                                      style: TextStyle(
                                        color: white,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 39,
                                  ),
                                  Row(
                                    children: [
                                      Image.asset(
                                        "assets/images/icons/up.png",
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "13% dari minggu lalu",
                                        style: TextStyle(
                                          color: grey,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Image.asset("assets/images/items/progress.png")
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 19,
                  ),
                  Stack(
                    children: [
                      Image.asset("assets/images/background/smoke.png"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const SizedBox(
                            width: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15, left: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Oops,",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22,
                                  ),
                                ),
                                const Text(
                                  "saya baru saja merokok",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    backgroundColor:
                                        Colors.white.withOpacity(0.4),
                                  ),
                                  child: const Text(
                                    "Ulangi",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 10.2, right: 22),
                            child: Image.asset(
                              "assets/images/items/people.png",
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 21,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.offAllNamed(Routes.ANALISIS_PAGE);
                        },
                        child: Card(
                          color: const Color(0xFFC1E5FF),
                          child: Stack(
                            children: [
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: Image.asset(
                                  "assets/images/items/dollar.png",
                                  color: white,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 26,
                                  horizontal: 30,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    RichText(
                                      text: const TextSpan(
                                        text: "Kamu telah\n",
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                        children: [
                                          TextSpan(
                                            text: "hemat",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "IDR",
                                          style: TextStyle(
                                            color: primaryColor,
                                            fontSize: 14,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          "36.750",
                                          style: TextStyle(
                                            color: primaryColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    const Text(
                                      "hari ini",
                                      style: TextStyle(
                                        fontSize: 14,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Card(
                        color: const Color(0xFFC1E5FF).withOpacity(0.9),
                        child: Stack(
                          children: [
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Image.asset(
                                "assets/images/items/panah.png",
                                color: secandaryColor,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 26,
                                horizontal: 30,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RichText(
                                    text: const TextSpan(
                                      text: "Kamu ",
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                      children: [
                                        TextSpan(
                                          text:
                                              "berhasil\n", // Teks ini akan dibuat tebal
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight
                                                .bold, // Menambahkan tebal di sini
                                          ),
                                        ),
                                        TextSpan(
                                          text: "melewati",
                                          style: TextStyle(
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "14",
                                        style: TextStyle(
                                          color: primaryColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "hari",
                                        style: TextStyle(
                                          color: primaryColor,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const Text(
                                    "tantangan",
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Berita LungsCare",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        "Lihat semua",
                        style: TextStyle(
                          color: primaryColor,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        // Kartu berita pertama - Perbandingan paru-paru
                        GestureDetector(
                          onTap: () {
                            // Tampilkan detail artikel jika diperlukan
                          },
                          child: Container(
                            width: 200,
                            height: 280,
                            margin: const EdgeInsets.only(right: 15),
                            decoration: BoxDecoration(
                              color: const Color(0xFFB6DDFF), // Warna biru muda
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  ),
                                  child: Container(
                                    padding: const EdgeInsets.all(10),
                                    child: Image.asset(
                                      "assets/images/items/healthy_vs_smoker_lungs.png",
                                      height: 150,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: Text(
                                    "Memahami Perbedaan Perokok Aktif ...",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        // Kartu berita kedua - Stop Merokok
                        GestureDetector(
                          onTap: () {
                            // Tampilkan detail artikel jika diperlukan
                          },
                          child: Container(
                            width: 200,
                            height: 280,
                            decoration: BoxDecoration(
                              color: const Color(0xFFB6DDFF), // Warna biru muda
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  ),
                                  child: Container(
                                    padding: const EdgeInsets.all(10),
                                    color: const Color(
                                        0xFFFFC278), // Warna oranye muda
                                    child: Column(
                                      children: [
                                        const Text(
                                          "BAHAYA MEROKOK",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                          ),
                                        ),
                                        Image.asset(
                                          "assets/images/items/no_smoking.png",
                                          height: 100,
                                          fit: BoxFit.contain,
                                        ),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 10,
                                            vertical: 5,
                                          ),
                                          decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.white),
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          child: const Text(
                                            "STOP MEROKOK!!!",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: Text(
                                    "Memahami Perbedaan Perokok Aktif ...",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
