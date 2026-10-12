import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class Tab2Screen extends StatefulWidget {
  const Tab2Screen({super.key});

  @override
  State<Tab2Screen> createState() => _Tab2ScreenState();
}

class _Tab2ScreenState extends State<Tab2Screen> {
  double _payAmount = 1.5;
  String _slippage = '0.5%';
  bool _swapping = false;

  @override
  Widget build(BuildContext context) {
    final receiveAmount = _payAmount * 2640.50;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Vault DEX • Instant Swap', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        backgroundColor: AppTheme.surface,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: AppTheme.card,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: AppTheme.primary.withValues(alpha: 0.3)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('You Pay', style: TextStyle(color: AppTheme.textSecondary, fontSize: 13)),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('$_payAmount ETH', style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(color: AppTheme.surface, borderRadius: BorderRadius.circular(12)),
                        child: const Row(
                          children: [
                            Icon(Icons.diamond_outlined, color: AppTheme.primary, size: 18),
                            SizedBox(width: 6),
                            Text('ETH', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Slider(
                    value: _payAmount,
                    min: 0.1,
                    max: 5.0,
                    divisions: 49,
                    activeColor: AppTheme.primary,
                    onChanged: (v) => setState(() => _payAmount = double.parse(v.toStringAsFixed(2))),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            const Center(
              child: CircleAvatar(
                radius: 20,
                backgroundColor: AppTheme.primary,
                child: Icon(Icons.swap_vert, color: Colors.white),
              ),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: AppTheme.card,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: AppTheme.secondary.withValues(alpha: 0.3)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('You Receive (Estimated)', style: TextStyle(color: AppTheme.textSecondary, fontSize: 13)),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('\$${receiveAmount.toStringAsFixed(2)}', style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppTheme.secondary)),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(color: AppTheme.surface, borderRadius: BorderRadius.circular(12)),
                        child: const Row(
                          children: [
                            Icon(Icons.attach_money, color: AppTheme.secondary, size: 18),
                            SizedBox(width: 6),
                            Text('USDC', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Slippage Tolerance', style: TextStyle(color: AppTheme.textSecondary, fontSize: 13)),
                Row(
                  children: ['0.1%', '0.5%', '1.0%'].map((s) => Padding(
                    padding: const EdgeInsets.only(left: 6),
                    child: ChoiceChip(
                      label: Text(s),
                      selected: _slippage == s,
                      selectedColor: AppTheme.primary.withValues(alpha: 0.4),
                      onSelected: (val) => setState(() => _slippage = s),
                    ),
                  )).toList(),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(color: AppTheme.surface, borderRadius: BorderRadius.circular(12)),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Estimated Gas Fee', style: TextStyle(color: AppTheme.textSecondary, fontSize: 12)),
                  Text('~ \$2.14 (Gwei 16)', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)),
                ],
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _swapping ? null : () {
                setState(() => _swapping = true);
                Future.delayed(const Duration(seconds: 1), () {
                  if (mounted) setState(() => _swapping = false);
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.primary,
                foregroundColor: Colors.white,
                minimumSize: const Size.fromHeight(52),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
              ),
              child: Text(_swapping ? 'Routing Swap...' : 'Execute Swap', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}
