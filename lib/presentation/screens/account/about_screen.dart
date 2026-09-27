import 'package:app_image/app_image.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../../core/assets/assets.dart';
import '../../../core/locale/l10n/app_localizations.dart';
import '../../../core/themes/app_sizes.dart';
import '../../../core/utilities/external_launcher.dart';
import '../../widgets/app_snack_bar.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  String version = '';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final packageInfo = await PackageInfo.fromPlatform();

      version = packageInfo.version;

      if (!mounted) return;

      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.about),
        titleSpacing: 0,
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 720),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(AppSizes.padding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const _AboutLogo(),
                const SizedBox(height: AppSizes.padding),
                Text(
                  l10n.developerName,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: AppSizes.padding / 4),
                Text(
                  l10n.developerRole,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: AppSizes.padding * 2),
                _AboutParagraph(text: l10n.aboutIntro),
                const SizedBox(height: AppSizes.padding),
                _AboutParagraph(text: l10n.aboutExperience),
                const SizedBox(height: AppSizes.padding * 2),
                _AboutSection(
                  title: l10n.aboutPosTitle,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _AboutParagraph(text: l10n.aboutPosBody),
                      const SizedBox(height: AppSizes.padding),
                      _AboutParagraph(text: l10n.aboutPosFeatures),
                    ],
                  ),
                ),
                const SizedBox(height: AppSizes.padding * 2),
                _AboutSection(
                  title: l10n.aboutSkillsTitle,
                  child: _SkillList(skills: l10n.aboutSkills),
                ),
                const SizedBox(height: AppSizes.padding * 2),
                _AboutSection(
                  title: l10n.aboutContactTitle,
                  child: Column(
                    children: [
                      _ContactRow(
                        icon: Icons.phone_outlined,
                        label: l10n.mobile,
                        value: l10n.aboutPhone,
                        onTap: () => _openContact(() => ExternalLauncher.openPhone(l10n.aboutPhone)),
                      ),
                      _ContactRow(
                        icon: Icons.email_outlined,
                        label: l10n.email,
                        value: l10n.aboutEmail,
                        onTap: () => _openContact(() => ExternalLauncher.openEmail(l10n.aboutEmail)),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: AppSizes.padding * 2),
                _AboutSection(
                  title: l10n.aboutVisionTitle,
                  child: _AboutParagraph(text: l10n.aboutVision),
                ),
                const SizedBox(height: AppSizes.padding),
                _AboutFooter(version: version),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _openContact(Future<void> Function() open) async {
    try {
      await open();
    } on Exception {
      if (!mounted) return;

      AppSnackBar.showError(AppLocalizations.of(context).somethingWentWrong);
    }
  }
}

class _AboutLogo extends StatelessWidget {
  const _AboutLogo();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: AppImage(
        image: Assets.welcome,
        imgProvider: ImgProvider.assetImage,
        width: 120,
      ),
    );
  }
}

class _AboutSection extends StatelessWidget {
  const _AboutSection({
    required this.title,
    required this.child,
  });

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: AppSizes.padding / 2),
        child,
      ],
    );
  }
}

class _AboutParagraph extends StatelessWidget {
  const _AboutParagraph({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.start,
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(height: 1.6),
    );
  }
}

class _SkillList extends StatelessWidget {
  const _SkillList({required this.skills});

  final String skills;

  @override
  Widget build(BuildContext context) {
    final items = skills.split('\n').where((item) => item.trim().isNotEmpty).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (final item in items)
          Padding(
            padding: const EdgeInsets.only(bottom: AppSizes.padding / 3),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '•',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: AppSizes.padding / 2),
                Expanded(
                  child: Text(
                    item.trim(),
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}

class _ContactRow extends StatelessWidget {
  const _ContactRow({
    required this.icon,
    required this.label,
    required this.value,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final String value;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppSizes.radius),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: AppSizes.padding / 3),
        child: Row(
          children: [
            Icon(icon, size: 18, color: color),
            const SizedBox(width: AppSizes.padding / 2),
            Text(
              '$label: ',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: Text(
                value,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: color,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AboutFooter extends StatelessWidget {
  const _AboutFooter({required this.version});

  final String version;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final outline = Theme.of(context).colorScheme.outline;

    return Column(
      children: [
        const Divider(),
        const SizedBox(height: AppSizes.padding),
        Text(
          l10n.developedBy,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: AppSizes.padding / 2),
        Text(
          l10n.copyright,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.labelSmall?.copyWith(color: outline),
        ),
        if (version.isNotEmpty) ...[
          const SizedBox(height: AppSizes.padding / 4),
          Text(
            l10n.versionLabel(version),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: outline,
            ),
          ),
        ],
      ],
    );
  }
}
