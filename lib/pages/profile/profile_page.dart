import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:post_hub_app/config/theme_provider.dart';
import 'package:post_hub_app/services/providers/user_provider.dart';
import 'package:post_hub_app/widgets/global/about_us.dart';
import 'package:post_hub_app/widgets/logout_button.dart';
import '../../core/models/user_model.dart';
import 'edit_profile_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final userProvider = Provider.of<UserProvider>(context);
    final user = userProvider.user;

    final textColor = Colors.white;
    final cardColor = const Color(0xFF1E1E1E);
    final dividerColor = Colors.deepPurpleAccent.withOpacity(0.4);

    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Account',
          style: GoogleFonts.lato(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        children: [
          /// --- Avatar & Info ---
          Column(
            children: [
              const SizedBox(height: 10),
              CircleAvatar(
                radius: 36,
                backgroundColor: Colors.grey.shade700,
                child: Text(
                  user?.username.substring(0, 1).toUpperCase() ?? 'U',
                  style: GoogleFonts.lato(
                    fontSize: 32,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                user?.username ?? 'App User',
                style: GoogleFonts.lato(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: textColor,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                user?.email ?? 'app_user@gmail.com',
                style: GoogleFonts.lato(
                  fontSize: 14,
                  color: Colors.grey.shade500,
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),

          /// --- Menu Tiles ---
          _buildTile(
            context,
            icon: Icons.person_outline,
            title: 'Edit Profile',
            onTap: () async {
              final result = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => UserProfileEdit(
                    name: user?.username ?? '',
                    year: '1',
                  ),
                ),
              );
              if (result != null && user != null) {
                userProvider.setUser(UserModel(
                  id: user.id,
                  username: result['name'],
                  email: user.email,
                  role: user.role,
                ));
              }
            },
          ),
          Divider(color: dividerColor, thickness: 0.4, height: 16),

          _buildTile(
            context,
            icon: Icons.article_outlined,
            title: 'My Posts',
            onTap: () => Navigator.pushNamed(context, '/my-posts'),
          ),
          Divider(color: dividerColor, thickness: 0.4, height: 16),

          _buildTile(
            context,
            icon: Icons.comment_outlined,
            title: 'My Comments',
            onTap: () => Navigator.pushNamed(context, '/my-comments'),
          ),
          Divider(color: dividerColor, thickness: 0.4, height: 16),

          _buildTile(
            context,
            icon: Icons.info_outline,
            title: 'About Us',
            onTap: () {
              showModalBottomSheet(
                context: context,
                backgroundColor: cardColor,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                ),
                builder: (_) => const AboutUs(),
              );
            },
          ),

          const SizedBox(height: 20),

          /// --- Dark Mode Switch ---
          Container(
            decoration: BoxDecoration(
              color: cardColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: SwitchListTile(
              value: themeProvider.isDarkMode,
              onChanged: (_) => themeProvider.toggleTheme(),
              secondary: const Icon(Icons.dark_mode_outlined, color: Colors.white),
              title: Text(
                'Dark Mode',
                style: GoogleFonts.lato(fontSize: 15, color: textColor),
              ),
            ),
          ),

          const SizedBox(height: 30),

          /// --- Logout Button ---
          LogoutButton(
            onLogout: () {
              userProvider.clearUser();
              Navigator.of(context).pushReplacementNamed('/login');
            },
          ),
        ],
      ),
    );
  }

  Widget _buildTile(BuildContext context, {
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        leading: Icon(icon, color: Colors.deepPurpleAccent),
        title: Text(
          title,
          style: GoogleFonts.lato(
            fontSize: 15,
            color: Colors.white,
          ),
        ),
        trailing: const Icon(Icons.chevron_right, color: Colors.white),
        onTap: onTap,
      ),
    );
  }
}
