import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_bloc/features/dashboard/presentation/components/bottom_menu/bloc/bottom_menu_bloc.dart';
import 'package:social_media_bloc/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:social_media_bloc/features/notification/presentation/pages/notification_page.dart';
import 'package:social_media_bloc/features/profile/presentation/pages/profile_layout.dart';
import 'package:social_media_bloc/features/search/presentation/pages/search_page.dart';

class MyBottomNavigationItems extends StatelessWidget {
  const MyBottomNavigationItems({super.key});

  void _handleNavigation(BuildContext context, int index) {
    // Ambil currentIndex sekarang di BloC
    final currentIndex = context.read<BottomMenuBloc>().state.currentIndex;
    // kalo index yang dipilih sama kayak currentIndex di BloC
    // gabakal nampilin halaman yang sama
    if (index == currentIndex) return;

    Widget targetPage;

    switch (index) {
      case 0:
        targetPage = const DashboardPage();
        break;
      case 1:
        targetPage = const NotificationPage();
        break;
      case 2:
        targetPage = const SearchPage();
        break;
      case 3:
        targetPage = const ProfileLayout();
        break;
      default:
        return;
    }

    // Navigator push ke halaman baru
    Navigator.push(context, MaterialPageRoute(builder: (_) => targetPage))
        .then((_) => context.read<BottomMenuBloc>().add(BottomMenuChanged(0)))
        .then(
          (_) => Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => DashboardPage()),
          ),
        );

    // Optional: update index di bloc juga, kalau masih dipakai
    context.read<BottomMenuBloc>().add(BottomMenuChanged(index));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomMenuBloc, BottomMenuState>(
      builder: (context, state) {
        return BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: state.currentIndex,
          showSelectedLabels: true,
          unselectedLabelStyle: TextStyle(
            color: Theme.of(context).colorScheme.primary,
          ),
          unselectedItemColor: Theme.of(context).colorScheme.primary,
          selectedItemColor: Theme.of(context).colorScheme.inversePrimary,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: "Notification",
            ),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ],
          onTap: (index) => _handleNavigation(context, index),
        );
      },
    );
  }
}
