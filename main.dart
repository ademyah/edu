import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'تعليم الرياضيات',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginScreen(),
    );
  }
}
class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text('اتصال'),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Card(
            margin: EdgeInsets.all(20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 5,
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "تسجيل الدخول",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 15),

                  // Champ Email
                  buildTextField("بريد إلكتروني", Icons.email),
                  // Champ Mot de passe
                  buildTextField("كلمة المرور", Icons.lock, isPassword: true),

                  SizedBox(height: 15),

                  // Bouton Connexion
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => HomeScreen()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        "تسجيل الدخول",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),

                  SizedBox(height: 10),

                  // Lien vers Inscription
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignupScreen()),
                      );
                    },
                    child: Text(
                      "ليس لديك حساب؟ قم بالتسجيل",
                      style: TextStyle(fontSize: 16, color: Colors.blue),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String hint, IconData icon, {bool isPassword = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        obscureText: isPassword,
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Colors.grey),
          hintText: hint,
          filled: true,
          fillColor: Colors.grey[200],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}


class SignupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text("إنشاء حساب جديد"),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Card(
            margin: EdgeInsets.all(20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 5,
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Champs de texte
                  buildTextField("الاسم الأول", Icons.person),
                  buildTextField("الاسم الأخير", Icons.person_outline),
                  buildTextField("البريد الإلكتروني", Icons.email),
                  buildTextField("رقم الهاتف", Icons.phone),
                  buildTextField("العنوان", Icons.location_on),
                  buildTextField("كلمة المرور", Icons.lock, isPassword: true),
                  buildTextField("تأكيد كلمة المرور", Icons.lock, isPassword: true),

                  SizedBox(height: 15), // Espacement

                  // Bouton Inscription avec des dimensions adaptées
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // Action du bouton
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        "إنشاء حساب",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String hint, IconData icon, {bool isPassword = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        obscureText: isPassword,
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Colors.grey),
          hintText: hint,
          filled: true,
          fillColor: Colors.grey[200],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String searchText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: InputDecoration(
            hintText: 'للبحث...',
            border: InputBorder.none,
            hintStyle: TextStyle(color: Colors.black),
          ),
          style: TextStyle(color: Colors.black),
          onChanged: (value) {
            setState(() {
              searchText = value;
            });
          },
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'قائمة',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('مرحباً'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.school),
              title: Text('إحصائية'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => StatisticsScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('حساب تعريفي'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileScreen()),
                );
              },
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.network(
              'https://st.depositphotos.com/1144687/1902/i/450/depositphotos_19024147-stock-photo-drawing-city-over-book.jpg',
              fit: BoxFit.cover,
            ),
          ),
          SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Center(
              child: Column(
                children: [
                  Wrap(
                    spacing: 16,
                    runSpacing: 16,
                    alignment: WrapAlignment.center,
                    children: [
                      ExerciseCard(
                        title: 'عملية حسابية',
                        imageUrl: 'https://img.freepik.com/photos-gratuite/fond-ecran-colore-flou-vif_58702-4182.jpg?semt=ais_hybrid',
                        level: 'المستوى: مبتدئ',
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => OperationScreen()),
                          );
                        },
                      ),
                      ExerciseCard(
                        title: ' أسئلة متعددة الخيارات',
                        imageUrl: 'https://www.lightzoomlumiere.fr/wp-content/uploads/2019/04/Temperature-de-couleur-degrade-des-teintes-de-la-lumiere-Copyright-Light-ZOOM-Lumiere-1-1366x683.png',
                        level: 'المستوى: متوسط',
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => QcmScreen()),
                          );
                        },
                      ),
                      ExerciseCard(
                        title: 'موضوع',
                        imageUrl: 'https://agence-communication.re/wp-content/uploads/2023/06/couleur-rose-signification-1.jpg',
                        level: 'المستوى: متقدم',
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SujetScreen()),
                          );
                        },
                      ),
                      ExerciseCard(
                        title: 'مزيد من المساعدة',
                        imageUrl: 'https://www.colorhexa.com/ffcc00.png',
                        level: 'المستوى: مبتدئ',
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => RessourcesScreen()),
                          );
                          // Ajouter une navigation pour l'addition
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ExerciseCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String level;
  final VoidCallback onPressed;

  ExerciseCard({required this.title, required this.imageUrl, required this.level, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2 - 22,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 5,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.network(imageUrl, height: 100, width: double.infinity, fit: BoxFit.cover),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Text(level, style: TextStyle(fontSize: 16, color: Colors.grey)),
                  SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: onPressed,
                    child: Text('للبدء'),
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

class QuizScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('تمارين الرياضيات')),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.network(
              'https://www.shutterstock.com/image-vector/math-education-background-design-vector-260nw-363864293.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Text(
              'هنا سوف تأتي أسئلة الرياضيات!',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

// Écrans des exercices spécifiques

class OperationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('تمرين العملية')),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.network(
              'https://st.depositphotos.com/1144687/1902/i/450/depositphotos_19024147-stock-photo-drawing-city-over-book.jpg',
              fit: BoxFit.cover,
            ),
          ),
          SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Center(
              child: Wrap(
                spacing: 16,
                runSpacing: 16,
                alignment: WrapAlignment.center,
                children: [
                  ExerciseCard(
                    title: ' جمع',
                    imageUrl: 'https://img.freepik.com/photos-gratuite/fond-ecran-colore-flou-vif_58702-4182.jpg?semt=ais_hybrid',
                    level: 'المستوى: مبتدئ',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ScratchScreen()),
                      );
                    },
                  ),
                  ExerciseCard(
                    title: 'الطرح',
                    imageUrl: 'https://www.lightzoomlumiere.fr/wp-content/uploads/2019/04/Temperature-de-couleur-degrade-des-teintes-de-la-lumiere-Copyright-Light-ZOOM-Lumiere-1-1366x683.png',
                    level: 'المستوى: مبتدئ',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ScratchScreen()),
                      );
                    },
                  ),
                  ExerciseCard(
                    title: 'الضرب',
                    imageUrl: 'https://agence-communication.re/wp-content/uploads/2023/06/couleur-rose-signification-1.jpg',
                    level: 'المستوى: مبتدئ',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ScratchScreen()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Exemple d'implémentation de ExerciseCard (à adapter selon votre projet)
class Exercise2Card extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String level;
  final VoidCallback onPressed;

  Exercise2Card({
    required this.title,
    required this.imageUrl,
    required this.level,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.network(imageUrl, height: 100, width: 100, fit: BoxFit.cover),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text(level, style: TextStyle(fontSize: 14, color: Colors.grey)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Exemple de classe ScratchScreen (à adapter selon votre projet)
class ScratchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('تمرين')),
      body: Center(child: Text('Contenu de l\'exercice Scratch ici')),
    );
  }
}

