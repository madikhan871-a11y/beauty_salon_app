import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../routes/app_routes.dart';
import '../services/salon_service.dart';
import '../widgets/service_card.dart';
import '../widgets/bottom_nav_bar.dart';

class ServicesScreen extends StatefulWidget {
  const ServicesScreen({super.key});

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  int _currentIndex = 1;
  String selectedCategory = 'All';

  @override
  Widget build(BuildContext context) {
    final allServices = SalonService.getServices();

    final categories = [
      'All',
      ...allServices.map((service) => service.category).toSet(),
    ];

    final filteredServices = selectedCategory == 'All'
        ? allServices
        : allServices
        .where((service) => service.category == selectedCategory)
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Beauty Services',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 55,
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                final selected = category == selectedCategory;

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCategory = category;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 10),
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    decoration: BoxDecoration(
                      color: selected
                          ? AppColors.primary
                          : Colors.white,
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(
                        color: selected
                            ? AppColors.primary
                            : AppColors.border,
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      category,
                      style: TextStyle(
                        color: selected
                            ? Colors.white
                            : AppColors.textDark,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.fromLTRB(20, 5, 20, 20),
              itemCount: filteredServices.length,
              itemBuilder: (context, index) {
                final service = filteredServices[index];

                return ServiceCard(
                  service: service,
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      AppRoutes.booking,
                      arguments: service,
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacementNamed(
              context,
              AppRoutes.home,
            );
          } else if (index == 2) {
            Navigator.pushReplacementNamed(
              context,
              AppRoutes.bookings,
            );
          } else if (index == 3) {
            Navigator.pushReplacementNamed(
              context,
              AppRoutes.favorites,
            );
          } else if (index == 4) {
            Navigator.pushReplacementNamed(
              context,
              AppRoutes.profile,
            );
          }
        },
      ),
    );
  }
}