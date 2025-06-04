import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_bloc/features/auth/domain/entities/app_user.dart';
import 'package:social_media_bloc/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:social_media_bloc/features/profile/presentation/cubits/profile_cubit.dart';
import 'package:social_media_bloc/features/profile/presentation/cubits/profile_state.dart';

class ProfilePage extends StatefulWidget {
  final String nis;
  const ProfilePage({super.key, required this.nis});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // cubits
  late final authCubit = context.read<AuthCubit>();
  late final profileCubit = context.read<ProfileCubit>();

  // Ambil user yang sedang login
  late AppUser? currentUser = authCubit.currentUser;

  // ketika page dibuka fetch data
  @override
  void initState() {
    super.initState();

    profileCubit.fetchUserProfile(nis: currentUser!.nis);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        // User loaded
        if (state is ProfileLoaded) {
          // ambil user yang sudah terload
          final user = state.profileUser;
          return Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    // Yellow Student Card
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Colors.orange, Colors.amber],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 10,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset(
                                  'assets/bl_logo.png',
                                  width: 75,
                                  height: 75,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      "Student Card",
                                      style: TextStyle(
                                        fontSize: 40,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      user.nama,
                                      style: TextStyle(
                                        fontSize: 25,
                                        color: Colors.white,
                                        wordSpacing: 10,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            Text(
                              '${user.nis} / ${user.nisn}',
                              style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 10),
                            Center(
                              child: ElevatedButton(
                                onPressed: null,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xFF00BFFF),
                                  shape: StadiumBorder(),
                                ),
                                child: Text("Show QR Code"),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Profile section (circle avatar, name, map, etc)
                    // Tambahin di sini sesuai kebutuhan
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                        height: 120,
                        width: 120,
                        padding: const EdgeInsets.all(25),
                        child: Center(
                          child: Icon(
                            Icons.person,
                            size: 50,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Detail Profile
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("NIS / NISN"),
                              const SizedBox(height: 5),
                              Text("Nama"),
                              const SizedBox(height: 5),
                              Text("Tempat"),
                              const SizedBox(height: 5),
                              Text("Tanggal Lahir"),
                              const SizedBox(height: 5),
                              Text("Email"),
                              const SizedBox(height: 5),
                              Text("Kelas"),
                              const SizedBox(height: 5),
                              Text("Aktif"),
                              const SizedBox(height: 10),
                              Text("Status"),
                              const SizedBox(height: 10),
                            ],
                          ),

                          const SizedBox(width: 100),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${user.nis} / ${user.nisn}',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                user.nama,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                user.tempLahir,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                user.tglLahir,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                user.email,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                user.kelasSaatIni,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                user.aktif,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                user.statLulus,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 10),
                            ],
                          ),
                        ],
                      ),
                    ),

                    // Map dummy
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      height: 100,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(child: Text("Map Placeholder")),
                    ),

                    // Menu List
                    ListTile(
                      leading: Icon(Icons.email),
                      title: Text("Email"),
                      trailing: Icon(Icons.arrow_right_rounded),
                    ),
                    ListTile(
                      leading: Icon(Icons.support_agent),
                      title: Text("Customer Support"),
                      trailing: Icon(Icons.arrow_right_rounded),
                    ),
                    ListTile(
                      leading: Icon(Icons.star),
                      title: Text("Rate Our App"),
                      trailing: Icon(Icons.arrow_right_rounded),
                    ),
                    ListTile(
                      leading: Icon(Icons.feedback),
                      title: Text("Make a Suggestion"),
                      trailing: Icon(Icons.arrow_right_rounded),
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ],
          );
        }
        // Loading..
        else if (state is ProfileLoading) {
          return Scaffold(
            body: const Center(child: CircularProgressIndicator()),
          );
        } else {
          return const Center(child: Text("Tidak ada data..."));
        }
      },
    );
  }
}
