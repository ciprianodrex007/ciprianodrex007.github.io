import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myweb_portfolio/Models/footer.dart';

class MyIntro extends StatefulWidget {
  const MyIntro({super.key});

  @override
  State<MyIntro> createState() => _MyIntroState();
}

class _MyIntroState extends State<MyIntro> {
  final List<GlobalKey> _keys =
      List.generate(5, (index) => GlobalKey()); // Keys for sections
  final List<bool> _visibility =
      List.generate(5, (index) => false); // Visibility state
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {
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
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.8,
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
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          // Use LayoutBuilder to determine if the width is less than 650
                          bool isSmallScreen = constraints.maxWidth < 450;

                          return isSmallScreen
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    _buildSectionTitle("About Me"),
                                    _buildSectionContent(
                                      "Hello! I'm Drexler Cipriano, a passionate developer specializing in cloud computing, DevOps, and full stack development. With a background in Bachelor of Science in Information Systems (BSIS), I have collaborated with various companies to deliver scalable solutions that enhance their operational efficiency and drive innovation.",
                                    ),
                                    _buildProfileImage("assets/cloud.png"),
                                    // Profile image
                                  ],
                                )
                              : Row(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          _buildSectionTitle("About Me"),
                                          _buildSectionContent(
                                            "Hello! I'm Drexler Cipriano, a passionate developer specializing in cloud computing, DevOps, and full stack development. With a background in Bachelor of Science in Information Systems (BSIS), I have collaborated with various companies to deliver scalable solutions that enhance their operational efficiency and drive innovation.",
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: _buildProfileImage(
                                          "assets/cloud.png"), // Profile image
                                    ),
                                  ],
                                );
                        },
                      ),
                    ),
                    _buildSection(1, "My Background",
                        "I have a strong technical foundation, with key skills including:\n- Cloud Services: Proficient in AWS and Google Cloud Platform (GCP)\n- Containerization: Experienced with Docker and Kubernetes\n- CI/CD: Knowledgeable in Jenkins and Git\n- Programming Languages: Familiar with Go, PHP, and Dart (for Flutter)"),
                    _buildSection(2, "Fun Fact",
                        "When I'm not coding, you can find me exploring new technologies in my free time, especially in the realm of Internet of Things (IoT). I love tinkering with hardware projects and finding innovative ways to integrate them with software solutions."),
                    _buildSection(3, "Brief Bio",
                        "I thrive in dynamic environments and enjoy collaborating with cross-functional teams to tackle complex challenges. My commitment to continuous learning drives me to stay updated with industry trends and best practices. I believe that technology has the power to transform lives, and I am excited to be part of that journey!"),
                  ],
                ),
              ),
            ),
            Footer(),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(int index, String title, String content) {
    double opacity = _visibility[index] ? 1.0 : 0.1;
    return AnimatedOpacity(
      opacity: opacity,
      duration: Duration(milliseconds: 500),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.5,
        key: _keys[index],
        child: LayoutBuilder(
          builder: (context, constraints) {
            // Use LayoutBuilder to determine if the width is less than 650
            bool isSmallScreen = constraints.maxWidth < 450;

            return isSmallScreen
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildSectionTitle(title),
                      _buildSectionContent(content),
                      _buildProfileImage("assets/cloud.png"), // Profile image
                    ],
                  )
                : Row(
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
      padding: const EdgeInsets.only(bottom: 16.0),
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
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(image), // Replace with your asset path
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
