import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myweb_portfolio/Models/footer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../Utils/popup_icon.dart';

class MyIntro extends StatefulWidget {
  const MyIntro({super.key});

  @override
  State<MyIntro> createState() => _MyIntroState();
}

class _MyIntroState extends State<MyIntro> {
  String aboutme =
      "Hello! I'm Drexler Cipriano, with a Bachelor of Science in Information Systems (BSIS). My journey into ICT began during my college years, where I gained experience in various programming languages and technologies, including C++, PHP, HTML, JavaScript, Bootstrap, VB.NET, PHP MySQL, Flutter, Firebase, Arduino, and IoT. These foundational skills sparked my passion for technology and set the stage for my professional growth.";
  String background =
      "I have a solid technical background, which is complimented with good time management abilities and a strong desire to learn and apply new ideas. I am an exceptionally skilled programmer that has completed multiple projects as a full-stack developer. During my internship at FDS Asya Philippines Inc., I received the award for Best IT Project, demonstrating my dedication to excellence and capacity to provide meaningful outcomes.";
  String brief =
      "My activities, which include traveling and gaming, help me maintain a sense of balance. My dedication to continual learning motivates me to keep current on industry trends and best practices, as I feel that technology has the potential to alter people's lives, and I am thrilled to be a part of that journey. I thrive in dynamic workplaces and love working with cross-functional teams to solve challenging problems. With a solid technical basis, I have excellent time management abilities and a strong desire to learn and develop. I am a skilled programmer who has completed multiple projects as a full-stack developer and was awarded the best IT project during my internship at FDS Asya Philippines Inc. ";
  final List<GlobalKey> _keys =
      List.generate(5, (index) => GlobalKey()); // Keys for sections
  final List<bool> _visibility =
      List.generate(5, (index) => false); // Visibility state
  final ScrollController _scrollController = ScrollController();
  bool _isBriefBioVisible = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_checkScrollPosition);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_checkScrollPosition);
    _scrollController.dispose();
    super.dispose();
  }

  void _checkScrollPosition() {
    for (int i = 0; i < _keys.length; i++) {
      RenderBox? renderBox =
          _keys[i].currentContext?.findRenderObject() as RenderBox?;
      if (renderBox != null) {
        Offset topOffset = renderBox.localToGlobal(Offset.zero);
        double top = topOffset.dy;
        double bottom = top + renderBox.size.height;
        double viewportHeight = MediaQuery.of(context).size.height;

        // Check if the section is within the viewport
        _visibility[i] = (top >= 0 && bottom <= viewportHeight);
      }
    }

    // Check if the Brief Bio section is specifically in view
    double offset =
        MediaQuery.of(context).size.height * 0.25; // Threshold for visibility
    setState(() {
      _isBriefBioVisible = _scrollController.offset >= offset;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Positioned(left: 1, bottom: 1, right: 1, child: Footer()),
            Container(
              height: MediaQuery.of(context).size.height * 0.9,
              width: MediaQuery.of(context).size.width * 0.9,
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.transparent,
              ),
              child: SingleChildScrollView(
                controller: _scrollController,
                physics: const BouncingScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Initial visible section
                    Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      key: _keys[0], // Assigning the key for this section
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          bool isSmallScreen = constraints.maxWidth < 450;

                          return isSmallScreen
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    _buildProfileImage("assets/meme.jpg"),
                                    Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.1,
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Flexible(
                                            child: PopupIcon(
                                              icon: FontAwesomeIcons.facebook,
                                              color: Color(0xff1877F2),
                                              text: 'Facebook',
                                              url:
                                                  'https://www.facebook.com/smiley.drex',
                                            ),
                                          ),
                                          Flexible(
                                            child: PopupIcon(
                                              icon: FontAwesomeIcons.linkedin,
                                              color: Color(0xff0e76a8),
                                              text: 'LinkedIn',
                                              url:
                                                  'https://www.linkedin.com/in/drexler-cipriano-046b832b8/',
                                            ),
                                          ),
                                          Flexible(
                                            child: PopupIcon(
                                              icon: FontAwesomeIcons.github,
                                              color: Color(0xff333333),
                                              text: 'GitHub',
                                              url:
                                                  'https://github.com/ciprianodrex007',
                                            ),
                                          ),
                                          Flexible(
                                            child: PopupIcon(
                                              icon: FontAwesomeIcons.google,
                                              color: Color(0xffDB4437),
                                              text: 'Google',
                                              url:
                                                  'https://mail.google.com/mail/?view=cm&fs=1&to=ciprianodrex007@gmail.com',
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    _buildSectionTitle("About Me"),
                                    _buildSectionContent(aboutme),
                                  ],
                                )
                              : Row(
                                  children: [
                                    Column(
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.232,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.25,
                                          child: _buildProfileImage(
                                              "assets/meme.jpg"),
                                        ),
                                        Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.10,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.232,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Flexible(
                                                child: PopupIcon(
                                                  icon:
                                                      FontAwesomeIcons.facebook,
                                                  color: Color(0xff1877F2),
                                                  text: 'Facebook',
                                                  url:
                                                      'https://www.facebook.com/smiley.drex',
                                                ),
                                              ),
                                              Flexible(
                                                child: PopupIcon(
                                                  icon:
                                                      FontAwesomeIcons.linkedin,
                                                  color: Color(0xff0e76a8),
                                                  text: 'LinkedIn',
                                                  url:
                                                      'https://www.linkedin.com/in/drexler-cipriano-046b832b8/',
                                                ),
                                              ),
                                              Flexible(
                                                child: PopupIcon(
                                                  icon: FontAwesomeIcons.github,
                                                  color: Color(0xff333333),
                                                  text: 'GitHub',
                                                  url:
                                                      'https://github.com/ciprianodrex007',
                                                ),
                                              ),
                                              Flexible(
                                                child: PopupIcon(
                                                  icon: FontAwesomeIcons.google,
                                                  color: Color(0xffDB4437),
                                                  text: 'Google',
                                                  url:
                                                      'https://mail.google.com/mail/?view=cm&fs=1&to=ciprianodrex007@gmail.com',
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          _buildSectionTitle("About Me"),
                                          _buildSectionContent(aboutme),
                                        ],
                                      ),
                                    ),
                                  ],
                                );
                        },
                      ),
                    ),
                    _buildSection(1, "My Background", background,
                        key: _keys[1]),
                    // Animated Brief Bio Section
                    AnimatedOpacity(
                      opacity: _isBriefBioVisible ? 1.0 : 0.2,
                      duration: Duration(milliseconds: 500),
                      child: Container(
                        key: _keys[2],
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: LayoutBuilder(
                          builder: (context, constraints) {
                            bool isSmallScreen = constraints.maxWidth < 450;
                            return isSmallScreen
                                ? Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      _buildProfileImage("assets/1.jpg"),
                                      _buildSectionTitle("Brief Bio"),
                                      _buildSectionContent(brief),
                                    ],
                                  )
                                : Row(
                                    children: [
                                      Column(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.all(15),
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.332,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.55,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage("assets/1.jpg"), // Replace with your asset path
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            _buildSectionTitle("Brief Bio"),
                                            _buildSectionContent(brief),
                                          ],
                                        ),
                                      ),
                                    ],
                                  );
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 200,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(int index, String title, String content, {Key? key}) {
    double opacity = _visibility[index]
        ? 1.0
        : 0.2; // Change to 0.0 to fully hide when not visible
    return AnimatedOpacity(
      opacity: opacity,
      duration: Duration(milliseconds: 500),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.7,
        key: key, // Use the provided key here
        child: LayoutBuilder(
          builder: (context, constraints) {
            bool isSmallScreen = constraints.maxWidth < 450;

            return isSmallScreen
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 50),
                      _buildSectionTitle(title),
                      _buildSectionContent(content),
                      _buildProfileImage("assets/cloud.png"), // Profile image
                      SizedBox(height: 50),
                    ],
                  )
                : Container(
                    margin: EdgeInsets.symmetric(vertical: 50),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildSectionTitle(title),
                              _buildSectionContent(content),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: _buildProfileImage(
                              "assets/cloud.png"), // Profile image
                        ),
                      ],
                    ),
                  );
          },
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: MediaQuery.of(context).size.width * 0.025,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildSectionContent(String content) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 26.0),
      child: Text(
        content,
        style: TextStyle(
          fontSize: MediaQuery.of(context).size.width * 0.016,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildProfileImage(String image) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.7,
        height: MediaQuery.of(context).size.height * 0.25,
        margin: EdgeInsets.symmetric(vertical: 5.0),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(image), // Replace with your asset path
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
