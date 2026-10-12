import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../services/routing_service.dart';

class Tab4Screen extends StatefulWidget {
  const Tab4Screen({super.key});

  @override
  State<Tab4Screen> createState() => _Tab4ScreenState();
}

class _Tab4ScreenState extends State<Tab4Screen> {
  bool _biometrics = true;
  bool _autoLock = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vault • Security Center', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        backgroundColor: AppTheme.surface,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppTheme.card,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: AppTheme.secondary.withValues(alpha: 0.3)),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 28,
                    backgroundColor: AppTheme.secondary.withValues(alpha: 0.2),
                    child: const Icon(Icons.shield, color: AppTheme.secondary, size: 30),
                  ),
                  const SizedBox(width: 16),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Vault Security Score: 98%', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white)),
                        SizedBox(height: 4),
                        Text('Encrypted with AES-256 GCM. Seed phrase backed up.', style: TextStyle(color: AppTheme.textSecondary, fontSize: 12)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            SwitchListTile(
              title: const Text('Biometric Authentication', style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white)),
              subtitle: const Text('FaceID / Fingerprint unlock', style: TextStyle(fontSize: 12, color: AppTheme.textSecondary)),
              value: _biometrics,
              activeThumbColor: AppTheme.primary,
              onChanged: (v) => setState(() => _biometrics = v),
            ),
            SwitchListTile(
              title: const Text('Auto-Lock on Background', style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white)),
              subtitle: const Text('Lock after 30 seconds of inactivity', style: TextStyle(fontSize: 12, color: AppTheme.textSecondary)),
              value: _autoLock,
              activeThumbColor: AppTheme.primary,
              onChanged: (v) => setState(() => _autoLock = v),
            ),
            const Divider(color: Colors.white24, height: 32),
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [Color(0xFF2E7D32), Color(0xFF1B5E20)]),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('VIP Hardware Signer Pass', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 16)),
                  const SizedBox(height: 6),
                  const Text('Sync seamlessly with cold wallets and access zero-slippage liquidity pools.', style: TextStyle(color: Colors.white70, fontSize: 12)),
                  const SizedBox(height: 14),
                  ElevatedButton(
                    onPressed: () => RoutingService.openRegistrationUrl(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: const Color(0xFF1B5E20),
                      minimumSize: const Size.fromHeight(44),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    child: const Text('Activate VIP Pass', style: TextStyle(fontWeight: FontWeight.bold)),
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
