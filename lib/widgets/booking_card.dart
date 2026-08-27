import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../models/booking_model.dart';
import '../services/booking_service.dart';

class BookingCard extends StatelessWidget {
  final BookingModel booking;

  const BookingCard({
    super.key,
    required this.booking,
  });

  @override
  Widget build(BuildContext context) {
    final bool cancelled = booking.status == 'Cancelled';

    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  booking.serviceName,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: cancelled
                      ? Colors.red.shade50
                      : AppColors.primaryLight,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  booking.status,
                  style: TextStyle(
                    color: cancelled ? Colors.red : AppColors.primary,
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              const Icon(
                Icons.calendar_month_outlined,
                size: 18,
                color: AppColors.textGrey,
              ),
              const SizedBox(width: 7),
              Text(booking.date),
              const SizedBox(width: 18),
              const Icon(
                Icons.access_time,
                size: 18,
                color: AppColors.textGrey,
              ),
              const SizedBox(width: 7),
              Text(booking.time),
            ],
          ),
          const SizedBox(height: 13),
          Row(
            children: [
              Text(
                'Rs. ${booking.price.toStringAsFixed(0)}',
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  color: AppColors.primary,
                ),
              ),
              const Spacer(),
              if (!cancelled)
                TextButton(
                  onPressed: () {
                    BookingService.cancelBooking(booking.id);
                    (context as Element).markNeedsBuild();
                  },
                  child: const Text(
                    'Cancel',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}