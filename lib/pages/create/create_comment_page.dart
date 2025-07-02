import 'package:flutter/material.dart';

class CreateCommentPage extends StatelessWidget {
  const CreateCommentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Create Comment")),
      body: const Center(child: Text("Comment creation form here")),
    );
  }
}
