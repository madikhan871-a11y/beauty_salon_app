import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../routes/app_routes.dart';
import '../services/salon_service.dart';
import '../widgets/salon_card.dart';
import '../widgets/bottom_nav_bar.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final salons = SalonService.getSalons();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Favorites',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text(
            'Your favorite salons',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 15),
          ...salons.take(2).map(
                (salon) => Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: SalonCard(
                salon: salon,
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    AppRoutes.services,
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 15),
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: AppColors.primaryLight,
              borderRadius: BorderRadius.circular(18),
            ),
            child: const Row(
              children: [
                Icon(
                  Icons.favorite,
                  color: AppColors.primary,
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Save salons you love for quick booking later.',
                    style: TextStyle(
                      color: AppColors.textDark,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: 3,
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacementNamed(
              context,
              AppRoutes.home,
            );
          } else if (index == 1) {
            Navigator.pushReplacementNamed(
              context,
              AppRoutes.services,
            );
          } else if (index == 2) {
            Navigator.pushReplacementNamed(
              context,
              AppRoutes.bookings,
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