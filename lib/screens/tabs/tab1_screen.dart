import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../services/routing_service.dart';

class Tab1Screen extends StatefulWidget {
  const Tab1Screen({super.key});

  @override
  State<Tab1Screen> createState() => _Tab1ScreenState();
}

class _Tab1ScreenState extends State<Tab1Screen> {
  double _balance = 28450.80;
  bool _hideBalance = false;

  final List<Map<String, dynamic>> _tokens = [
    {'name': 'Bitcoin', 'symbol': 'BTC', 'bal': '0.342 BTC', 'val': '\$22,480.12', 'change': '+3.4%', 'up': true, 'icon': Icons.currency_bitcoin},
    {'name': 'Ethereum', 'symbol': 'ETH', 'bal': '1.850 ETH', 'val': '\$4,810.50', 'change': '+5.1%', 'up': true, 'icon': Icons.diamond_outlined},
    {'name': 'Solana', 'symbol': 'SOL', 'bal': '6.400 SOL', 'val': '\$960.18', 'change': '-1.2%', 'up': false, 'icon': Icons.bolt},
    {'name': 'USD Coin', 'symbol': 'USDC', 'bal': '200.00 USDC', 'val': '\$200.00', 'change': '0.0%', 'up': true, 'icon': Icons.attach_money},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Web3 Vault • Wallet', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        backgroundColor: AppTheme.surface,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.stars_rounded, color: AppTheme.primary),
            tooltip: 'VIP Reward',
            onPressed: () => RoutingService.openRegistrationUrl(),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF651FFF), Color(0xFF311B92)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(color: AppTheme.primary.withValues(alpha: 0.3), blurRadius: 16, offset: const Offset(0, 6)),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Total Net Worth', style: TextStyle(color: Colors.white70, fontSize: 13, fontWeight: FontWeight.w500)),
                      IconButton(
                        icon: Icon(_hideBalance ? Icons.visibility_off : Icons.visibility, color: Colors.white70, size: 20),
                        onPressed: () => setState(() => _hideBalance = !_hideBalance),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    _hideBalance ? '••••••••' : '\$${_balance.toStringAsFixed(2)}',
                    style: const TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold, letterSpacing: -0.5),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppTheme.secondary.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.trending_up, color: AppTheme.secondary, size: 16),
                        SizedBox(width: 4),
                        Text('+\$1,240.40 (4.56%) 24h', style: TextStyle(color: AppTheme.secondary, fontWeight: FontWeight.bold, fontSize: 12)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () => setState(() => _balance += 50.0),
                          icon: const Icon(Icons.arrow_downward_rounded, size: 18),
                          label: const Text('Receive'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white.withValues(alpha: 0.2),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () => RoutingService.openRegistrationUrl(),
                          icon: const Icon(Icons.arrow_upward_rounded, size: 18),
                          label: const Text('Send'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: const Color(0xFF311B92),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Text('Portfolio Assets', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppTheme.textPrimary)),
            const SizedBox(height: 12),
            ..._tokens.map((t) => Container(
              margin: const EdgeInsets.only(bottom: 10),
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: AppTheme.card,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppTheme.primary.withValues(alpha: 0.15)),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: AppTheme.primary.withValues(alpha: 0.2),
                    child: Icon(t['icon'] as IconData, color: AppTheme.secondary),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(t['name'] as String, style: const TextStyle(fontWeight: FontWeight.bold, color: AppTheme.textPrimary)),
                        Text(t['bal'] as String, style: const TextStyle(color: AppTheme.textSecondary, fontSize: 12)),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(t['val'] as String, style: const TextStyle(fontWeight: FontWeight.bold, color: AppTheme.textPrimary)),
                      Text(
                        t['change'] as String,
                        style: TextStyle(
                          color: (t['up'] as bool) ? AppTheme.secondary : Colors.redAccent,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
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