class QcmScreen extends StatefulWidget {
  @override
  _QcmScreenState createState() => _QcmScreenState();
}

class _QcmScreenState extends State<QcmScreen> {
  int _currentQuestionIndex = 0;
  int _score = 0;
  String? _selectedAnswer;

  final List<Map<String, dynamic>> _questions = [
    {
      "سؤال": "ما هو الأعداد العشرية؟",
      "إجابات": [
        "A) عدد لا يمكن كتابته على صورة كسر",
        "B) عدد يمكن كتابته على شكل كسر",
        "C) عدد صحيح",
        "D) عدد غير  عشري"
      ],
      "صحيح": "B) عدد يمكن كتابته على شكل كسر"
    },
    {
      "سؤال": "أي من هذه الأرقام عشري ؟",
      "إجابات": ["A) √2", "B) π", "C) 3/4", "D) عداد الأولي"],
      "صحيح": "C) 3/4"
    },
    {
      "سؤال": "ما هو الكسر الذي يعادل 0.75؟",
      "إجابات": ["A) 1/4", "B) 3/5", "C) 3/4", "D) 2/5"],
      "صحيح": "C) 3/4"
    },
    {
      "سؤال": "ما هي قيمة 5/8 + 3/8؟",
      "إجابات": ["A) 8/16", "B) 1", "C) 1/2", "D) 4/8"],
      "صحيح": "B) 1"
    },
    {
      "سؤال": "ما هي قيمة 7/9 × 3/4؟",
      "إجابات": ["A) 21/36", "B) 7/12", "C) 1/3", "D) 7/18"],
      "صحيح": "B) 7/12"
    },
    {
      "سؤال": "ما هي الكتابة الكسرية لـ 1.2؟",
      "إجابات": ["A) 1/2", "B) 12/10", "C) 6/5", "D) 5/6"],
      "صحيح": "C) 6/5"
    },
    {
      "سؤال": "  أي من هذه الأرقام ليس عشري ؟",
      "إجابات": ["A) 1/7", "B) 2/3", "C) 0,33333...", "D) π"],
      "صحيح": "D) π"
    },
    {
      "سؤال": "كيفية تحويل 4.25 إلى كسر؟",
      "إجابات": ["A) 4/25", "B) 17/4", "C) 9/2", "D) 8/5"],
      "صحيح": "B) 17/4"
    },
    {
      "سؤال": "إذا كان a وb عددين صحيحين وb ≠ 0، فما نوع الرقم a/b؟",
      "إجابات": [
        "A) عدد عشري",
        "B) عدد غير  عشري",
        "C) الرقم العشري محدود دائمًا",
        "D) عدد أولي"
      ],
      "صحيح": "A) عدد عشري"
    },
    {
      "سؤال": "ما هو معكوس 3/7؟",
      "إجابات": ["A) 7/3", "B) -3/7", "C) 1/3", "D) 3/7"],
      "صحيح": "A) 7/3"
    },
  ];
  void _nextQuestion() {
    if (_selectedAnswer != null) {
      if (_selectedAnswer == _questions[_currentQuestionIndex]['صحيح']) {
        _score++;
      }

      if (_currentQuestionIndex < _questions.length - 1) {
        setState(() {
          _currentQuestionIndex++;
          _selectedAnswer = null;
        });
      } else {
        _showResult();
      }
    }
  }

