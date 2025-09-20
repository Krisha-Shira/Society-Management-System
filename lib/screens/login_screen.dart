// import 'package:flutter/material.dart';
// import '../utils/app_colors.dart';
// import 'forgot_password_screen.dart';
// import 'register_screen.dart';
// import 'dashboard_screen.dart';
// import '../screens/admin/dashboard/admin_dashboard_screen.dart'; // <-- import admin dashboard

// class LoginScreen extends StatefulWidget {
//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   final _usernameController = TextEditingController();
//   final _passwordController = TextEditingController();
//   bool _obscurePassword = true;
//   bool _isLoading = false;

//   // Demo credentials (in real app, this would be API call)
//   final String _demoUsername = "krisha shira";
//   final String _demoPassword = "password123";

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//             colors: [AppColors.primaryBlue, AppColors.lightBlue],
//           ),
//         ),
//         child: SafeArea(
//           child: Column(
//             children: [
//               // Custom AppBar
//               Padding(
//                 padding: EdgeInsets.all(16),
//                 child: Row(
//                   children: [
//                     IconButton(
//                       icon: Icon(Icons.arrow_back, color: AppColors.white),
//                       onPressed: () => Navigator.pop(context),
//                     ),
//                     SizedBox(width: 8),
//                     Text(
//                       'Login',
//                       style: TextStyle(
//                         color: AppColors.white,
//                         fontSize: 18,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               // MySociety Logo Section
//               Padding(
//                 padding: EdgeInsets.symmetric(vertical: 20),
//                 child: Column(
//                   children: [
//                     Container(
//                       width: 80,
//                       height: 80,
//                       decoration: BoxDecoration(
//                         color: AppColors.white,
//                         shape: BoxShape.circle,
//                       ),
//                       child: Icon(
//                         Icons.apartment,
//                         size: 40,
//                         color: AppColors.primaryBlue,
//                       ),
//                     ),
//                     SizedBox(height: 10),
//                     Text(
//                       'MySociety',
//                       style: TextStyle(
//                         color: AppColors.white,
//                         fontSize: 24,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               // Login Form
//               Expanded(
//                 child: Container(
//                   padding: EdgeInsets.all(30),
//                   decoration: BoxDecoration(
//                     color: AppColors.white,
//                     borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(30),
//                       topRight: Radius.circular(30),
//                     ),
//                   ),
//                   child: SingleChildScrollView(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         SizedBox(height: 20),
//                         // Username Field
//                         Text(
//                           'Username',
//                           style: TextStyle(
//                             fontSize: 14,
//                             fontWeight: FontWeight.w500,
//                             color: AppColors.darkGrey,
//                           ),
//                         ),
//                         SizedBox(height: 8),
//                         Container(
//                           decoration: BoxDecoration(
//                             color: Color(0xFFE3F2FD),
//                             borderRadius: BorderRadius.circular(25),
//                           ),
//                           child: TextFormField(
//                             controller: _usernameController,
//                             decoration: InputDecoration(
//                               hintText: 'username',
//                               hintStyle: TextStyle(color: AppColors.darkGrey),
//                               prefixIcon: Icon(
//                                 Icons.person,
//                                 color: AppColors.darkGrey,
//                               ),
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(25),
//                                 borderSide: BorderSide.none,
//                               ),
//                               filled: true,
//                               fillColor: Color(0xFFE3F2FD),
//                               contentPadding: EdgeInsets.symmetric(
//                                 horizontal: 20,
//                                 vertical: 16,
//                               ),
//                             ),
//                           ),
//                         ),
//                         SizedBox(height: 20),
//                         // Password Field
//                         Text(
//                           'Password',
//                           style: TextStyle(
//                             fontSize: 14,
//                             fontWeight: FontWeight.w500,
//                             color: AppColors.darkGrey,
//                           ),
//                         ),
//                         SizedBox(height: 8),
//                         Container(
//                           decoration: BoxDecoration(
//                             color: Color(0xFFE3F2FD),
//                             borderRadius: BorderRadius.circular(25),
//                           ),
//                           child: TextFormField(
//                             controller: _passwordController,
//                             obscureText: _obscurePassword,
//                             decoration: InputDecoration(
//                               hintText: '••••••••••••••••',
//                               hintStyle: TextStyle(color: AppColors.darkGrey),
//                               prefixIcon: Icon(
//                                 Icons.lock,
//                                 color: AppColors.darkGrey,
//                               ),
//                               suffixIcon: IconButton(
//                                 icon: Icon(
//                                   _obscurePassword
//                                       ? Icons.visibility_off
//                                       : Icons.visibility,
//                                   color: AppColors.darkGrey,
//                                 ),
//                                 onPressed: () {
//                                   setState(() {
//                                     _obscurePassword = !_obscurePassword;
//                                   });
//                                 },
//                               ),
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(25),
//                                 borderSide: BorderSide.none,
//                               ),
//                               filled: true,
//                               fillColor: Color(0xFFE3F2FD),
//                               contentPadding: EdgeInsets.symmetric(
//                                 horizontal: 20,
//                                 vertical: 16,
//                               ),
//                             ),
//                           ),
//                         ),
//                         SizedBox(height: 10),
//                         // Forgot Password Link
//                         Align(
//                           alignment: Alignment.centerRight,
//                           child: TextButton(
//                             onPressed: () {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => ForgotPasswordScreen(),
//                                 ),
//                               );
//                             },
//                             child: Text(
//                               'Forgot password?',
//                               style: TextStyle(
//                                 color: AppColors.lightBlue,
//                                 fontSize: 14,
//                               ),
//                             ),
//                           ),
//                         ),
//                         SizedBox(height: 30),
//                         // Login Button
//                         Container(
//                           width: double.infinity,
//                           height: 50,
//                           child: ElevatedButton(
//                             onPressed: _isLoading ? null : _handleLogin,
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: AppColors.primaryBlue,
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(25),
//                               ),
//                               elevation: 2,
//                             ),
//                             child: _isLoading
//                                 ? SizedBox(
//                                     width: 20,
//                                     height: 20,
//                                     child: CircularProgressIndicator(
//                                       color: AppColors.white,
//                                       strokeWidth: 2,
//                                     ),
//                                   )
//                                 : Text(
//                                     'Login',
//                                     style: TextStyle(
//                                       color: AppColors.white,
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                           ),
//                         ),
//                         SizedBox(height: 30),
//                         // Register Link
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Text(
//                               "Don't have an account? ",
//                               style: TextStyle(
//                                 color: AppColors.darkGrey,
//                                 fontSize: 14,
//                               ),
//                             ),
//                             GestureDetector(
//                               onTap: () {
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                     builder: (context) => RegisterScreen(),
//                                   ),
//                                 );
//                               },
//                               child: Text(
//                                 'Register',
//                                 style: TextStyle(
//                                   color: AppColors.lightBlue,
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 14,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   void _handleLogin() async {
//     if (_usernameController.text.trim().isEmpty) {
//       _showErrorSnackBar('Please enter username');
//       return;
//     }

//     if (_passwordController.text.trim().isEmpty) {
//       _showErrorSnackBar('Please enter password');
//       return;
//     }

//     setState(() {
//       _isLoading = true;
//     });

//     await Future.delayed(Duration(seconds: 2));

//     String username = _usernameController.text.trim();
//     String password = _passwordController.text.trim();

//     // ✅ Admin Login
//     if (username.toLowerCase() == "admin" && password == "admin123") {
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => AdminDashboardScreen()),
//       );
//       return;
//     }

//     // ✅ Normal User Login
//     if (_validateLogin(username, password)) {
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(
//           builder: (context) => DashboardScreen(userName: username),
//         ),
//       );
//     } else {
//       setState(() {
//         _isLoading = false;
//       });
//       _showErrorSnackBar('Invalid username or password');
//     }
//   }

//   bool _validateLogin(String username, String password) {
//     return username.toLowerCase() == _demoUsername.toLowerCase() ||
//         username.toLowerCase() == "krisha" ||
//         (password == _demoPassword || password == "123456");
//   }

//   void _showErrorSnackBar(String message) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text(message),
//         backgroundColor: Colors.red,
//         behavior: SnackBarBehavior.floating,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(10),
//         ),
//         margin: EdgeInsets.all(20),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import '../utils/app_colors.dart';
// import 'forgot_password_screen.dart';
// import 'register_screen.dart';
// import 'dashboard_screen.dart';
// import '../screens/admin/dashboard/admin_dashboard_screen.dart';

// class LoginScreen extends StatefulWidget {
//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   final _usernameController = TextEditingController();
//   final _passwordController = TextEditingController();
//   bool _obscurePassword = true;
//   bool _isLoading = false;

//   // 🔹 Static Credentials
//   final String _adminUsername = "admin";
//   final String _adminPassword = "admin123";

//   final String _userUsername = "krisha";
//   final String _userPassword = "123456";

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//             colors: [AppColors.primaryBlue, AppColors.lightBlue],
//           ),
//         ),
//         child: SafeArea(
//           child: Column(
//             children: [
//               // Custom AppBar
//               Padding(
//                 padding: EdgeInsets.all(16),
//                 child: Row(
//                   children: [
//                     IconButton(
//                       icon: Icon(Icons.arrow_back, color: AppColors.white),
//                       onPressed: () => Navigator.pop(context),
//                     ),
//                     SizedBox(width: 8),
//                     Text(
//                       'Login',
//                       style: TextStyle(
//                         color: AppColors.white,
//                         fontSize: 18,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               // Logo Section
//               Padding(
//                 padding: EdgeInsets.symmetric(vertical: 20),
//                 child: Column(
//                   children: [
//                     Container(
//                       width: 80,
//                       height: 80,
//                       decoration: BoxDecoration(
//                         color: AppColors.white,
//                         shape: BoxShape.circle,
//                       ),
//                       child: Icon(
//                         Icons.apartment,
//                         size: 40,
//                         color: AppColors.primaryBlue,
//                       ),
//                     ),
//                     SizedBox(height: 10),
//                     Text(
//                       'MySociety',
//                       style: TextStyle(
//                         color: AppColors.white,
//                         fontSize: 24,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               // Login Form
//               Expanded(
//                 child: Container(
//                   padding: EdgeInsets.all(30),
//                   decoration: BoxDecoration(
//                     color: AppColors.white,
//                     borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(30),
//                       topRight: Radius.circular(30),
//                     ),
//                   ),
//                   child: SingleChildScrollView(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         SizedBox(height: 20),
//                         // Username Field
//                         Text(
//                           'Username',
//                           style: TextStyle(
//                             fontSize: 14,
//                             fontWeight: FontWeight.w500,
//                             color: AppColors.darkGrey,
//                           ),
//                         ),
//                         SizedBox(height: 8),
//                         _buildTextField(
//                           controller: _usernameController,
//                           hint: "username",
//                           icon: Icons.person,
//                         ),
//                         SizedBox(height: 20),
//                         // Password Field
//                         Text(
//                           'Password',
//                           style: TextStyle(
//                             fontSize: 14,
//                             fontWeight: FontWeight.w500,
//                             color: AppColors.darkGrey,
//                           ),
//                         ),
//                         SizedBox(height: 8),
//                         _buildTextField(
//                           controller: _passwordController,
//                           hint: "••••••••••",
//                           icon: Icons.lock,
//                           isPassword: true,
//                         ),
//                         SizedBox(height: 10),
//                         Align(
//                           alignment: Alignment.centerRight,
//                           child: TextButton(
//                             onPressed: () {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => ForgotPasswordScreen(),
//                                 ),
//                               );
//                             },
//                             child: Text(
//                               'Forgot password?',
//                               style: TextStyle(
//                                 color: AppColors.lightBlue,
//                                 fontSize: 14,
//                               ),
//                             ),
//                           ),
//                         ),
//                         SizedBox(height: 30),
//                         // Login Button
//                         Container(
//                           width: double.infinity,
//                           height: 50,
//                           child: ElevatedButton(
//                             onPressed: _isLoading ? null : _handleLogin,
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: AppColors.primaryBlue,
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(25),
//                               ),
//                               elevation: 2,
//                             ),
//                             child: _isLoading
//                                 ? SizedBox(
//                                     width: 20,
//                                     height: 20,
//                                     child: CircularProgressIndicator(
//                                       color: AppColors.white,
//                                       strokeWidth: 2,
//                                     ),
//                                   )
//                                 : Text(
//                                     'Login',
//                                     style: TextStyle(
//                                       color: AppColors.white,
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                           ),
//                         ),
//                         SizedBox(height: 30),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Text(
//                               "Don't have an account? ",
//                               style: TextStyle(
//                                 color: AppColors.darkGrey,
//                                 fontSize: 14,
//                               ),
//                             ),
//                             GestureDetector(
//                               onTap: () {
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                     builder: (context) => RegisterScreen(),
//                                   ),
//                                 );
//                               },
//                               child: Text(
//                                 'Register',
//                                 style: TextStyle(
//                                   color: AppColors.lightBlue,
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 14,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   // ✅ Login handler
//   void _handleLogin() async {
//     if (_usernameController.text.trim().isEmpty) {
//       _showErrorSnackBar('Please enter username');
//       return;
//     }

//     if (_passwordController.text.trim().isEmpty) {
//       _showErrorSnackBar('Please enter password');
//       return;
//     }

//     setState(() {
//       _isLoading = true;
//     });

//     await Future.delayed(Duration(seconds: 1));

//     String username = _usernameController.text.trim().toLowerCase();
//     String password = _passwordController.text.trim();

//     // ✅ Admin login
//     if (username == _adminUsername && password == _adminPassword) {
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => AdminDashboardScreen()),
//       );
//       return;
//     }

