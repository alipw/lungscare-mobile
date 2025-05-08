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
      'AIzaSyB7XxW-Id5JLdFYd4NfZjOZ-jZj04QGaus'; // Ganti dengan API key Anda
  final String baseUrl = 'https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent'; // Updated for Gemini (gemini-2.0-flash)

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
  // Fallback logic removed

  // Metode untuk mencari respons fallback
  // Fallback logic removed

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

    // Fallback logic removed

    try {
      // Construct messages for Gemini API
      List<Map<String, dynamic>> constructedContents = [];
      // Add system prompt
      constructedContents.add({
        'role': 'user',
        'parts': [{'text': 'Anda adalah asisten kesehatan paru-paru yang membantu pengguna berhenti merokok dan memberikan informasi tentang kesehatan paru-paru.'}]
      });

      // Add all existing messages from the observable list (including the latest user message)
      for (var chatMessage in messages) {
        constructedContents.add({
          'role': chatMessage.isUser ? 'user' : 'model',
          'parts': [{'text': chatMessage.text}]
        });
      }

      final response = await http.post(
        Uri.parse('$baseUrl?key=$apiKey'), // Append API key as a query parameter for Gemini
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'contents': constructedContents,
          // Added generationConfig for safety settings, optional but good practice
          'generationConfig': {
            'temperature': 0.9,
            'topK': 1,
            'topP': 1,
            'maxOutputTokens': 2048,
            'stopSequences': []
          },
          'safetySettings': [
            {'category': 'HARM_CATEGORY_HARASSMENT', 'threshold': 'BLOCK_MEDIUM_AND_ABOVE'},
            {'category': 'HARM_CATEGORY_HATE_SPEECH', 'threshold': 'BLOCK_MEDIUM_AND_ABOVE'},
            {'category': 'HARM_CATEGORY_SEXUALLY_EXPLICIT', 'threshold': 'BLOCK_MEDIUM_AND_ABOVE'},
            {'category': 'HARM_CATEGORY_DANGEROUS_CONTENT', 'threshold': 'BLOCK_MEDIUM_AND_ABOVE'}
          ]
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        // Adjust response parsing for Gemini API
        // final botResponse = data['choices'][0]['message']['content'];
        final botResponse = data['candidates'][0]['content']['parts'][0]['text'];

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
                'Maaf, terjadi kesalahan. Silakan coba lagi nanti. (Kode: ${json.encode(response.body)})',
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
