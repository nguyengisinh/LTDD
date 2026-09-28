import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(const ProfileApp());
}

class ProfileApp extends StatelessWidget {
  const ProfileApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Applying modern typography that gracefully falls back to sans-serif
    final textTheme = GoogleFonts.plusJakartaSansTextTheme(
      Theme.of(context).textTheme,
    );

    return MaterialApp(
      title: 'Profile',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF1F5F9),
        textTheme: textTheme,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0284C7),
          surface: Colors.white,
        ),
      ),
      home: const ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktopOrWeb = screenWidth > 480;

    return Scaffold(
      backgroundColor: const Color(0xFFEEF2F6),
      body: Center(
        child: isDesktopOrWeb
            // Displayed inside the stylish smartphone frame matching the design screenshot
            ? Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 24,
                  horizontal: 16,
                ),
                constraints: const BoxConstraints(
                  maxWidth: 400,
                  maxHeight: 860,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFF8FAFC),
                  borderRadius: BorderRadius.circular(44),
                  border: Border.all(
                    color: const Color(0xFFCBD5E1),
                    width: 2.2,
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x140F172A),
                      blurRadius: 30,
                      offset: Offset(0, 12),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(42),
                  child: const ProfileContent(),
                ),
              )
            // On mobile viewports, fills natively
            : Container(
                color: const Color(0xFFF8FAFC),
                child: const SafeArea(child: ProfileContent()),
              ),
      ),
    );
  }
}

class ProfileContent extends StatelessWidget {
  const ProfileContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF8FAFC),
      child: SafeArea(
        top: true,
        bottom: true,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Top Navigation Bar
              const _TopBar(),

              const SizedBox(height: 24),

              // Avatar with vibrant gradient ring & verified check badge
              const _AvatarSection(),

              const SizedBox(height: 14),

              // Name & Headline
              const Text(
                'Gia Sinh',
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF0F172A),
                  letterSpacing: -0.4,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'Lead Mobile Engineer',
                style: TextStyle(
                  fontSize: 14.5,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF64748B),
                ),
              ),

              const SizedBox(height: 10),

              // Location Chip
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFF1F5F9),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.place_outlined,
                      size: 15,
                      color: Color(0xFF64748B),
                    ),
                    SizedBox(width: 4),
                    Text(
                      'TP.HCM, VietNam',
                      style: TextStyle(
                        fontSize: 12.5,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF334155),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 22),

              // Stats Card (Projects, Experience, Rating)
              const _StatsCard(),

              const SizedBox(height: 24),

              // About Me Section
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'About Me',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF0F172A),
                    letterSpacing: -0.3,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Passionate Lead Mobile Engineer specialized in Flutter, Dart, and building high-performance cross-platform applications. Focused on elegant',
                  style: TextStyle(
                    fontSize: 13.5,
                    height: 1.55,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF64748B),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // Skills & Expertise Section
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Skills & Expertise',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF0F172A),
                    letterSpacing: -0.3,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              const _SkillsWrap(),

              const SizedBox(height: 24),

              // Featured Projects Section
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Featured Projects',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF0F172A),
                    letterSpacing: -0.3,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              const _FeaturedProjectsRow(),

              const SizedBox(height: 24),

              // Contact Information Card
              const _ContactCard(),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

// Top Bar with back button and share button
class _TopBar extends StatelessWidget {
  const _TopBar();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Back Button
        InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(12),
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFFE2E8F0), width: 1),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x0A0F172A),
                  blurRadius: 6,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: const Icon(
              Icons.chevron_left_rounded,
              color: Color(0xFF0F172A),
              size: 24,
            ),
          ),
        ),

        // Title
        const Text(
          'Profile',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w800,
            color: Color(0xFF0F172A),
            letterSpacing: -0.3,
          ),
        ),

        // Share Button
        InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(12),
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFFE2E8F0), width: 1),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x0A0F172A),
                  blurRadius: 6,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: const Icon(
              Icons.share_outlined,
              color: Color(0xFF0F172A),
              size: 19,
            ),
          ),
        ),
      ],
    );
  }
}

