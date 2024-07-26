import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingPage extends StatefulWidget {
  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();

  final List<Map<String, String>> _pages = [
    {
      'image': 'assets/images/Onboarding_3.png',
      'title': 'Welcome',
      'description': 'Our app helps rural people improve digital literacy and manage their daily tasks with ease. Welcome to our Digital Literacy App, designed to empower rural women with essential technology skills. This app provides easy-to-follow tutorials and practical exercises to help you navigate the digital world confidently. Explore, learn, and connect with new opportunities at your own pace, and take the first step towards digital empowerment today!',
      'buttonText': 'Next'
    },
    {
      'image': 'assets/images/Onboarding_1.png',
      'title': 'WHATSAPP',
      'description': 'WhatsApp is a messaging app that lets you send messages, make voice and video calls, and share photos and videos with friends and family using the internet.',
      'buttonText': 'Next'
    },
    {
      'image': 'assets/images/Onboarding_2.png',
      'title': 'GOOGLE PAY',
      'description': 'Google Pay is a digital payment app that allows you to make secure online payments and send money to others using your smartphone.',
      'buttonText': 'Get Started'
    }
  ];

  void _onPageChanged(int index) {
    if (index == _pages.length - 1) {
      // Handle the last page action here
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        itemCount: _pages.length,
        itemBuilder: (context, index) {
          final page = _pages[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 50.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  page['image']!,
                  height: 300.0,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Center(child: Text('Image not found'));
                  },
                ),
                Text(
                  page['title']!,
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20.0),
                Text(
                  page['description']!,
                  textAlign: TextAlign.center,
                ),
                Spacer(),
                ElevatedButton(
                  onPressed: () {
                    if (index == _pages.length - 1) {
                      // Navigate to the next screen
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    } else {
                      _pageController.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                    }
                  },
                  child: Text(page['buttonText']!),
                ),
                SmoothPageIndicator(
                  controller: _pageController,
                  count: _pages.length,
                  effect: ExpandingDotsEffect(
                    activeDotColor: Theme.of(context).colorScheme.primary,
                    dotColor: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Text('Welcome to the Home Page!'),
      ),
    );
  }
}

