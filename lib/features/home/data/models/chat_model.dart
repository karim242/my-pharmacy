import 'package:my_pharmacy/core/utils/app_images.dart';

class Chat {
  final String name;
  final String lastMessage;
  final String avatarUrl;
  final DateTime time;

  Chat({
    required this.name,
    required this.lastMessage,
    required this.avatarUrl,
    required this.time,
  });
}

  final List<Chat> chats = [
    Chat(
      name: 'صيدلية الطرشوبي',
      lastMessage: 'ممكن حضرتك تبعت العنوان و رقم الهاتف؟',
      avatarUrl: AppImages.elezabyImage,
      time: DateTime.now().subtract(const Duration(minutes: 5)),
    ),
    Chat(
      name: 'صيدلية العزبي',
      lastMessage: 'ممكن حضرتك تبعت العنوان و رقم الهاتف؟',
      avatarUrl:AppImages.tarshobyImage,
      time: DateTime.now().subtract( const Duration(hours: 1)),
    ),
    // Add more Chat objects
  ];