//     // ✅ User login
//     if (username == _userUsername && password == _userPassword) {
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(
//           builder: (context) => DashboardScreen(userName: _userUsername),
//         ),
//       );
//       return;
//     }

//     // ❌ Invalid login
//     setState(() {
//       _isLoading = false;
//     });
//     _showErrorSnackBar('Invalid username or password');
//   }

//   Widget _buildTextField({
//     required TextEditingController controller,
//     required String hint,
//     required IconData icon,
//     bool isPassword = false,
//   }) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Color(0xFFE3F2FD),
//         borderRadius: BorderRadius.circular(25),
//       ),
//       child: TextFormField(
//         controller: controller,
//         obscureText: isPassword ? _obscurePassword : false,
//         decoration: InputDecoration(
//           hintText: hint,
//           hintStyle: TextStyle(color: AppColors.darkGrey),
//           prefixIcon: Icon(icon, color: AppColors.darkGrey),
//           suffixIcon: isPassword
//               ? IconButton(
//                   icon: Icon(
//                     _obscurePassword ? Icons.visibility_off : Icons.visibility,
//                     color: AppColors.darkGrey,
//                   ),
//                   onPressed: () {
//                     setState(() {
//                       _obscurePassword = !_obscurePassword;
//                     });
//                   },
//                 )
//               : null,
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(25),
//             borderSide: BorderSide.none,
//           ),
//           filled: true,
//           fillColor: Color(0xFFE3F2FD),
//           contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
//         ),
//       ),
//     );
//   }

//   void _showErrorSnackBar(String message) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text(message),
//         backgroundColor: Colors.red,
//         behavior: SnackBarBehavior.floating,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(10),
//         ),
//         margin: EdgeInsets.all(20),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import '../utils/app_colors.dart';
// import 'forgot_password_screen.dart';
// import 'register_screen.dart';
// import 'dashboard_screen.dart';
// import '../screens/admin/dashboard/admin_dashboard_screen.dart'; // ✅ Admin Dashboard import

// class LoginScreen extends StatefulWidget {
//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   final _usernameController = TextEditingController();
//   final _passwordController = TextEditingController();
//   bool _obscurePassword = true;
//   bool _isLoading = false;

//   // Demo user credentials
//   final String _demoUsername = "Krisha Shira";
//   final String _demoPassword = "password123";

//   // ✅ Admin credentials
//   final String _adminUsername = "admin";
//   final String _adminPassword = "admin123";

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//             colors: [AppColors.primaryBlue, AppColors.lightBlue],
//           ),
//         ),
//         child: SafeArea(
//           child: Column(
//             children: [
//               // AppBar section
//               Padding(
//                 padding: EdgeInsets.all(16),
//                 child: Row(
//                   children: [
//                     IconButton(
//                       icon: Icon(Icons.arrow_back, color: AppColors.white),
//                       onPressed: () => Navigator.pop(context),
//                     ),
//                     SizedBox(width: 8),
//                     Text(
//                       'Login',
//                       style: TextStyle(
//                         color: AppColors.white,
//                         fontSize: 18,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               // Logo section
//               Padding(
//                 padding: EdgeInsets.symmetric(vertical: 20),
//                 child: Column(
//                   children: [
//                     Container(
//                       width: 80,
//                       height: 80,
//                       decoration: BoxDecoration(
//                         color: AppColors.white,
//                         shape: BoxShape.circle,
//                       ),
//                       child: Icon(
//                         Icons.apartment,
//                         size: 40,
//                         color: AppColors.primaryBlue,
//                       ),
//                     ),
//                     SizedBox(height: 10),
//                     Text(
//                       'MySociety',
//                       style: TextStyle(
//                         color: AppColors.white,
//                         fontSize: 24,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               // Login Form
//               Expanded(
//                 child: Container(
//                   padding: EdgeInsets.all(30),
//                   decoration: BoxDecoration(
//                     color: AppColors.white,
//                     borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(30),
//                       topRight: Radius.circular(30),
//                     ),
//                   ),
//                   child: SingleChildScrollView(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         SizedBox(height: 20),
//                         Text(
//                           'Username',
//                           style: TextStyle(
//                             fontSize: 14,
//                             fontWeight: FontWeight.w500,
//                             color: AppColors.darkGrey,
//                           ),
//                         ),
//                         SizedBox(height: 8),
//                         Container(
//                           decoration: BoxDecoration(
//                             color: Color(0xFFE3F2FD),
//                             borderRadius: BorderRadius.circular(25),
//                           ),
//                           child: TextFormField(
//                             controller: _usernameController,
//                             decoration: InputDecoration(
//                               hintText: 'Enter username',
//                               hintStyle: TextStyle(color: AppColors.darkGrey),
//                               prefixIcon:
//                                   Icon(Icons.person, color: AppColors.darkGrey),
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(25),
//                                 borderSide: BorderSide.none,
//                               ),
//                               filled: true,
//                               fillColor: Color(0xFFE3F2FD),
//                               contentPadding: EdgeInsets.symmetric(
//                                 horizontal: 20,
//                                 vertical: 16,
//                               ),
//                             ),
//                           ),
//                         ),
//                         SizedBox(height: 20),
//                         Text(
//                           'Password',
//                           style: TextStyle(
//                             fontSize: 14,
//                             fontWeight: FontWeight.w500,
//                             color: AppColors.darkGrey,
//                           ),
//                         ),
//                         SizedBox(height: 8),
//                         Container(
//                           decoration: BoxDecoration(
//                             color: Color(0xFFE3F2FD),
//                             borderRadius: BorderRadius.circular(25),
//                           ),
//                           child: TextFormField(
//                             controller: _passwordController,
//                             obscureText: _obscurePassword,
//                             decoration: InputDecoration(
//                               hintText: '••••••••',
//                               hintStyle: TextStyle(color: AppColors.darkGrey),
//                               prefixIcon:
//                                   Icon(Icons.lock, color: AppColors.darkGrey),
//                               suffixIcon: IconButton(
//                                 icon: Icon(
//                                   _obscurePassword
//                                       ? Icons.visibility_off
//                                       : Icons.visibility,
//                                   color: AppColors.darkGrey,
//                                 ),
//                                 onPressed: () {
//                                   setState(() {
//                                     _obscurePassword = !_obscurePassword;
//                                   });
//                                 },
//                               ),
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(25),
//                                 borderSide: BorderSide.none,
//                               ),
//                               filled: true,
//                               fillColor: Color(0xFFE3F2FD),
//                               contentPadding: EdgeInsets.symmetric(
//                                 horizontal: 20,
//                                 vertical: 16,
//                               ),
//                             ),
//                           ),
//                         ),
//                         SizedBox(height: 10),
//                         Align(
//                           alignment: Alignment.centerRight,
//                           child: TextButton(
//                             onPressed: () {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => ForgotPasswordScreen(),
//                                 ),
//                               );
//                             },
//                             child: Text(
//                               'Forgot password?',
//                               style: TextStyle(
//                                 color: AppColors.lightBlue,
//                                 fontSize: 14,
//                               ),
//                             ),
//                           ),
//                         ),
//                         SizedBox(height: 30),
//                         // Login Button
//                         SizedBox(
//                           width: double.infinity,
//                           height: 50,
//                           child: ElevatedButton(
//                             onPressed: _isLoading ? null : _handleLogin,
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: AppColors.primaryBlue,
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(25),
//                               ),
//                               elevation: 2,
//                             ),
//                             child: _isLoading
//                                 ? SizedBox(
//                                     width: 20,
//                                     height: 20,
//                                     child: CircularProgressIndicator(
//                                       color: AppColors.white,
//                                       strokeWidth: 2,
//                                     ),
//                                   )
//                                 : Text(
//                                     'Login',
//                                     style: TextStyle(
//                                       color: AppColors.white,
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                           ),
//                         ),
//                         SizedBox(height: 30),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Text(
//                               "Don't have an account? ",
//                               style: TextStyle(
//                                 color: AppColors.darkGrey,
//                                 fontSize: 14,
//                               ),
//                             ),
//                             GestureDetector(
//                               onTap: () {
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                     builder: (context) => RegisterScreen(),
//                                   ),
//                                 );
//                               },
//                               child: Text(
//                                 'Register',
//                                 style: TextStyle(
//                                   color: AppColors.lightBlue,
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 14,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   // ✅ Updated to check admin login first
//   void _handleLogin() async {
//     if (_usernameController.text.trim().isEmpty) {
//       _showErrorSnackBar('Please enter username');
//       return;
//     }

