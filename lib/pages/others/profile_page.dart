import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:user_auth_crudd10/pages/userProfileEdit_page.dart';
import 'package:user_auth_crudd10/services/providers/user_provider.dart';
import 'package:user_auth_crudd10/services/settings/theme_provider.dart';
import 'package:user_auth_crudd10/widgets/features/logOut_func.dart';
import 'package:user_auth_crudd10/widgets/global/about_us.dart';
import '../../model/user_model.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final userProvider = Provider.of<UserProvider>(context);
    final user = userProvider.user;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          'Profile',
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w600,
            fontSize: 24,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            /// --- USER INFO BLOCK ---
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    'assets/images/profile_person.png',
                    height: 80,
                    width: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        user?.username ?? 'Guest User',
                        style: GoogleFonts.inter(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        user?.email ?? 'guest@example.com',
                        style: GoogleFonts.inter(fontSize: 16),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Role: ${user?.role ?? 'GUEST'}',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                      const SizedBox(height: 6),
                      GestureDetector(
                        onTap: () async {
                          final result = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => UserProfileEdit(
                                name: user?.username ?? '',
                                year: '1',
                              ),
                            ),
                          );
                          if (result != null && user != null) {
                            userProvider.setUser(
                              UserModel(
                                id: user.id,
                                username: result['name'],
                                email: user.email,
                                role: user.role,
                              ),
                            );
                          }
                        },
                        child: Text(
                          'Edit profile',
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),

            /// --- DARK MODE TOGGLE ---
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Theme.of(context).cardColor,
              ),
              child: ListTile(
                leading: const Icon(Icons.nights_stay),
                title: const Text(
                  'Dark Mode',
                  style: TextStyle(fontSize: 18),
                ),
                trailing: Switch(
                  value: themeProvider.isDarkMode,
                  onChanged: (value) {
                    themeProvider.toggleTheme();
                  },
                ),
              ),
            ),

            const SizedBox(height: 20),

            /// --- ABOUT US ---
            // const AboutUs(),

            const SizedBox(height: 20),

            /// --- LOGOUT BUTTON ---
            // LogoutButton(
            //   onLogout: () {
            //     userProvider.clearUser();
            //     Navigator.of(context).pushReplacementNamed('/login');
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
