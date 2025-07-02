import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';

class PostCard extends StatelessWidget {
  final String title;
  final String content;
  final String createdBy;
  final DateTime created;
  final int likes;
  final int commentsCount;
  final String? imageUrl;

  const PostCard({
    super.key,
    required this.title,
    required this.content,
    required this.createdBy,
    required this.created,
    required this.likes,
    required this.commentsCount,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final formattedDate = DateFormat('dd MMM yyyy, HH:mm').format(created);

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.35),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 80,
            height: 80,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: _buildImage(),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title.isNotEmpty ? title : 'No Title',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.lato(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  content.isNotEmpty ? content : 'No content provided.',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.lato(
                    fontSize: 14,
                    color: Colors.grey[400],
                  ),
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  runSpacing: 4,
                  children: [
                    Text(
                      'By $createdBy',
                      style: GoogleFonts.lato(fontSize: 12, color: Colors.grey),
                    ),
                    Text(
                      formattedDate,
                      style: GoogleFonts.lato(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Icon(Icons.favorite_border, size: 16, color: Colors.pink[300]),
                    const SizedBox(width: 4),
                    Text('$likes', style: const TextStyle(color: Colors.white)),
                    const SizedBox(width: 16),
                    Icon(Icons.comment, size: 16, color: Colors.blue[300]),
                    const SizedBox(width: 4),
                    Text('$commentsCount', style: const TextStyle(color: Colors.white)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImage() {
    const fallback = 'assets/images/your-photo.png';

    if (imageUrl != null && imageUrl!.isNotEmpty) {
      if (imageUrl!.startsWith('http')) {
        return Image.network(
          imageUrl!,
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) => _defaultImage(fallback),
        );
      } else {
        return Image.asset(
          imageUrl!,
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) => _defaultImage(fallback),
        );
      }
    } else {
      return _defaultImage(fallback);
    }
  }

  Widget _defaultImage(String path) {
    return Image.asset(
      path,
      fit: BoxFit.cover,
    );
  }
}
