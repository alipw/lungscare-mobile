import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';

class ChatMessage {
  final String id;
  final String text;
  final bool isUser;
  final DateTime timestamp;

  ChatMessage({
    required this.id,
    required this.text,
    required this.isUser,
    required this.timestamp,
  });
}

class ChatPageController extends GetxController {
  // API key untuk OpenRouter.ai
  final String apiKey =
      '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'; // Ganti dengan API key Anda
  final String baseUrl = 'https://openrouter.ai/api/v1/chat/completions';

  final RxList<ChatMessage> messages = <ChatMessage>[].obs;
  final RxBool isLoading = false.obs;
  final Uuid _uuid = Uuid();

  @override
  void onInit() {
    super.onInit();
    messages.add(
      ChatMessage(
        id: _uuid.v4(),
        text:
            'Halo! Saya asisten LungsCare. Apa yang bisa saya bantu tentang kesehatan paru-paru Anda?',
        isUser: false,
        timestamp: DateTime.now(),
      ),
    );
  }

  // Respons fallback untuk pertanyaan umum
  final Map<String, String> _fallbackResponses = {
    'merokok':
        'Merokok sangat berbahaya bagi kesehatan paru-paru. Merokok dapat menyebabkan kanker paru-paru, PPOK, dan berbagai penyakit pernapasan lainnya. Sebaiknya hindari merokok dan lingkungan yang terpapar asap rokok.',
    'asma':
        'Asma adalah kondisi kronis yang menyebabkan saluran udara di paru-paru menjadi sempit dan bengkak, serta memproduksi lendir tambahan. Ini dapat menyebabkan kesulitan bernapas, batuk, dan mengi. Penting untuk mengikuti rencana pengobatan yang diberikan oleh dokter Anda.',
    'covid':
        'COVID-19 dapat mempengaruhi paru-paru dan menyebabkan pneumonia. Gejala umum termasuk batuk, demam, dan kesulitan bernapas. Jika Anda mengalami gejala, segera lakukan tes dan konsultasikan dengan dokter.',
    'olahraga':
        'Olahraga teratur dapat meningkatkan kapasitas paru-paru dan kesehatan pernapasan secara keseluruhan. Aktivitas seperti berjalan, berenang, dan bersepeda sangat baik untuk kesehatan paru-paru.',
  };

  // Metode untuk mencari respons fallback
  String? _findFallbackResponse(String text) {
    final lowercaseText = text.toLowerCase();
    for (final entry in _fallbackResponses.entries) {
      if (lowercaseText.contains(entry.key)) {
        return entry.value;
      }
    }
    return null;
  }

  Future<void> sendMessage(String text) async {
    if (text.trim().isEmpty) return;

    // Tambahkan pesan pengguna
    final userMessage = ChatMessage(
      id: _uuid.v4(),
      text: text,
      isUser: true,
      timestamp: DateTime.now(),
    );
    messages.add(userMessage);

    // Mulai loading
    isLoading.value = true;

    // Coba cari respons fallback terlebih dahulu
    final fallbackResponse = _findFallbackResponse(text);
    if (fallbackResponse != null) {
      // Gunakan respons fallback jika ada
      messages.add(
        ChatMessage(
          id: _uuid.v4(),
          text: fallbackResponse,
          isUser: false,
          timestamp: DateTime.now(),
        ),
      );
      isLoading.value = false;
      return;
    }

    try {
      final response = await http.post(
        Uri.parse(baseUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $apiKey',
          'HTTP-Referer': 'https://lungscare.com',
        },
        body: jsonEncode({
          'model':
              'openai/gpt-3.5-turbo', // Atau model lain yang tersedia di OpenRouter
          'messages': [
            {
              'role': 'system',
              'content':
                  'Anda adalah asisten kesehatan paru-paru yang membantu pengguna berhenti merokok dan memberikan informasi tentang kesehatan paru-paru.'
            },
            {'role': 'user', 'content': text}
          ],
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final botResponse = data['choices'][0]['message']['content'];

        // Tambahkan respons bot ke daftar pesan
        messages.add(
          ChatMessage(
            id: _uuid.v4(),
            text: botResponse,
            isUser: false,
            timestamp: DateTime.now(),
          ),
        );
      } else {
        // Tangani error
        messages.add(
          ChatMessage(
            id: _uuid.v4(),
            text:
                'Maaf, terjadi kesalahan. Silakan coba lagi nanti. (Kode: ${response.statusCode})',
            isUser: false,
            timestamp: DateTime.now(),
          ),
        );
      }
    } catch (e) {
      // Tangani exception
      messages.add(
        ChatMessage(
          id: _uuid.v4(),
          text: 'Terjadi kesalahan jaringan. Silakan periksa koneksi Anda.',
          isUser: false,
          timestamp: DateTime.now(),
        ),
      );
    } finally {
      // Selesai loading
      isLoading.value = false;
    }
  }
}
