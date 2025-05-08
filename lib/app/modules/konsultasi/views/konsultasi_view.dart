import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../chat_page/controllers/chat_page_controller.dart';
import '../../../shared/theme/color.dart'; // Import tema warna

class KonsultasiView extends GetView<ChatPageController> {
  const KonsultasiView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController textController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('LungsBot AI'),
        centerTitle: true,
        backgroundColor: primaryColor, // Gunakan warna primer dari tema
        foregroundColor: Colors.white, // Warna teks putih untuk kontras
      ),
      body: Container(
        // Tambahkan background pattern atau warna
        decoration: BoxDecoration(
          color: Colors.grey[50], // Background light grey
        ),
        child: Column(
          children: [
            Expanded(
              child: Obx(() => ListView.builder(
                    itemCount: controller.messages.length,
                    padding: const EdgeInsets.all(16),
                    itemBuilder: (context, index) {
                      final message = controller.messages[index];
                      return _buildMessageItem(message);
                    },
                  )),
            ),
            Obx(() {
              if (controller.isLoading.value) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                          primaryColor), // Sesuaikan warna loading
                    ),
                  ),
                );
              }
              return const SizedBox.shrink();
            }),
            _buildInputField(textController),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageItem(ChatMessage message) {
    return Align(
      alignment: message.isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: message.isUser
              ? primaryColor // Gunakan warna primer untuk pesan pengguna
              : Colors.white, // Warna putih untuk pesan bot
          borderRadius: BorderRadius.circular(18), // Bubble lebih bulat
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              spreadRadius: 1,
              blurRadius: 3,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        constraints: const BoxConstraints(maxWidth: 280), // Sedikit lebih lebar
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              message.text,
              style: TextStyle(
                fontSize: 16,
                color: message.isUser
                    ? Colors.white
                    : Colors.black87, // Warna teks kontras
              ),
            ),
            const SizedBox(height: 4),
            Text(
              '${message.timestamp.hour}:${message.timestamp.minute < 10 ? '0' : ''}${message.timestamp.minute}',
              style: TextStyle(
                fontSize: 12,
                color: message.isUser
                    ? Colors.white.withOpacity(0.7)
                    : Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField(TextEditingController textController) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, -1),
          ),
        ],
      ),
      child: Row(
        children: [
          // Tambahkan icon untuk menunjukkan fungsi chatbot
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Icon(Icons.health_and_safety,
                color: primaryColor.withOpacity(0.7)),
          ),
          Expanded(
            child: TextField(
              controller: textController,
              decoration: InputDecoration(
                hintText: 'Tanyakan tentang kesehatan paru-paru...',
                border: InputBorder.none,
                hintStyle: TextStyle(color: Colors.grey[400]),
              ),
            ),
          ),
          Material(
            color: primaryColor,
            borderRadius: BorderRadius.circular(30),
            child: InkWell(
              borderRadius: BorderRadius.circular(30),
              onTap: () {
                if (textController.text.isNotEmpty) {
                  controller.sendMessage(textController.text);
                  textController.clear();
                }
              },
              child: Container(
                padding: const EdgeInsets.all(10),
                child: const Icon(
                  Icons.send,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
