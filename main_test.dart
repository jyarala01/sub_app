
// class SignUpView extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       appBar: AppBar(title: Text('Create Account')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             TextField(decoration: InputDecoration(labelText: 'Full Name', border: OutlineInputBorder())),
//             SizedBox(height: 4.0),
//             TextField(decoration: InputDecoration(labelText: 'Date of Birth', border: OutlineInputBorder())),
//             SizedBox(height: 4.0),
//             TextField(decoration: InputDecoration(labelText: 'Email Address', border: OutlineInputBorder())),
//             SizedBox(height: 4.0),
//             TextField(
//               decoration: InputDecoration(labelText: 'Password', border: OutlineInputBorder()),
//               obscureText: true,
//             ),
//             SizedBox(height: 4.0),
//             TextField(
//               decoration: InputDecoration(labelText: 'Confirm Password', border: OutlineInputBorder()),
//               obscureText: true,
//             ),
//             SizedBox(height: 20),
//             FilledButton.icon(
//               onPressed: () => Navigator.pushNamed(context, '/more_info'),
//               label: Text('Create Account'),
//               // icons for filled buttons filledbutton.icon or .tonal (less emphasized)
//               icon: Icon(Icons.person),
//             ),
//             TextButton(
//               onPressed: () => Navigator.pushNamed(context, '/login'),
//               child: Text('Already have an account? Log in'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


// class ProfileView extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Profile')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text('Name: [name]'),
//             SizedBox(height: 50.0),
//             Text('Email Address: [email]'),
//             SizedBox(height: 50.0),
//             Text('Phone Number: [phone]'),
//             SizedBox(height: 100.0),
//             Text('Description:'),
              //  TextField(decoration: InputDecoration(labelText: '', border: OutlineInputBorder())),
              //  SizedBox(height: 30.0),
//           ],
//         ),
//       ),
//     );
//   }
// }