  void _showResult() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("نتيجة"),
          content: Text("درجاتك هي $_score / ${_questions.length}"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                setState(() {
                  _currentQuestionIndex = 0;
                  _score = 0;
                  _selectedAnswer = null;
                });
              },
              child: Text("ابدأ مرة أخرى"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: Text("مغادرة"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('تمرين'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "سؤال ${_currentQuestionIndex + 1} / ${_questions.length}",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blueAccent),
            ),
            SizedBox(height: 20),
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      _questions[_currentQuestionIndex]['سؤال'],
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    Column(
                      children: _questions[_currentQuestionIndex]['إجابات'].map<Widget>((answer) {
                        bool isSelected = _selectedAnswer == answer;
                        bool isCorrect = answer == _questions[_currentQuestionIndex]['صحيح'];

                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedAnswer = answer;
                            });
                          },
                          child: Card(
                            color: isSelected ? (isCorrect ? Colors.green : Colors.red) : Colors.white,
                            child: ListTile(
                              title: Text(
                                answer,
                                style: TextStyle(color: isSelected ? Colors.white : Colors.black),
                              ),
                              trailing: isSelected
                                  ? Icon(
                                isCorrect ? Icons.check_circle : Icons.cancel,
                                color: Colors.white,
                              )
                                  : null,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _selectedAnswer != null ? _nextQuestion : null,
              child: Text("التحقق من صحة والمتابعة"),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                padding: EdgeInsets.symmetric(vertical: 12),
                backgroundColor: Colors.blueAccent,
                textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SujetScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('تعلم الأعداد العشرية', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('📚 مقدمة عن الأعداد العشرية',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.blueAccent)),
            SizedBox(height: 12),
            Text(
              'الأعداد العشرية هي أعداد تحتوي على جزء صحيح وجزء عشري مفصولين بواسطة الفاصلة.',
              style: TextStyle(fontSize: 18, color: Colors.black87),
            ),
            SizedBox(height: 20),
            _buildLessonCard(context, 'مفاهيم الأعداد العشرية', Icons.calculate, Colors.blue, () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => SujetDetailScreen()));
            }),
            SizedBox(height: 20),
            _buildLessonCard(context, '💰 إدارة المال بالأعداد العشرية', Icons.monetization_on, Colors.green, () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => SujetMoneyScreen()));
            }),
          ],
        ),
      ),
    );
  }
}

