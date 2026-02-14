import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // สำหรับใช้ font สวยๆ

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Happy Valentine\'s Day!',
      debugShowCheckedModeBanner: false, // ซ่อนป้าย Debug
      theme: ThemeData(
        primarySwatch: Colors.pink,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: GoogleFonts.kanitTextTheme( // ใช้ Font Kanit สบายตา
          Theme.of(context).textTheme,
        ),
      ),
      home: const ValentineHomePage(),
    );
  }
}

class ValentineHomePage extends StatelessWidget {
  const ValentineHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: ResponsiveAppBar(), // AppBar ที่ปรับขนาดได้
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          // กำหนดจุดตัดว่าเมื่อไหร่จะถือว่าเป็น Mobile/Desktop
          if (constraints.maxWidth < 600) {
            return const MobileLayout();
          } else {
            return const DesktopLayout();
          }
        },
      ),
    );
  }
}

// --- Responsive AppBar ---
class ResponsiveAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.pink[50],
      elevation: 0,
      centerTitle: true,
      title: Text(
        'For my Dear 💖',
        style: GoogleFonts.kanit(
          color: Colors.pink[700],
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}


// --- Layout สำหรับ Desktop ---
class DesktopLayout extends StatelessWidget {
  const DesktopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Banner หลัก
          _buildHeroBanner(context, isMobile: false),
          const SizedBox(height: 40),
          _buildSectionTitle('ช่วงเวลาของเรา'),
          _buildLoveStories(context, isMobile: false),
          const SizedBox(height: 40),
          _buildFooter(context),
        ],
      ),
    );
  }
}

// --- Layout สำหรับ Mobile ---
class MobileLayout extends StatelessWidget {
  const MobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Banner หลัก
          _buildHeroBanner(context, isMobile: true),
          const SizedBox(height: 30),
          _buildSectionTitle('ช่วงเวลาของเรา'),
          _buildLoveStories(context, isMobile: true),
          const SizedBox(height: 30),
          _buildFooter(context),
        ],
      ),
    );
  }
}

// --- Widgets ย่อยๆ ที่ใช้ร่วมกัน ---

Widget _buildHeroBanner(BuildContext context, {required bool isMobile}) {
  return Container(
    margin: const EdgeInsets.all(20),
    padding: EdgeInsets.symmetric(
      horizontal: isMobile ? 20 : 80,
      vertical: isMobile ? 40 : 80,
    ),
    decoration: BoxDecoration(
      image: DecorationImage(
        
        image: const AssetImage('assets/images/pic5.jpg'),
        fit: BoxFit.cover,
        colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.3), BlendMode.darken),
      ),
      borderRadius: BorderRadius.circular(15),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center, // จัดให้อยู่กลาง
      children: [
        Text(
          'สุขสันต์วันวาเลนไทน์นะครับ',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: isMobile ? 36 : 50,
            fontWeight: FontWeight.bold,
            shadows: const [Shadow(blurRadius: 10.0, color: Colors.black54)],
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: isMobile ? double.infinity : MediaQuery.of(context).size.width * 0.5,
          child: Text(
            'ขอบคุณที่เข้ามาเป็นความสุขในชีวิตนะค้าบบ',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white.withOpacity(0.9),
              fontSize: isMobile ? 18 : 22,
              shadows: const [Shadow(blurRadius: 8.0, color: Colors.black54)],
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _buildSectionTitle(String title) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
    child: Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.pink,
        ),
      ),
    ),
  );
}



Widget _buildLoveStories(BuildContext context, {required bool isMobile}) {
  // --- แก้ไขข้อความและรูปภาพตรงนี้ได้เลย ---
  // คุณสามารถเพิ่ม/ลด รายการใน `stories` ได้ตามต้องการ
  // อย่าลืมเปลี่ยน 'assets/images/pic1.png' เป็นรูปภาพของคุณเองนะครับ
  List<Map<String, String>> stories = [
    {
      'image': 'assets/images/pic4.jpg', // <-- เปลี่ยนรูป
      'title': 'รักคุณแฟนเยอะทุกวันๆ',
      'text': 'อยากให้คุณแฟนรักเต๋อเต๋อเยอะๆ'
    },
    {
      'image': 'assets/images/pic2.jpg', // <-- เปลี่ยนรูป
      'title': 'คุณหมูของเต๋อเต๋อ',
      'text': 'น่ารักที่สูดดดดดดดดดดดด'
    },
    {
      'image': 'assets/images/pic3.jpg', // <-- เปลี่ยนรูป
      'title': 'ถึงจะขี้ลืมแต่ไม่ลืมรักคูณแฟนน่ะค้าบ',
      'text': '💖💖💖💖💖💖💖💖💖💖'
    },
  ];

  return isMobile
      ? Column( // บนมือถือแสดงเป็น Column
          children: stories.map((story) => LoveStoryCard(
            image: story['image']!,
            title: story['title']!,
            text: story['text']!,
          )).toList(),
        )
      : Row( // บน Desktop แสดงเป็น Row
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: stories.map((story) => Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: LoveStoryCard(
                image: story['image']!,
                title: story['title']!,
                text: story['text']!,
              ),
            ),
          )).toList(),
        );
}

class LoveStoryCard extends StatelessWidget {
  final String image;
  final String title;
  final String text;

  const LoveStoryCard({super.key, required this.image, required this.title, required this.text});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
            child: Image.asset(
              image,
              height: 240,
              width: double.infinity,
              fit: BoxFit.cover,
              alignment: Alignment.center, // เปลี่ยนมาจัดกลางเพื่อให้เห็นใบหน้าชัดขึ้น
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.pink)),
                const SizedBox(height: 8),
                Text(text, style: const TextStyle(fontSize: 14, color: Colors.black87)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildFooter(BuildContext context) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
    color: Colors.pink[50],
    child: Text(
      'Made with all my love... just for you.\nFrom TerTer',
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.pink[700], fontSize: 14, height: 1.5),
    ),
  );
}