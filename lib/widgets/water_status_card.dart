import 'package:flutter/material.dart';
import '../models/dwlr_station.dart';

/// Water status card widget
class WaterStatusCard extends StatelessWidget {
  final WaterStatus status;
  final String title;
  final String subtitle;
  final List<DWLRStation> stations;

  const WaterStatusCard({
    super.key,
    required this.status,
    required this.title,
    required this.subtitle,
    required this.stations,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: _getStatusColor(status, context).withValues(alpha: 0.3),
            width: 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: _getStatusColor(status, context),
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  status.name.toUpperCase(),
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: _getStatusColor(status, context),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              subtitle,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
            if (stations.isNotEmpty) ...[
              const SizedBox(height: 8),
              Text(
                'Stations: ${stations.map((s) => s.stationId).join(', ')}',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ],
        ),
      ),
    );
  }

  Color _getStatusColor(WaterStatus status, BuildContext context) {
    switch (status) {
      case WaterStatus.safe:
        return Theme.of(context).colorScheme.primary;
      case WaterStatus.moderate:
        return Colors.orange;
      case WaterStatus.critical:
        return Colors.red;
    }
  }
}

/// Water status enumeration
enum WaterStatus { safe, moderate, critical }