// Avatar Section with colorful gradient border and verified badge
class _AvatarSection extends StatelessWidget {
  const _AvatarSection();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          // Gradient outer ring
          Container(
            width: 124,
            height: 124,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFFFB7185), // Coral/pink
                  Color(0xFFF97316), // Orange
                  Color(0xFFFBBF24), // Amber/gold
                ],
              ),
            ),
            padding: const EdgeInsets.all(3.5),
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              padding: const EdgeInsets.all(3.0),
              child: ClipOval(
                child: Image.asset(
                  'assets/images/avatar.jpg',
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: const Color(0xFFE2E8F0),
                      child: const Icon(
                        Icons.person,
                        size: 60,
                        color: Color(0xFF94A3B8),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),

          // Verified Check Badge positioned at bottom-right of the avatar
          Positioned(
            right: 4,
            bottom: 4,
            child: Container(
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                color: const Color(0xFF0284C7),
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2.2),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x4C0284C7),
                    blurRadius: 6,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: const Icon(
                Icons.check_rounded,
                size: 13,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// 3-Column Stats Card (Projects, Experience, Rating)
class _StatsCard extends StatelessWidget {
  const _StatsCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: const Color(0xFFEEF2F6), width: 1.2),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0A0F172A),
            blurRadius: 16,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // 148 Projects
          const Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '148',
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF0F172A),
                    letterSpacing: -0.4,
                  ),
                ),
                SizedBox(height: 3),
                Text(
                  'Projects',
                  style: TextStyle(
                    fontSize: 12.5,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF94A3B8),
                  ),
                ),
              ],
            ),
          ),

          // Divider 1
          Container(height: 28, width: 1, color: const Color(0xFFE2E8F0)),

          // 9 Yrs Experience
          const Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '9 Yrs',
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF0F172A),
                    letterSpacing: -0.4,
                  ),
                ),
                SizedBox(height: 3),
                Text(
                  'Experience',
                  style: TextStyle(
                    fontSize: 12.5,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF94A3B8),
                  ),
                ),
              ],
            ),
          ),

          // Divider 2
          Container(height: 28, width: 1, color: const Color(0xFFE2E8F0)),

          // 4.9 ★ Rating
          const Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '4.9',
                      style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFFF59E0B),
                        letterSpacing: -0.4,
                      ),
                    ),
                    SizedBox(width: 4),
                    Icon(
                      Icons.star_rounded,
                      size: 20,
                      color: Color(0xFFF59E0B),
                    ),
                  ],
                ),
                SizedBox(height: 3),
                Text(
                  'Rating',
                  style: TextStyle(
                    fontSize: 12.5,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF94A3B8),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Skills & Expertise Chip Wrap
class _SkillsWrap extends StatelessWidget {
  const _SkillsWrap();

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.centerLeft,
      child: Wrap(
        spacing: 8,
        runSpacing: 10,
        children: [
          _SkillBadge(
            label: 'Flutter',
            icon: Icons.draw_outlined,
            backgroundColor: Color(0xFFE0F2FE),
            contentColor: Color(0xFF0284C7),
          ),
          _SkillBadge(
            label: 'Dart',
            icon: Icons.code_rounded,
            backgroundColor: Color(0xFFDCFCE7),
            contentColor: Color(0xFF16A34A),
          ),
          _SkillBadge(
            label: 'Clean Arch',
            icon: Icons.layers_outlined,
            backgroundColor: Color(0xFFFFE4E6),
            contentColor: Color(0xFFE11D48),
          ),
          _SkillBadge(
            label: 'UI/UX',
            icon: Icons.local_offer_outlined,
            backgroundColor: Color(0xFFF3E8FF),
            contentColor: Color(0xFF9333EA),
          ),
          _SkillBadge(
            label: 'Firebase',
            icon: Icons.local_fire_department_outlined,
            backgroundColor: Color(0xFFFEF3C7),
            contentColor: Color(0xFFD97706),
          ),
        ],
      ),
    );
  }
}