//     if (_passwordController.text.trim().isEmpty) {
//       _showErrorSnackBar('Please enter password');
//       return;
//     }

//     setState(() => _isLoading = true);
//     await Future.delayed(Duration(seconds: 2));

//     final username = _usernameController.text.trim();
//     final password = _passwordController.text.trim();

//     // ✅ Admin check
//     if (username == _adminUsername && password == _adminPassword) {
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(
//           builder: (context) => AdminDashboardScreen(),
//         ),
//       );
//       return;
//     }

//     // Normal user login
//     if (_validateLogin(username, password)) {
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(
//           builder: (context) => DashboardScreen(userName: username),
//         ),
//       );
//     } else {
//       setState(() => _isLoading = false);
//       _showErrorSnackBar('Invalid username or password');
//     }
//   }

//   bool _validateLogin(String username, String password) {
//     return username.toLowerCase() == _demoUsername.toLowerCase() ||
//         username.toLowerCase() == "krisha" ||
//         (password == _demoPassword || password == "123456");
//   }

//   void _showErrorSnackBar(String message) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text(message),
//         backgroundColor: Colors.red,
//         behavior: SnackBarBehavior.floating,
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//         margin: EdgeInsets.all(20),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _usernameController.dispose();
//     _passwordController.dispose();
//     super.dispose();
//   }
// }
import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import 'forgot_password_screen.dart';
import 'register_screen.dart';
import 'dashboard_screen.dart';
import '../screens/admin/dashboard/admin_dashboard_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [AppColors.primaryBlue, AppColors.lightBlue],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // AppBar section
              Padding(
                padding: EdgeInsets.all(16),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back, color: AppColors.white),
                      onPressed: () => Navigator.pop(context),
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Login',
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              // Logo section
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.apartment,
                        size: 40,
                        color: AppColors.primaryBlue,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'MySociety',
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              // Login Form
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20),
                        Text(
                          'Username',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColors.darkGrey,
                          ),
                        ),
                        SizedBox(height: 8),
                        Container(
                          decoration: BoxDecoration(
                            color: Color(0xFFE3F2FD),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: TextFormField(
                            controller: _usernameController,
                            decoration: InputDecoration(
                              hintText: 'Enter username',
                              hintStyle: TextStyle(color: AppColors.darkGrey),
                              prefixIcon:
                                  Icon(Icons.person, color: AppColors.darkGrey),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                              fillColor: Color(0xFFE3F2FD),
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 16,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Password',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColors.darkGrey,
                          ),
                        ),
                        SizedBox(height: 8),
                        Container(
                          decoration: BoxDecoration(
                            color: Color(0xFFE3F2FD),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: TextFormField(
                            controller: _passwordController,
                            obscureText: _obscurePassword,
                            decoration: InputDecoration(
                              hintText: '••••••••',
                              hintStyle: TextStyle(color: AppColors.darkGrey),
                              prefixIcon:
                                  Icon(Icons.lock, color: AppColors.darkGrey),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _obscurePassword
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: AppColors.darkGrey,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _obscurePassword = !_obscurePassword;
                                  });
                                },
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                              fillColor: Color(0xFFE3F2FD),
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 16,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ForgotPasswordScreen(),
                                ),
                              );
                            },
                            child: Text(
                              'Forgot password?',
                              style: TextStyle(
                                color: AppColors.lightBlue,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 30),
                        // Login Button
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: _isLoading ? null : _handleLogin,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primaryBlue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                              elevation: 2,
                            ),
                            child: _isLoading
                                ? SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: CircularProgressIndicator(
                                      color: AppColors.white,
                                      strokeWidth: 2,
                                    ),
                                  )
                                : Text(
                                    'Login',
                                    style: TextStyle(
                                      color: AppColors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                          ),
                        ),
                        SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have an account? ",
                              style: TextStyle(
                                color: AppColors.darkGrey,
                                fontSize: 14,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => RegisterScreen(),
                                  ),
                                );
                              },
                              child: Text(
                                'Register',
                                style: TextStyle(
                                  color: AppColors.lightBlue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Simple login handler with static values
  void _handleLogin() async {
    // Check if fields are empty
    if (_usernameController.text.trim().isEmpty) {
      _showErrorMessage('Please enter username');
      return;
    }

    if (_passwordController.text.trim().isEmpty) {
      _showErrorMessage('Please enter password');
      return;
    }

    setState(() {
      _isLoading = true;
    });

    // Simulate loading delay
    await Future.delayed(Duration(seconds: 1));

    String username = _usernameController.text.trim();
    String password = _passwordController.text.trim();

    // Static Admin Check
    if (username == "admin" && password == "admin") {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => AdminDashboardScreen(userName: '',),
        ),
      );
      return;
    }

    // Static User Check
    if (username == "user" && password == "user") {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => DashboardScreen(userName: "User"),
        ),
      );
      return;
    }

    // If credentials don't match
    setState(() {
      _isLoading = false;
    });
    _showErrorMessage('Invalid credentials. Use admin/admin or user/user');
  }

  void _showErrorMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.all(20),
      ),
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