Widget _buildLessonCard(BuildContext context, String title, IconData icon, Color color, VoidCallback onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Icon(icon, size: 40, color: color),
            SizedBox(width: 15),
            Expanded(
              child: Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            Icon(Icons.arrow_forward_ios, color: Colors.grey),
          ],
        ),
      ),
    ),
  );
}

class SujetDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('📖 مفاهيم الأعداد العشرية'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '🟢 الأعداد العشرية تتكون من جزأين: الجزء الصحيح والجزء العشري.',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text('مثال: 3.75 يتكون من 3 كجزء صحيح و 0.75 كجزء عشري.'),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ActivityScreen()));
                },
                child: Text('ابدأ التمرين', style: TextStyle(fontSize: 18, color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ActivityScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController answerController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text('✍️ تمرين على الأعداد العشرية'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('🔢 ما هو ناتج: 12.35 + 8.40 ؟', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 15),
            TextField(
              controller: answerController,
              decoration: InputDecoration(
                labelText: 'أدخل إجابتك هنا',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String userAnswer = answerController.text;
                String correctAnswer = '20.75';
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text(userAnswer == correctAnswer ? '🎉 إجابة صحيحة!' : '❌ إجابة خاطئة'),
                    content: Text(userAnswer == correctAnswer ? 'أحسنت! الإجابة صحيحة' : 'حاول مرة أخرى.'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text('موافق'),
                      ),
                    ],
                  ),
                );
              },
              child: Text('تحقق من الإجابة', style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}

class SujetMoneyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('💰 إدارة المال بالأعداد العشرية'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('📖 تطبيق الأعداد العشرية في إدارة المال',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green)),
            SizedBox(height: 12),
            Text(
              'لديك ميزانية قدرها 25.00€، وتريد شراء بعض الأدوات المدرسية:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text('- 📖 كتاب: 15.75€\n- 🖊️ أقلام: 3.40€\n- 📒 دفتر: 2.80€',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87)),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                onPressed: () {},
                child: Text('ابدأ الحساب', style: TextStyle(fontSize: 18, color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('حساب تعريفي')),
      body: Center(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 5,
          margin: EdgeInsets.all(20),
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage('https://scontent.ftun1-2.fna.fbcdn.net/v/t1.6435-9/95389830_1243887529150912_3946043830750412800_n.jpg?_nc_cat=102&ccb=1-7&_nc_sid=6ee11a&_nc_ohc=7z6vVjOgADUQ7kNvgFgCNCo&_nc_oc=AdmzI7fkuebIxzZIHGR1i0SfdjVHjq5xXojxwOOogrhvSnxFq1WlfJpenUGi7GlE5XQ&_nc_zt=23&_nc_ht=scontent.ftun1-2.fna&_nc_gid=CyDrH0JhCG0ZQQYhRqDzTQ&oh=00_AYGO2FcMfjXGXvV7FwyLYRcIbRMr_0GqrNpV0gCtHWcZFA&oe=680B6BAF'), // Remplace par l'URL de ton image
                ),
                SizedBox(height: 10),
                Text('Nom: Mohamed', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text('Prénom: Sandra', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text('Email : Sandra.MOt@email.com', style: TextStyle(fontSize: 16)),
                Text('Score: 1500', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blue)),
                Text('Rôle: Élève', style: TextStyle(fontSize: 16)),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    // Ajouter la logique de modification du profil ici
                  },
                  child: Text('Modifier le profil'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class StatisticsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Statistiques des Exercices', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Row(
              children: [
                Icon(FontAwesomeIcons.user, color: Colors.white),
                SizedBox(width: 8),
                Text('120 pts', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.blueAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              elevation: 8,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: CustomPaint(
                  size: Size(double.infinity, 300),
                  painter: LineChartPainter(),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class LineChartPainter extends CustomPainter {
  final List<double> dataPoints = [0.2, 0.6, 0.4, 0.8, 0.5]; // Valeurs normalisées

  @override
  void paint(Canvas canvas, Size size) {
    Paint linePaint = Paint()
      ..color = Colors.orangeAccent
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    Paint pointPaint = Paint()
      ..color = Colors.amber
      ..style = PaintingStyle.fill;

    Paint axisPaint = Paint()
      ..color = Colors.white
      ..strokeWidth = 2;

    double padding = 30;
    double chartHeight = size.height - padding * 2;
    double chartWidth = size.width - padding * 2;

    // Dessiner les axes
    canvas.drawLine(Offset(padding, size.height - padding), Offset(size.width - padding, size.height - padding), axisPaint); // Axe X
    canvas.drawLine(Offset(padding, padding), Offset(padding, size.height - padding), axisPaint); // Axe Y

    // Générer les points sur le graphique
    List<Offset> points = [];
    for (int i = 0; i < dataPoints.length; i++) {
      double x = padding + (chartWidth / (dataPoints.length - 1)) * i;
      double y = size.height - padding - (dataPoints[i] * chartHeight);
      points.add(Offset(x, y));
    }

    // Dessiner la courbe
    Path path = Path();
    path.moveTo(points.first.dx, points.first.dy);
    for (int i = 1; i < points.length; i++) {
      path.lineTo(points[i].dx, points[i].dy);
    }
    canvas.drawPath(path, linePaint);

    // Dessiner les points
    for (var point in points) {
      canvas.drawCircle(point, 8, pointPaint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
class RessourcesScreen extends StatelessWidget {
  final List<Map<String, dynamic>> ressources = [
    {
      "title": "🎥 Apprendre les nombres décimaux - YouTube",
      "url": "https://www.youtube.com/watch?v=dQw4w9WgXcQ", // Remplace par un vrai lien éducatif
      "icon": FontAwesomeIcons.youtube,
      "color": Colors.red
    },
    {
      "title": "📖 Cours sur les nombres décimaux - Google",
      "url": "https://www.google.com/search?q=cours+nombres+décimaux",
      "icon": FontAwesomeIcons.google,
      "color": Colors.blue
    },
    {
      "title": "🎮 Exercices interactifs - Khan Academy",
      "url": "https://fr.khanacademy.org/math/arithmetic/decimals",
      "icon": FontAwesomeIcons.graduationCap,
      "color": Colors.green
    },
  ];

  Future<void> _openUrl(String url) async {
    Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Impossible d’ouvrir $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("📚 Ressources pour apprendre"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.separated(
          itemCount: ressources.length,
          separatorBuilder: (context, index) => SizedBox(height: 12),
          itemBuilder: (context, index) {
            final ressource = ressources[index];
            return Card(
              elevation: 5,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              child: ListTile(
                leading: Icon(ressource["icon"], color: ressource["color"], size: 30),
                title: Text(ressource["title"], style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                trailing: Icon(Icons.open_in_new, color: Colors.grey),
                onTap: () => _openUrl(ressource["url"]),
              ),
            );
          },
        ),
      ),
    );
  }
}