import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:user_auth_crudd10/pages/userProfileEdit_page.dart';
import 'package:user_auth_crudd10/services/settings/theme_provider.dart';
import 'package:user_auth_crudd10/widgets/features/logOut_func.dart';
import 'package:user_auth_crudd10/widgets/global/about_us.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String userName = 'Guest User';
  String email = 'guest@example.com';
  String year = '1';

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          'Profile Page',
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w500,
            fontSize: 22,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/images/profile_person.png',
                  scale: 2,
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        userName,
                        style: GoogleFonts.inter(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        email,
                        style: GoogleFonts.inter(fontSize: 18),
                      ),
                      Text(
                        'Year: $year',
                        style: GoogleFonts.inter(fontSize: 18),
                      ),
                      GestureDetector(
                        onTap: () async {
                          final result = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => UserProfileEdit(
                                name: userName,
                                year: year,
                              ),
                            ),
                          );
                          if (result != null) {
                            setState(() {
                              userName = result['name'];
                              year = result['year'];
                            });
                          }
                        },
                        child: Text(
                          'Edit',
                          style: GoogleFonts.inter(
                            fontSize: 18,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25),
            Container(
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Theme.of(context).colorScheme.primary,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.nights_stay_rounded),
                  const Text(
                    'Dark Mode',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Switch(
                    value: themeProvider.isDarkMode,
                    onChanged: (value) {
                      themeProvider.toggleTheme();
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            /// 🔻 Вот твоя кастомная кнопка выхода
            // LogoutButton(
            //   onLogout: () {
            //     // Тут можно добавить очистку токена, SharedPreferences и т.д.
            //     Navigator.of(context).pushReplacementNamed('/login');
            //   },
            // ),
            //
            // const SizedBox(height: 20),
            // const AboutUs(), // если он у тебя реализован
          ],
        ),
      ),
    );
  }
}
