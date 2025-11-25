import 'package:flutter/material.dart';
import 'package:my_pet/utils/colors.dart';
import 'package:my_pet/widgets/settings_widgets.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  // --- STATE VARIABLES ---
  double _bgmVolume = 0.7;
  double _envVolume = 0.5;
  double _seVolume = 0.8;
  String _graphicMode = "standard";
  bool _energySaving = true;
  bool _vibration = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                        color: AppColors.primaryYellow,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.black54,
                        size: 20,
                      ),
                    ),
                  ),
                  const Expanded(
                    child: Center(
                      child: Text(
                        "settings",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black45,
                          letterSpacing: 2,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 40),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Menu List
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                children: [
                  SettingsTile(
                    title: "ID display",
                    onTap: () => _showIdDialog(context),
                  ),
                  SettingsTile(
                    title: "sound settings",
                    onTap: () => _showSoundDialog(context),
                  ),
                  SettingsTile(
                    title: "graphic settings",
                    onTap: () => _showGraphicDialog(context),
                  ),
                  SettingsTile(
                    title: "Re-download assets",
                    onTap: () => _showRedownloadDialog(context),
                  ),
                  SettingsTile(
                    title: "clear cache",
                    onTap: () => _showClearCacheDialog(context),
                  ),
                  SettingsTile(
                    title: "Frequently asked questions",
                    onTap: () => _showFaqDialog(context),
                  ),
                  SettingsTile(
                    title: "Energy saving mode",
                    onTap: () => _showEnergyDialog(context),
                  ),
                  SettingsTile(
                    title: "Vibration settings",
                    onTap: () => _showVibrationDialog(context),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- SCREEN 3: ID ---
  void _showIdDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => SettingsDialog(
        title: "ID",
        icon: Icons.close,
        content: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Aaaa1234",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(width: 10),
                const Icon(Icons.copy, size: 20, color: Colors.grey),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // --- SCREEN 4: SOUND ---
  void _showSoundDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => SettingsDialog(
          title: "sound settings",
          icon: Icons.close,
          content: Column(
            children: [
              const Text(
                "You can choose the sound!",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              SoundSlider(
                label: "BGM",
                value: _bgmVolume,
                onChanged: (v) => setState(() => _bgmVolume = v),
              ),
              const SizedBox(height: 10),
              SoundSlider(
                label: "environmental sounds",
                value: _envVolume,
                onChanged: (v) => setState(() => _envVolume = v),
              ),
              const SizedBox(height: 10),
              SoundSlider(
                label: "SE (sound effect)",
                value: _seVolume,
                onChanged: (v) => setState(() => _seVolume = v),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // --- SCREEN 5: GRAPHIC ---
  void _showGraphicDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => SettingsDialog(
          title: "graphic settings",
          icon: Icons.close,
          content: Column(
            children: [
              const Text(
                "set it to a low load, the smoothness of the movement will decrease.\nYou can reduce battery consumption and heat generation.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12, color: Colors.black54),
              ),
              const SizedBox(height: 20),
              Text(
                "Current setting: ${_graphicMode == 'standard' ? 'Standard' : 'Low Load'}",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  GraphicOptionBtn(
                    label: "low load",
                    isSelected: _graphicMode == 'low',
                    onTap: () => setState(() => _graphicMode = 'low'),
                  ),
                  const SizedBox(width: 10),
                  GraphicOptionBtn(
                    label: "standard",
                    isSelected: _graphicMode == 'standard',
                    onTap: () => setState(() => _graphicMode = 'standard'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showFaqDetailDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.all(20),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                    child: Text(
                      "Frequently asked questions",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "dummy text dummy text dummy text dummy text",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  const SizedBox(height: 15),

                  // Search/Input Box
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Text(
                      "dummy text",
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  const Divider(height: 30),

                  const Text(
                    "dummy text dummy text dummy text\ndummy text dummy text dummy text",
                    style: TextStyle(fontSize: 12),
                  ),
                  const SizedBox(height: 30),

                  // Helpful? Box
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        const Text(
                          "Was this article helpful?",
                          style: TextStyle(fontSize: 10),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(child: _buildFaqBtn("yes", false)),
                            const SizedBox(width: 10),
                            Expanded(child: _buildFaqBtn("No", true)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Center(
                    child: Text(
                      "Contact customer support directly",
                      style: TextStyle(fontSize: 10),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Center(child: _buildFaqBtn("Inquiry", true, width: 150)),
                  const SizedBox(height: 20),
                  const Center(
                    child: Text(
                      "Return to home",
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: -15,
              left: -10,
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    color: AppColors.primaryYellow,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.arrow_back,
                    size: 20,
                    color: Colors.black54,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- SCREEN 6: RE-DOWNLOAD ASSETS ---
  void _showRedownloadDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => SettingsDialog(
        title: "Re-download assets",
        icon: Icons.close,
        content: Column(
          children: [
            const Text(
              "to download the app\nDownload the required data.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              "We strongly recommend downloading in a Wi-Fi environment.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 10, color: Colors.black87),
            ),
            const SizedBox(height: 15),
            const Text(
              "Download size: Approximately 1234MB",
              style: TextStyle(fontSize: 12, color: Colors.black54),
            ),
            const SizedBox(height: 20),
            SettingsActionBtn(
              label: "download",
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }

  // --- SCREEN 7: CLEAR CACHE ---
  void _showClearCacheDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => SettingsDialog(
        title: "clear cache",
        icon: Icons.close,
        content: Column(
          children: [
            const Text(
              "Clearing the cache will free up storage space.\nItems will not disappear during this process.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 15),
            const Text(
              "Problems and display errors may be resolved by clearing the cache.\nClearing the cache may slow down the loading of images such as items.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 10, color: Colors.black54),
            ),
            const SizedBox(height: 20),
            SettingsActionBtn(
              label: "clear cache",
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }

  // --- SCREEN 8: ENERGY SAVING ---
  void _showEnergyDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => SettingsDialog(
          title: "Energy saving mode",
          icon: Icons.close,
          content: Column(
            children: [
              const Text(
                "dummy text dummy text dummy text\ndummy text dummy text dummy text",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12, color: Colors.black87),
              ),
              const SizedBox(height: 30),
              SettingsToggleRow(
                label: "Energy saving mode",
                value: _energySaving,
                onChanged: (v) => setState(() => _energySaving = v),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // --- SCREEN 9: VIBRATION ---
  void _showVibrationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => SettingsDialog(
          title: "Vibration settings",
          icon: Icons.close,
          content: Column(
            children: [
              const Text(
                "dummy text dummy text dummy text\ndummy text dummy text dummy text",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12, color: Colors.black87),
              ),
              const SizedBox(height: 30),
              SettingsToggleRow(
                label: "Vibration settings",
                value: _vibration,
                onChanged: (v) => setState(() => _vibration = v),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFaqBtn(String label, bool isYellow, {double? width}) {
    return Container(
      width: width,
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: isYellow ? AppColors.primaryYellow : Colors.white,
        border: isYellow ? null : Border.all(color: AppColors.primaryYellow),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Text(
          label,
          style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  // --- SCREEN 10: FAQ ---
  void _showFaqDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => SettingsDialog(
        title: "Frequently asked questions",
        icon: Icons.close, // Left X
        content: SizedBox(
          height: 400, // Fixed height for scrolling
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top Description Box
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "• Dummy textDummy textDummy text",
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "• Dummy text Dummy text Dummy text",
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Dummy text\n• Dummy textDummy text\n• Dummy textDummy textDummy text",
                        style: TextStyle(fontSize: 10),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                const Text(
                  "FAQ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                const SizedBox(height: 10),

                // Small Buttons Grid
                const Row(
                  children: [
                    FaqSmallBtn(label: "dummy text"),
                    SizedBox(width: 10),
                    FaqSmallBtn(label: "dummy text"),
                  ],
                ),
                const SizedBox(height: 10),
                const Row(
                  children: [
                    FaqSmallBtn(label: "dummy text"),
                    SizedBox(width: 10),
                    FaqSmallBtn(label: "dummy text"),
                  ],
                ),

                const SizedBox(height: 20),
                const Text(
                  "■ dummy text",
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),

                // Expandable Tiles
                const FaqTile(title: "dummy text dummy text"),
                const FaqTile(title: "dummy text dummy text"),
                const FaqTile(title: "dummy text dummy text"),

                const SizedBox(height: 15),
                const Text(
                  "■ dummy text",
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                const FaqTile(title: "dummy text dummy text"),
                const FaqTile(title: "dummy text dummy text"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
