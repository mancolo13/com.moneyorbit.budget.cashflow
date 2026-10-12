import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class Tab3Screen extends StatefulWidget {
  const Tab3Screen({super.key});

  @override
  State<Tab3Screen> createState() => _Tab3ScreenState();
}

class _Tab3ScreenState extends State<Tab3Screen> {
  String _filter = 'All';

  final List<Map<String, dynamic>> _txs = [
    {'title': 'Received Bitcoin', 'hash': '0x8f2...4a9c', 'amt': '+0.05 BTC', 'time': '12 mins ago', 'status': 'Confirmed', 'type': 'In'},
    {'title': 'Uniswap V3 Swap', 'hash': '0x3c1...8b2e', 'amt': '-1.2 ETH', 'time': '2 hours ago', 'status': 'Confirmed', 'type': 'Swap'},
    {'title': 'Sent Solana', 'hash': '0x7e4...91df', 'amt': '-4.0 SOL', 'time': 'Yesterday', 'status': 'Confirmed', 'type': 'Out'},
    {'title': 'Bridge to Arbitrum', 'hash': '0x1a8...55c0', 'amt': '500 USDC', 'time': '3 days ago', 'status': 'Confirmed', 'type': 'Bridge'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Activity • On-Chain History', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        backgroundColor: AppTheme.surface,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: ['All', 'Received', 'Sent', 'Swaps'].map((f) => Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: FilterChip(
                    label: Text(f),
                    selected: _filter == f,
                    selectedColor: AppTheme.primary.withValues(alpha: 0.3),
                    onSelected: (val) => setState(() => _filter = f),
                  ),
                )).toList(),
              ),
            ),
            const SizedBox(height: 16),
            ..._txs.map((tx) => Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppTheme.card,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppTheme.primary.withValues(alpha: 0.15)),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: AppTheme.surface,
                    child: Icon(
                      tx['type'] == 'In' ? Icons.call_received : (tx['type'] == 'Out' ? Icons.call_made : Icons.swap_horiz),
                      color: tx['type'] == 'In' ? AppTheme.secondary : AppTheme.primary,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(tx['title'] as String, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                        const SizedBox(height: 4),
                        Text('Hash: ${tx['hash']} • ${tx['time']}', style: const TextStyle(color: AppTheme.textSecondary, fontSize: 11)),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(tx['amt'] as String, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 14)),
                      const SizedBox(height: 4),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(color: Colors.green.withValues(alpha: 0.2), borderRadius: BorderRadius.circular(6)),
                        child: Text(tx['status'] as String, style: const TextStyle(color: Colors.greenAccent, fontSize: 10, fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}
