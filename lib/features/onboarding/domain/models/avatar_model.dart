/// Represents an avatar option for the child profile
class AvatarModel {
  final String id;
  final String name;
  final String imagePath;
  final AvatarColor color;

  const AvatarModel({
    required this.id,
    required this.name,
    required this.imagePath,
    required this.color,
  });
}

/// Avatar background color options
enum AvatarColor { orange, blue, green, purple }
