import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:mobile_app/core/app_strings.dart';
import 'package:mobile_app/features/bookings/presentation/pages/bookings_page.dart';
import 'package:mobile_app/features/bookings/presentation/state/bookings_bloc.dart';
import 'package:mobile_app/features/current/presentation/pages/current_page.dart';
import 'package:mobile_app/features/current/presentation/state/current_bloc.dart';
import 'package:mobile_app/features/events/presentation/pages/events_page.dart';
import 'package:mobile_app/features/events/presentation/state/events_bloc.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<BottomNavigationBarItem> items = const [
    BottomNavigationBarItem(
      icon: Icon(Icons.notifications_active_outlined),
      label: AppStrings.inProgress,
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.event),
      label: AppStrings.events,
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.home_repair_service_sharp),
      label: AppStrings.bookings,
    ),
  ];

  int page = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.appName, style: TextStyle(color: theme.onPrimaryContainer),),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [theme.primaryContainer, theme.secondaryContainer],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: _buildPage(page),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: page,
        items: items,
        onTap: (index) {
          setState(() {
            page = index;
          });
        },
        selectedItemColor: theme.primary,
        unselectedItemColor: theme.onSurfaceVariant,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        backgroundColor: theme.surface,
        elevation: 8,
      ),
    );
  }

  Widget _buildPage(int index) {
    switch (index) {
      case 0:
        return BlocProvider(
          create: (context) => GetIt.instance.get<CurrentBloc>(),
          child: const CurrentPage(),
        );
      case 1:
        return BlocProvider(
          create: (context) => GetIt.instance.get<EventsBloc>(),
          child: EventsPage(),
        );
      case 2:
        return BlocProvider(
          create: (context) => GetIt.instance.get<BookingsBloc>(),
          child: BookingsPage(),
        );
      default:
        return Container();
    }
  }
}
