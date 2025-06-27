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

                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15),
                              child: Text(
                                email,
                                style: GoogleFonts.inter(fontSize: 18),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15),
                              child: Text(
                                'Year: $year',
                                style: GoogleFonts.inter(fontSize: 18),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15),
                              child: GestureDetector(
                                onTap: () async {
                                  final result = await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          UserProfileEdit(name: userName, year: year),
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
                            ),
                          ],
                        ),
                        Image.asset(
                          'assets/images/profile_person.png',
                          scale: 2,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  height: 60,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  child: Padding(
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
        ),
      ),
    );
  }

  void _logout() {
    // TODO: integrate logout with your API
  }
}
