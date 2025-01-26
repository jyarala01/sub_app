import 'package:flutter/material.dart';

void main() {
  runApp(SubTeacherApp());
}

Map<String, WidgetBuilder> appRoutes = {
  '/': (context) =>SignUpView(),
  '''
/more_info''': (context) => MoreInfoView(),
  '/thank_you': (context) => ThankYouView(),
  '/login': (context) => LoginView(),
  '/school_list': (context) => SchoolListView(),
  '/profile': (context) => ProfileView(),
};


class SubTeacherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      initialRoute: '/',
      routes: appRoutes,
    );
  }
}

class SignUpView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Create Account')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(decoration: InputDecoration(labelText: 'Full Name!')),
            TextField(decoration: InputDecoration(labelText: 'Date of Birth')),
            TextField(decoration: InputDecoration(labelText: 'Email Address')),
            TextField(
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Confirm Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/more_info'),
              child: Text('Create Account'),
            ),
            TextButton(
              onPressed: () => Navigator.pushNamed(context, '/login'),
              child: Text('Already have an account? Log in'),
            ),
          ],
        ),
      ),
    );
  }
}

class MoreInfoView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Additional Information')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Congratulations!\n\nYou have successfully made an account with Ember.\nBut we still need some additional information:',
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: () {}, child: Text('Upload Highschool Certificate')),
            ElevatedButton(onPressed: () {}, child: Text('Upload Background Check')),
            ElevatedButton(onPressed: () {}, child: Text('Upload Drivers License')),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/thank_you'),
              child: Text('Submit Documents'),
            ),
          ],
        ),
      ),
    );
  }
}

class ThankYouView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Thank You')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Thank you!\n\nYour files have been submitted successfully.\nWe will review the documents and email you shortly.',
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {},
              child: Text('Contact Us'),
            ),
          ],
        ),
      ),
    );
  }
}

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Log In')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(decoration: InputDecoration(labelText: 'Email Address')),
            TextField(
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/school_list'),
              child: Text('Log In'),
            ),
            TextButton(
              onPressed: () {},
              child: Text('Forgot Password?'),
            ),
            TextButton(
              onPressed: () => Navigator.pushNamed(context, '/'),
              child: Text('Create Account'),
            ),
          ],
        ),
      ),
    );
  }
}

class SchoolListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Schools')),
      body: ListView(
        children: [
          ListTile(title: Text('Hawthorne International Academy'), subtitle: Text('7 positions available')),
          ListTile(title: Text('Sherwood High School'), subtitle: Text('4 positions available')),
          ListTile(title: Text('Pembroke Pines Charter High School'), subtitle: Text('3 positions available')),
          ListTile(title: Text('Cypress Bay High School'), subtitle: Text('18 positions available')),
          ListTile(title: Text('Franklin Academy'), subtitle: Text('12 positions available')),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Schools'),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
            tooltip: 'Go to profile',
          ),
        ],
        onTap: (index) {
          if (index == 1) {
            Navigator.pushNamed(context, '/profile');
          }
        },
      ),
    );
  }
}

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: [name]'),
            Text('Email Address: [email]'),
            Text('Phone Number: [phone]'),
          ],
        ),
      ),
    );
  }
}

