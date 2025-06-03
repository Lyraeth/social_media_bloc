import 'package:flutter/material.dart';
import 'package:social_media_bloc/features/dashboard/presentation/components/my_bottom_navigation.dart';
import 'package:social_media_bloc/features/dashboard/presentation/components/my_drawer.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Dashboard"), centerTitle: true),
      drawer: MyDrawer(),
      bottomNavigationBar: MyBottomNavigation(),
    );
  }
}
