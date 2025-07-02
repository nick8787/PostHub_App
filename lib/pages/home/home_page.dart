import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:user_auth_crudd10/widgets/post_card.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> _posts = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchPosts();
  }

  Future<void> _fetchPosts() async {
    const String url = 'https://post-wave-swagger.fun/posts/all?page=0&limit=100';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        final List<dynamic> posts = data['payload']['content'] ?? [];

        setState(() {
          _posts = posts;
          _isLoading = false;
        });
      } else {
        throw Exception('Failed to load posts');
      }
    } catch (e) {
      print('Error: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Latest Posts",
          style: GoogleFonts.lato(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator(color: Colors.deepPurpleAccent))
          : RefreshIndicator(
        color: Colors.deepPurpleAccent,
        onRefresh: _fetchPosts,
        child: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: _posts.length,
          itemBuilder: (context, index) {
            final post = _posts[index];

            return PostCard(
              title: post['title'] ?? '',
              content: post['content'] ?? '',
              createdBy: post['createdBy'] ?? 'Unknown',
              created: DateTime.parse(post['created']),
              likes: post['likes'] ?? 0,
              commentsCount: post['commentsCount'] ?? 0,
              imageUrl: post['image'],
            );
          },
        ),
      ),
    );
  }
}
