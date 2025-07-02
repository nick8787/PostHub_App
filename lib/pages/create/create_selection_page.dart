import 'package:flutter/material.dart';
import 'package:post_hub_app/pages/create/create_comment_page.dart';
import 'package:post_hub_app/pages/create/create_post_page.dart';
import 'package:post_hub_app/services/providers/user_provider.dart';
import 'package:provider/provider.dart';

class CreatePage extends StatelessWidget {
  const CreatePage({super.key});

  @override
  Widget build(BuildContext context) {
    final userRole = Provider.of<UserProvider>(context).user?.role ?? 'User';

    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E1E1E),
        title: const Text('Choose what to create'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildButton(
            context,
            icon: Icons.post_add,
            label: 'Create Post',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const CreatePostPage()),
            ),
          ),
          const SizedBox(height: 16),
          _buildButton(
            context,
            icon: Icons.comment,
            label: 'Create Comment',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const CreateCommentPage()),
            ),
          ),
          const SizedBox(height: 16),
          if (userRole == 'Super Admin') // 👑
            _buildButton(
              context,
              icon: Icons.person_add,
              label: 'Create User (Admin only)',
              onTap: () {
                // TODO: add navigation to create user page
              },
            ),
        ],
      ),
    );
  }

  Widget _buildButton(BuildContext context,
      {required IconData icon, required String label, required VoidCallback onTap}) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF2C2C2C),
        foregroundColor: Colors.white,
        minimumSize: const Size.fromHeight(60),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      icon: Icon(icon, size: 24),
      label: Text(label, style: const TextStyle(fontSize: 16)),
      onPressed: onTap,
    );
  }
}
