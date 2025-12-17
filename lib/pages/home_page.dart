// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

// Import ThemeService from main.dart
import 'package:portfolio_app/main.dart';

// ============================================================================
// A. HOME PAGE
// ============================================================================

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = context.watch<ThemeService>().isDark;
    final themeService = context.read<ThemeService>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.asset(
                "assets/images/logo.png",
                width: 34,
                height: 34,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 10),

            const Text(
              "CLIMEL",
              style: TextStyle(
                fontFamily: "Serif",
                fontSize: 17,
                fontWeight: FontWeight.w800,
                letterSpacing: 1,
                color: Colors.white70,
              ),
            ),

            const SizedBox(width: 6),

            const Text(
              "|Web Development",
              style: TextStyle(
                fontSize: 13,
                fontFamily: "Serif",
                fontWeight: FontWeight.w300,
                color: Colors.white,
              ),
            ),
          ],
        ),

        actions: [
          Row(
            children: [
              const Icon(Icons.wb_sunny, color: Colors.white70),
              Switch(
                value: isDark,
                onChanged: themeService.toggleTheme,
              ),
              const Icon(Icons.dark_mode, color: Colors.white70),
              const SizedBox(width: 10),
            ],
          ),
        ],
      ),

      // ======================================================================
      // BODY
      // ======================================================================
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Center(
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage("assets/images/cover.jpg"),
                ),
              ),

              const SizedBox(height: 20),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  "I build scalable Web and Mobile applications for tech-focused startups in Africa.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),

              const SizedBox(height: 30),

              // UPDATED BUTTON
              const RoundedButton(
                Icons.email,
                "Start a Project",
                isEmailAction: true,
              ),

              const SizedBox(height: 40),

              // ---------------- TESTIMONIALS ----------------
              const SectionCard(
                title: "Client Endorsements",
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "“Collins' development speed and quality control were exceptional. The app launched flawlessly.”",
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 16,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "- CEO, Tech Innovators Inc.",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 40),

              // ---------------- CORE SKILLS ----------------
              SectionCard(
                title: "Technical Skills",
                child: Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: const [
                    SkillIcon("Flutter", "assets/icons/flutter.png"),
                    SkillIcon("Dart", "assets/icons/dart.png"),
                    
                    SkillIcon("JavaScript", "assets/icons/js.png"),
                    SkillIcon("HTML", "assets/icons/html.png"),
                    SkillIcon("CSS", "assets/icons/css.png"),
                    SkillIcon("PHP", "assets/icons/php.png"),
                    SkillIcon("MongoDB", "assets/icons/mongo.png"),
                    
                    
                    // Frameworks
                    
                    SkillIcon("Node.js", "assets/icons/node.png"),
                    SkillIcon("Express", "assets/icons/express.png"),
                    SkillIcon("Bootstrap", "assets/icons/bootstrap.png"),
                  ],
                ),
              ),

              const SizedBox(height: 40),

              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Experience & Training",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),

              const SizedBox(height: 16),

              ExperienceCard(
                title: "HNG 13 Internship",
                role: "Mobile Application Developer (Flutter)",
                duration: "Summer 2025 | Remote",
                logoPath: "assets/images/hng_logo_logo.jpeg",
              ),

              const SizedBox(height: 40),

              // ---------------- PROJECTS ----------------
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Featured Projects",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),

              const SizedBox(height: 16),

              const ProjectCard(
                title: "Ctranslate Mobile App",
                desc: "An offline-centric translation app for low-resource languages.",
                imagePath: "assets/images/ctranslate_mockup.png",
                linkUrl: "https://github.com/Climel-Inc/Ctranslate",
                linkText: "View Code",
              ),

              const SizedBox(height: 20),

              const ProjectCard(
                title: "ToDo App",
                desc: "A productivity app to manage daily tasks with Firebase backend.",
                imagePath: "assets/images/todo_mockup.jpg",
                linkUrl: "https://github.com/Climel-Inc/TodoApp",
                linkText: "View Code",
              ),

              const SizedBox(height: 20),

              const ProjectCard(
                title: "Shuttle Cruz",
                desc: "A mobile booking app for reserving campus shuttle services.",
                imagePath: "assets/images/shuttle_cruz_mockup.jpg",
                linkUrl: "FIGMA_LINK_HERE",
                linkText: "View Design",
              ),

              const SizedBox(height: 20),

              const ProjectCard(
                title: "Wallpaper Selector",
                desc: "A desktop app for browsing and setting wallpapers quickly.",
                imagePath: "assets/images/wallpaper_selector_mockup.jpg",
                linkUrl:
                    "https://www.linkedin.com/posts/collins-john-97464115a_hng-hnginternship-activity-7391971376364089344-9G4A",
                linkText: "View Demo",
              ),

              const SizedBox(height: 40),

              const SectionCard(
                title: "About Me",
                child: Text(
                  "Hi, I’m Collins Ehimhen Amiohu — a tech-driven professional from Abuja, Nigeria. I have a background in web development, sales, marketing, and administration. My focus is delivering high-performance, beautiful mobile experiences with a business-driven mindset.",
                  style: TextStyle(fontSize: 16),
                ),
              ),

              const SizedBox(height: 40),

              SectionCard(
                title: "Education & Professional Training",
                child: Column(
                  children: [
                    QualificationTile(
                      title: "Computer Science B.Sc. (In View)",
                      subtitle: "University of Abuja | Building a strong CS foundation.",
                    ),
                    QualificationTile(
                      title: "Web Development Certification",
                      subtitle: "Code Center Ikeja | Core web technologies.",
                    ),
                    QualificationTile(
                      title: "Certified Project Manager",
                      subtitle: "DSA | Leadership & Project Delivery.",
                      trailingWidget: Image.asset(
                        "assets/images/dsa_cert_icon.png",
                        width: 40,
                        height: 40,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 40),

              const SectionCard(
                title: "Ready to Transform Your Idea?",
                child: Column(
                  children: [
                    Text(
                      "Let's build something exceptional together. I'm available for new projects.",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 15),
                    RoundedButton(
                      Icons.email,
                      "Send Me an Email",
                      isEmailAction: true,
                    ),
                    SizedBox(height: 15),
                    RoundedButton(
                      Icons.download,
                      "Download CV",
                      url:
                          "https://drive.google.com/drive/folders/1YsefeApKMQh7KB4AiPBw0TL6yIMMzOVJ",
                    ),
                    SizedBox(height: 15),
                    RoundedButton(
                      Icons.download,
                      "Download Resume",
                      url:
                          "https://drive.google.com/drive/folders/1C7eXxPr6t_6KUKMGGikNfKPb_BtZ4mJQ",
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}

// ============================================================================
// B. COMPONENTS
// ============================================================================

// SectionCard
class SectionCard extends StatelessWidget {
  final String title;
  final Widget child;

  const SectionCard({super.key, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: isDark ? Colors.blueGrey.shade900 : Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: isDark ? Colors.black54 : Colors.black12,
            blurRadius: 6,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          child,
        ],
      ),
    );
  }
}

// SkillIcon (NEW)
class SkillIcon extends StatelessWidget {
  final String name;
  final String iconPath;

  const SkillIcon(this.name, this.iconPath, {super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color:
            isDark ? Colors.deepPurple.shade900 : Colors.deepPurple.shade50,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(iconPath, width: 20, height: 20),
          const SizedBox(width: 8),
          Text(
            name,
            style: TextStyle(
              color: isDark ? Colors.white70 : Colors.deepPurple.shade900,
            ),
          ),
        ],
      ),
    );
  }
}

// Updated RoundedButton
class RoundedButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final String? url;
  final bool isEmailAction;

  const RoundedButton(
    this.icon,
    this.label, {
    super.key,
    this.url,
    this.isEmailAction = false,
  });

  Future<void> _launchEmail() async {
    final email = Uri(
      scheme: "mailto",
      path: "johncollinsbran@gmail.com",
      query:
          "subject=Project Request&body=Hi Collins,%0A%0AI would like to start a new project...",
    );

    await launchUrl(email);
  }

  Future<void> _launchURL(String url) async {
    final uri = Uri.parse(url);
    await launchUrl(uri);
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final bg = isDark ? Colors.deepPurple.shade700 : Colors.deepPurple;

    return InkWell(
      onTap: () {
        if (isEmailAction) {
          _launchEmail();
        } else if (url != null) {
          _launchURL(url!);
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 22, color: Colors.white),
            const SizedBox(width: 10),
            Text(
              label,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ProjectCard
class ProjectCard extends StatelessWidget {
  final String title;
  final String desc;
  final String imagePath;
  final String? linkUrl;
  final String? linkText;

  const ProjectCard({
    super.key,
    required this.title,
    required this.desc,
    required this.imagePath,
    this.linkUrl,
    this.linkText,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? Colors.deepPurple.shade900 : Colors.deepPurple.shade50,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  imagePath,
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: isDark ? Colors.white : Colors.black,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      desc,
                      style: TextStyle(
                        fontSize: 14,
                        color: isDark ? Colors.grey[400] : Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          if (linkUrl != null && linkText != null) ...[
            const SizedBox(height: 15),
            GestureDetector(
              onTap: () async {
                final uri = Uri.parse(linkUrl!);
                await launchUrl(uri);
              },
              child: Text(
                linkText!,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.blue.shade200,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

// ExperienceCard
class ExperienceCard extends StatelessWidget {
  final String title;
  final String role;
  final String duration;
  final String logoPath;

  const ExperienceCard({
    super.key,
    required this.title,
    required this.role,
    required this.duration,
    required this.logoPath,
  });

  @override
  Widget build(BuildContext context) {
    return SectionCard(
      title: title,
      child: Row(
        children: [
          Image.asset(logoPath, height: 50, width: 50),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(role, style: const TextStyle(fontSize: 16)),
                Text(duration, style: const TextStyle(color: Colors.grey)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// QualificationTile
class QualificationTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget? trailingWidget;

  const QualificationTile({
    super.key,
    required this.title,
    required this.subtitle,
    this.trailingWidget,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
      subtitle: Text(subtitle),
      trailing: trailingWidget,
    );
  }
}
