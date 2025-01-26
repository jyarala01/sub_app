import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

// main flutter function
void main() {
  runApp(SubTeacherApp());
}

Map<String, WidgetBuilder> appRoutes = {
  '/': (context) => WelcomeView(),
  '/sign_up': (context) => SignUpView(),
  '''
/more_info''': (context) => MoreInfoView(),
  '/thank_you': (context) => ThankYouView(),
  '/login': (context) => LoginView(),
  '/school_list': (context) => SchoolListView(),
  '/profile': (context) => ProfileView(),
};

class WelcomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.green.shade300, Colors.green.shade700],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Welcome to QuickSub',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        blurRadius: 4.0,
                        color: Colors.black45,
                        offset: Offset(2.0, 2.0),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 40),
                Image.asset(
                  'images/QuickSub_Logo.png',
                  height: 150,
                ),
                SizedBox(height: 50),
                FilledButton(
                  onPressed: () => Navigator.pushNamed(context, '/sign_up'),
                  child: Text('Create Account'),
                ),
                SizedBox(height: 20),
                FilledButton(
                  onPressed: () => Navigator.pushNamed(context, '/login'),
                  child: Text('Existing Account'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
class SubTeacherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.green)),
      initialRoute: '/',
      routes: appRoutes,
    );
  }
}