// Individual Skill Badge
class _SkillBadge extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color backgroundColor;
  final Color contentColor;

  const _SkillBadge({
    required this.label,
    required this.icon,
    required this.backgroundColor,
    required this.contentColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 15, color: contentColor),
          const SizedBox(width: 6),
          Text(
            label,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: contentColor,
            ),
          ),
        ],
      ),
    );
  }
}

// Featured Projects side-by-side cards
class _FeaturedProjectsRow extends StatelessWidget {
  const _FeaturedProjectsRow();

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        // Project 1: E-Shop Flutter
        Expanded(
          child: _ProjectCard(
            title: 'E-Shop Flutter',
            subtitle: 'Mobile App • 2026',
            imageAssetPath: 'assets/images/eshop.jpg',
          ),
        ),

        SizedBox(width: 12),

        // Project 2: Crypto Vault
        Expanded(
          child: _ProjectCard(
            title: 'Crypto Vault',
            subtitle: 'Finance • Clean Arch',
            imageAssetPath: 'assets/images/crypto.jpg',
          ),
        ),
      ],
    );
  }
}

// Individual Featured Project Card
class _ProjectCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imageAssetPath;

  const _ProjectCard({
    required this.title,
    required this.subtitle,
    required this.imageAssetPath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFEEF2F6), width: 1.2),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0A0F172A),
            blurRadius: 10,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Project thumbnail image
            SizedBox(
              height: 92,
              width: double.infinity,
              child: Image.asset(
                imageAssetPath,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  color: const Color(0xFFE2E8F0),
                  child: const Icon(
                    Icons.image_outlined,
                    color: Color(0xFF94A3B8),
                  ),
                ),
              ),
            ),

            // Project title & category
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 13.5,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF0F172A),
                      letterSpacing: -0.2,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF64748B),
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

// Contact Information Card with 3 items
class _ContactCard extends StatelessWidget {
  const _ContactCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFEEF2F6), width: 1.2),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0A0F172A),
            blurRadius: 12,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: const Column(
        children: [
          // Item 1: Contact Information
          _ContactItem(
            icon: Icons.alternate_email_rounded,
            iconColor: Color(0xFF0F172A),
            title: 'Contact Information',
            isHeader: true,
          ),

          Divider(height: 1, thickness: 1, color: Color(0xFFF1F5F9)),

          // Item 2: Email
          _ContactItem(
            icon: Icons.mail_outline_rounded,
            iconColor: Color(0xFF64748B),
            title: 'huy118108@gmail.com',
            isHeader: false,
          ),

          Divider(height: 1, thickness: 1, color: Color(0xFFF1F5F9)),

          // Item 3: Phone
          _ContactItem(
            icon: Icons.phone_outlined,
            iconColor: Color(0xFF64748B),
            title: '0962193817',
            isHeader: false,
          ),
        ],
      ),
    );
  }
}

// Individual Contact item row
class _ContactItem extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final bool isHeader;

  const _ContactItem({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.isHeader,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(16),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Row(
          children: [
            Icon(icon, size: 20, color: iconColor),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: isHeader ? 14.5 : 13.5,
                  fontWeight: isHeader ? FontWeight.w700 : FontWeight.w500,
                  color: isHeader
                      ? const Color(0xFF0F172A)
                      : const Color(0xFF334155),
                  letterSpacing: -0.2,
                ),
              ),
            ),
            const Icon(
              Icons.chevron_right_rounded,
              size: 19,
              color: Color(0xFFCBD5E1),
            ),
          ],
        ),
      ),
    );
  }
}
