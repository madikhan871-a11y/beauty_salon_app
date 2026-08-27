import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../routes/app_routes.dart';
import '../services/booking_service.dart';
import '../widgets/booking_card.dart';
import '../widgets/bottom_nav_bar.dart';

class BookingsScreen extends StatefulWidget {
  const BookingsScreen({super.key});

  @override
  State<BookingsScreen> createState() => _BookingsScreenState();
}

class _BookingsScreenState extends State<BookingsScreen> {
  @override
  Widget build(BuildContext context) {
    final bookings = BookingService.bookings;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Bookings',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
      body: bookings.isEmpty
          ? Center(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                  color: AppColors.primaryLight,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.calendar_month_outlined,
                  size: 42,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'No bookings yet',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Book your first beauty appointment and it will appear here.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.textGrey,
                ),
              ),
              const SizedBox(height: 22),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    AppRoutes.services,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                ),
                child: const Text('Explore Services'),
              ),
            ],
          ),
        ),
      )
          : ListView.builder(
        padding: const EdgeInsets.fromLTRB(20, 5, 20, 20),
        itemCount: bookings.length,
        itemBuilder: (context, index) {
          return BookingCard(
            booking: bookings[index],
          );
        },
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: 2,
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