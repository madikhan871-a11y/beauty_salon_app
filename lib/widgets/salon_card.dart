import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../models/salon_model.dart';

class SalonCard extends StatelessWidget {
  final SalonModel salon;
  final VoidCallback? onTap;

  const SalonCard({
    super.key,
    required this.salon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 280,
        margin: const EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(22),
          border: Border.all(color: AppColors.border),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(22),
              ),
              child: Image.network(
                salon.imageUrl,
                height: 145,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 145,
                    color: AppColors.primaryLight,
                    child: const Center(
                      child: Icon(
                        Icons.spa_outlined,
                        size: 50,
                        color: AppColors.primary,
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(14),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          salon.name,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 7),
                        Row(
                          children: [
                            const Icon(
                              Icons.location_on_outlined,
                              size: 17,
                              color: AppColors.textGrey,
                            ),
                            const SizedBox(width: 4),
                            Expanded(
                              child: Text(
                                salon.location,
                                style: const TextStyle(
                                  color: AppColors.textGrey,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Icon(
                    Icons.star_rounded,
                    color: Colors.amber,
                    size: 18,
                  ),
                  const SizedBox(width: 3),
                  Text(
                    salon.rating.toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}