class SignUpView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text('Create Account')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(child: Image.asset('images/QuickSub_Logo.png'), height: 200,),
            SizedBox(height: 8.0),
            TextField(decoration: InputDecoration(labelText: 'Full Name', border: OutlineInputBorder())),
            SizedBox(height: 4.0),
            TextField(decoration: InputDecoration(labelText: 'Date of Birth', border: OutlineInputBorder())),
            SizedBox(height: 4.0),
            TextField(decoration: InputDecoration(labelText: 'Email Address', border: OutlineInputBorder())),
            SizedBox(height: 4.0),
            TextField(
              decoration: InputDecoration(labelText: 'Password', border: OutlineInputBorder()),
              obscureText: true,
            ),
            SizedBox(height: 4.0),
            TextField(
              decoration: InputDecoration(labelText: 'Confirm Password', border: OutlineInputBorder()),
              obscureText: true,
            ),
            SizedBox(height: 20),
            FilledButton.icon(
              onPressed: () => Navigator.pushNamed(context, '/more_info'),
              label: Text('Create Account'),
              // icons for filled buttons filledbutton.icon or .tonal (less emphasized)
              icon: Icon(Icons.person),
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

class MoreInfoView extends StatefulWidget {
  @override
  _MoreInfoViewState createState() => _MoreInfoViewState();
}

class _MoreInfoViewState extends State<MoreInfoView> {
  String? highSchoolCertificatePath;
  String? backgroundCheckPath;
  String? driversLicensePath;

  Future<void> pickFile(String documentType) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null && result.files.single.path != null) {
      setState(() {
        if (documentType == 'HighSchoolCertificate') {
          highSchoolCertificatePath = result.files.single.path;
        } else if (documentType == 'BackgroundCheck') {
          backgroundCheckPath = result.files.single.path;
        } else if (documentType == 'DriversLicense') {
          driversLicensePath = result.files.single.path;
        }
      });
    } else {
      // Handle case where user cancels the file picker
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('No file selected')),
      );
    }
  }

  void submitDocuments() {
    if (highSchoolCertificatePath == null || backgroundCheckPath == null || driversLicensePath == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please upload all required documents.')),
      );
    } else {
      // Implement your upload logic here
      print('High School Certificate: $highSchoolCertificatePath');
      print('Background Check: $backgroundCheckPath');
      print('Driver\'s License: $driversLicensePath');

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Documents submitted successfully!')),
      );

      // Navigate to thank you page
      Navigator.pushNamed(context, '/thank_you');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text('Additional Information')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
              Text(
              'Congratulations!\n\nYou have successfully made an account with QuickSub.\nBut we still need some additional information:',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
                height: 1.5, // Adds line spacing for better readability
              ),
            ),
            SizedBox(height: 35),
            FilledButton.icon(
              onPressed: () => pickFile('HighSchoolCertificate'),
              label: Text(
            highSchoolCertificatePath == null
             ? 'Upload High School Certificate'
            : 'Uploaded: ${highSchoolCertificatePath!.split('/').last}',
            style: TextStyle(
              color: Colors.white, // Customize text color if necessary
            ),
            ),
            icon: Icon(Icons.document_scanner, color: Colors.white),
            style: FilledButton.styleFrom(
              backgroundColor: Colors.green, // Set the fill color
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20), // Rounded corners
              ),
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16), // Adjust padding
             ),
          ),
            SizedBox(height: 35),
            FilledButton.icon(
              onPressed: () => pickFile('BackgroundCheck'),
              label: Text(
                backgroundCheckPath == null
                    ? 'Upload Background Check'
                    : 'Uploaded: ${backgroundCheckPath!.split('/').last}',
                style: TextStyle(
                  color: Colors.white, // Customize text color if necessary
                ),
              ),
              icon: Icon(Icons.document_scanner, color: Colors.white),
              style: FilledButton.styleFrom(
                backgroundColor: Colors.green, // Set the fill color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20), // Rounded corners
                ),
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16), // Adjust padding
              ),
            ),
            SizedBox(height: 35),
            FilledButton.icon(
              onPressed: () => pickFile('DriversLicense'),
              label: Text(
                driversLicensePath == null
                    ? 'Upload Driver\'s License'
                    : 'Uploaded: ${driversLicensePath!.split('/').last}',
                style: TextStyle(
                  color: Colors.white, // Customize text color if necessary
                ),
              ),
              icon: Icon(Icons.document_scanner, color: Colors.white),
              style: FilledButton.styleFrom(
                backgroundColor: Colors.green, // Set the fill color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20), // Rounded corners
                ),
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16), // Adjust padding
              ),
            ),
            SizedBox(height: 80),
            FilledButton(
              onPressed: submitDocuments,
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
      appBar: AppBar(title: Text('Thank You!')),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.green.shade100, Colors.green.shade300],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.check_circle_outline,
                  color: Colors.green.shade700,
                  size: 100,
                ),
                SizedBox(height: 20),
                Text(
                  'Thank You!',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Your information has been successfully submitted.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black87,
                    height: 1.5,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'We will review the details and contact you soon regarding the creation of your account.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                    height: 1.5,
                  ),
                ),
                SizedBox(height: 30),
                TextButton(
                  onPressed: () {
                    // Add action for Contact Us button
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Contact Us button tapped')),
                    );
                  },
                  child: Text(
                    'Contact Us',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.green.shade700,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),
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
            FilledButton(
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

final schools = [
  School(title: 'Hawthorne International Academy', subtitle: '6 positions available', distance: "1.1mi"),
  School(title: 'Sherwood middle School', subtitle: '4 positions available', distance: "2.3mi"),
  School(title: 'Pembroke Pines Charter High School', subtitle: '3 positions available', distance: "4.0mi"),
  School(title: 'Cypress Bay High School', subtitle: '18 positions available', distance: "5.1mi"),
  School(title: 'Franklin Academy', subtitle: '12 positions available', distance: "5.6mi"),
  School(title: 'Sunset Elementary', subtitle: '6 positions available', distance: "6.9mi"),
  School(title: 'Kent School for the Hard of Hearing', subtitle: '4 positions available', distance: "7.1mi"),
  School(title: 'Lincoln Academy', subtitle: '3 positions available', distance: "9.6mi"),
  School(title: 'Horizon STEM Academy', subtitle: '18 positions available', distance: "10.8mi"),
  School(title: 'School of Science Elementary', subtitle: '2 positions available', distance: "11.2mi"),
  School(title: 'American Heritage High School', subtitle: '1 position available', distance: "11.7mi"),
  School(title: 'Summit Academy', subtitle: '5 position available', distance: "13.5mi")
];

class SchoolListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Schools')),
      body: ListView.builder(
        itemCount: schools.length,
        itemBuilder: (context, index) {
          final school = schools[index];
          return Card(
            child: ListTile(
              title: Text(school.title),
              subtitle: Row(
                children: [
                  Text(school.subtitle),
                  Spacer(),
                  Text(school.distance),
                ],
              ),
              trailing: Icon(Icons.chevron_right),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SchoolPage(
                      school: school,
                    ),
                  ),
                );
              },
            ),
          );
        },
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
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text('Profile')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text(
                'Name: [name]',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 50.0),
              Text(
                'Email Address: [email]',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 50.0),
              Text(
                'Phone Number: [phone]',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 50.0),
              Text(
                'Description:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 10),
              Expanded(
                child: TextField(
                  maxLines: null,
                  expands: true,
                  textAlignVertical: TextAlignVertical.top,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'Enter a brief description about yourself',
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      );
  }
}

class School {
  final String title;
  final String subtitle;
  final String distance;

  School({
    required this.title,
    required this.subtitle,
    required this.distance,
  });
}

class SchoolPage extends StatelessWidget {
  final School school;

  const SchoolPage({
    super.key,
    required this.school,
  });

  @override
  Widget build(BuildContext context) {
    // Extracting the number of positions from the subtitle
    final int numPositions = int.tryParse(
          RegExp(r'\d+').firstMatch(school.subtitle)?.group(0) ?? '0',
        ) ??
        0;

    return Scaffold(
      appBar: AppBar(title: Text(school.title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Phone Number: (555) 123-4567', style: TextStyle(fontSize: 16)),
            SizedBox(height: 8),
            Text('Address: 123 Main St, Springfield, USA',
                style: TextStyle(fontSize: 16)),
            SizedBox(height: 16),
            Text('Available Positions:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: numPositions,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      leading: Icon(Icons.assignment),
                      title: Text('Position ${index + 1}'),
                      subtitle: Text('Details for position ${index + 1}'),
                      trailing: Icon(Icons.chevron_right),
                      onTap: () {
                        // Placeholder for position-specific navigation or action
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Position ${index + 1} tapped')),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
