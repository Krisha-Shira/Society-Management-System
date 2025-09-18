// import 'package:flutter/material.dart';
// import '../utils/app_colors.dart';
// import '../services/auth_service.dart';

// class LoginScreen extends StatefulWidget {
//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   final TextEditingController _usernameController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   bool _isLoading = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: EdgeInsets.symmetric(horizontal: 24.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 SizedBox(height: 80),

//                 // Logo
//                 Container(
//                   width: 80,
//                   height: 80,
//                   decoration: BoxDecoration(
//                     color: AppColors.primaryBlue,
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   child: Icon(
//                     Icons.location_city,
//                     size: 40,
//                     color: Colors.white,
//                   ),
//                 ),

//                 SizedBox(height: 40),

//                 // Title
//                 Text(
//                   'MySociety',
//                   style: TextStyle(
//                     fontSize: 28,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.grey[800],
//                   ),
//                 ),

//                 SizedBox(height: 8),

//                 Text(
//                   'Welcome back! Please sign in to continue.',
//                   style: TextStyle(
//                     fontSize: 16,
//                     color: Colors.grey[600],
//                   ),
//                   textAlign: TextAlign.center,
//                 ),

//                 SizedBox(height: 50),

//                 // Username Field
//                 _buildTextField(
//                   controller: _usernameController,
//                   hint: 'Username or Email',
//                   icon: Icons.person,
//                 ),

//                 SizedBox(height: 20),

//                 // Password Field
//                 _buildTextField(
//                   controller: _passwordController,
//                   hint: 'Password',
//                   icon: Icons.lock,
//                   obscure: true,
//                 ),

//                 SizedBox(height: 16),

//                 // Forgot Password
//                 Align(
//                   alignment: Alignment.centerRight,
//                   child: GestureDetector(
//                     onTap: () {
//                       Navigator.pushNamed(context, '/forgot-password');
//                     },
//                     child: Text(
//                       'Forgot Password?',
//                       style: TextStyle(
//                         color: AppColors.primaryBlue,
//                         fontSize: 14,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                   ),
//                 ),

//                 SizedBox(height: 30),

//                 // Login Button
//                 Container(
//                   width: double.infinity,
//                   child: ElevatedButton(
//                     onPressed: _isLoading ? null : _handleLogin,
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: AppColors.primaryBlue,
//                       padding: EdgeInsets.symmetric(vertical: 16),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       elevation: 2,
//                     ),
//                     child: _isLoading
//                         ? SizedBox(
//                             height: 20,
//                             width: 20,
//                             child: CircularProgressIndicator(
//                               color: Colors.white,
//                               strokeWidth: 2,
//                             ),
//                           )
//                         : Text(
//                             'Login',
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 16,
//                               fontWeight: FontWeight.w600,
//                             ),
//                           ),
//                   ),
//                 ),

//                 SizedBox(height: 30),

//                 // Register Link
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       "Don't have an account? ",
//                       style: TextStyle(
//                         color: Colors.grey[600],
//                         fontSize: 14,
//                       ),
//                     ),
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.pushNamed(context, '/register');
//                       },
//                       child: Text(
//                         'Register',
//                         style: TextStyle(
//                           color: AppColors.primaryBlue,
//                           fontSize: 14,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),

//                 SizedBox(height: 30),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   // ✅ Reusable TextField widget
//   Widget _buildTextField({
//     required TextEditingController controller,
//     required String hint,
//     required IconData icon,
//     bool obscure = false,
//   }) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.grey[50],
//         borderRadius: BorderRadius.circular(12),
//         border: Border.all(color: Colors.grey[300]!),
//       ),
//       child: TextField(
//         controller: controller,
//         obscureText: obscure,
//         keyboardType: obscure ? TextInputType.text : TextInputType.emailAddress,
//         decoration: InputDecoration(
//           hintText: hint,
//           prefixIcon: Icon(icon, color: Colors.grey[600]),
//           border: InputBorder.none,
//           contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
//           hintStyle: TextStyle(color: Colors.grey[500]),
//         ),
//       ),
//     );
//   }

//   // ✅ Handle manual login
//   Future<void> _handleLogin() async {
//     String username = _usernameController.text.trim();
//     String password = _passwordController.text.trim();

//     if (username.isEmpty || password.isEmpty) {
//       _showMessage('Please fill in all fields');
//       return;
//     }

//     setState(() => _isLoading = true);

//     final result =
//         await AuthService.login(username, password); // result may not be bool

//     setState(() => _isLoading = false);

//     if (result == true) {
//       _showMessage('Login successful!', isSuccess: true);

//       // ✅ Navigate to dashboard
//       Navigator.pushReplacementNamed(context, '/dashboard');
//     } else {
//       _showMessage('Invalid username or password');
//     }
//   }

//   // ✅ Snackbar message
//   void _showMessage(String message, {bool isSuccess = false}) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text(message),
//         backgroundColor: isSuccess ? Colors.green : Colors.red,
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
// import 'package:flutter/material.dart';
// import '../utils/app_colors.dart';
// import '../services/auth_service.dart';
// import 'dashboard_screen.dart'; // Make sure this exists

// class LoginScreen extends StatefulWidget {
//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   bool _isLoading = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: EdgeInsets.symmetric(horizontal: 24.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 SizedBox(height: 80),

//                 // Logo
//                 Container(
//                   width: 80,
//                   height: 80,
//                   decoration: BoxDecoration(
//                     color: AppColors.primaryBlue,
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   child: Icon(
//                     Icons.location_city,
//                     size: 40,
//                     color: Colors.white,
//                   ),
//                 ),

//                 SizedBox(height: 40),

//                 // Title
//                 Text(
//                   'MySociety',
//                   style: TextStyle(
//                     fontSize: 28,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.grey[800],
//                   ),
//                 ),

//                 SizedBox(height: 8),

//                 Text(
//                   'Welcome back! Please sign in to continue.',
//                   style: TextStyle(
//                     fontSize: 16,
//                     color: Colors.grey[600],
//                   ),
//                   textAlign: TextAlign.center,
//                 ),

//                 SizedBox(height: 50),

//                 // Email Field
//                 _buildTextField(
//                   controller: _emailController,
//                   hint: 'Email',
//                   icon: Icons.email,
//                 ),

//                 SizedBox(height: 20),

//                 // Password Field
//                 _buildTextField(
//                   controller: _passwordController,
//                   hint: 'Password',
//                   icon: Icons.lock,
//                   obscure: true,
//                 ),

//                 SizedBox(height: 16),

//                 // Forgot Password
//                 Align(
//                   alignment: Alignment.centerRight,
//                   child: GestureDetector(
//                     onTap: () {
//                       Navigator.pushNamed(context, '/forgot-password');
//                     },
//                     child: Text(
//                       'Forgot Password?',
//                       style: TextStyle(
//                         color: AppColors.primaryBlue,
//                         fontSize: 14,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                   ),
//                 ),

//                 SizedBox(height: 30),

//                 // Login Button
//                 Container(
//                   width: double.infinity,
//                   child: ElevatedButton(
//                     onPressed: _isLoading ? null : _handleLogin,
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: AppColors.primaryBlue,
//                       padding: EdgeInsets.symmetric(vertical: 16),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       elevation: 2,
//                     ),
//                     child: _isLoading
//                         ? SizedBox(
//                             height: 20,
//                             width: 20,
//                             child: CircularProgressIndicator(
//                               color: Colors.white,
//                               strokeWidth: 2,
//                             ),
//                           )
//                         : Text(
//                             'Login',
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 16,
//                               fontWeight: FontWeight.w600,
//                             ),
//                           ),
//                   ),
//                 ),

//                 SizedBox(height: 30),

//                 // Register Link
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       "Don't have an account? ",
//                       style: TextStyle(
//                         color: Colors.grey[600],
//                         fontSize: 14,
//                       ),
//                     ),
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.pushNamed(context, '/register');
//                       },
//                       child: Text(
//                         'Register',
//                         style: TextStyle(
//                           color: AppColors.primaryBlue,
//                           fontSize: 14,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),

//                 SizedBox(height: 30),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   // TextField builder
//   Widget _buildTextField({
//     required TextEditingController controller,
//     required String hint,
//     required IconData icon,
//     bool obscure = false,
//   }) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.grey[50],
//         borderRadius: BorderRadius.circular(12),
//         border: Border.all(color: Colors.grey[300]!),
//       ),
//       child: TextField(
//         controller: controller,
//         obscureText: obscure,
//         keyboardType: obscure ? TextInputType.text : TextInputType.emailAddress,
//         decoration: InputDecoration(
//           hintText: hint,
//           prefixIcon: Icon(icon, color: Colors.grey[600]),
//           border: InputBorder.none,
//           contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
//           hintStyle: TextStyle(color: Colors.grey[500]),
//         ),
//       ),
//     );
//   }

//   // Handle login using AuthService
//   Future<void> _handleLogin() async {
//     String email = _emailController.text.trim();
//     String password = _passwordController.text.trim();

//     if (email.isEmpty || password.isEmpty) {
//       _showMessage('Please fill in all fields');
//       return;
//     }

//     setState(() => _isLoading = true);

//     final result = await AuthService.login(email, password);

//     setState(() => _isLoading = false);

//     if (result.isSuccess) {
//       _showMessage(result.message, isSuccess: true);

//       // Navigate to Dashboard
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (_) => DashboardScreen()),
//       );
//     } else {
//       _showMessage(result.message);
//     }
//   }

//   // Snackbar
//   void _showMessage(String message, {bool isSuccess = false}) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text(message),
//         backgroundColor: isSuccess ? Colors.green : Colors.red,
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _emailController.dispose();
//     _passwordController.dispose();
//     super.dispose();
//   }
// }

// import 'package:flutter/material.dart';
// import '../utils/app_colors.dart';
// import '../services/auth_service.dart';
// import 'dashboard_screen.dart'; // Make sure this file exists

// class LoginScreen extends StatefulWidget {
//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   final TextEditingController _emailController =
//       TextEditingController(); // Changed from _usernameController
//   final TextEditingController _passwordController = TextEditingController();
//   bool _isLoading = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: EdgeInsets.symmetric(horizontal: 24.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 SizedBox(height: 80),

//                 // Logo
//                 Container(
//                   width: 80,
//                   height: 80,
//                   decoration: BoxDecoration(
//                     color: AppColors.primaryBlue,
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   child: Icon(
//                     Icons.location_city,
//                     size: 40,
//                     color: Colors.white,
//                   ),
//                 ),

//                 SizedBox(height: 40),

//                 // Title
//                 Text(
//                   'MySociety',
//                   style: TextStyle(
//                     fontSize: 28,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.grey[800],
//                   ),
//                 ),

//                 SizedBox(height: 8),

//                 Text(
//                   'Welcome back! Please sign in to continue.',
//                   style: TextStyle(
//                     fontSize: 16,
//                     color: Colors.grey[600],
//                   ),
//                   textAlign: TextAlign.center,
//                 ),

//                 SizedBox(height: 50),

//                 // Email Field
//                 _buildTextField(
//                   controller: _emailController,
//                   hint: 'Email',
//                   icon: Icons.email,
//                 ),

//                 SizedBox(height: 20),

//                 // Password Field
//                 _buildTextField(
//                   controller: _passwordController,
//                   hint: 'Password',
//                   icon: Icons.lock,
//                   obscure: true,
//                 ),

//                 SizedBox(height: 16),

//                 // Forgot Password
//                 Align(
//                   alignment: Alignment.centerRight,
//                   child: GestureDetector(
//                     onTap: () {
//                       Navigator.pushNamed(context, '/forgot-password');
//                     },
//                     child: Text(
//                       'Forgot Password?',
//                       style: TextStyle(
//                         color: AppColors.primaryBlue,
//                         fontSize: 14,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                   ),
//                 ),

//                 SizedBox(height: 30),

//                 // Login Button
//                 Container(
//                   width: double.infinity,
//                   child: ElevatedButton(
//                     onPressed: _isLoading ? null : _handleLogin,
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: AppColors.primaryBlue,
//                       padding: EdgeInsets.symmetric(vertical: 16),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       elevation: 2,
//                     ),
//                     child: _isLoading
//                         ? SizedBox(
//                             height: 20,
//                             width: 20,
//                             child: CircularProgressIndicator(
//                               color: Colors.white,
//                               strokeWidth: 2,
//                             ),
//                           )
//                         : Text(
//                             'Login',
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 16,
//                               fontWeight: FontWeight.w600,
//                             ),
//                           ),
//                   ),
//                 ),

//                 SizedBox(height: 30),

//                 // Register Link
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       "Don't have an account? ",
//                       style: TextStyle(
//                         color: Colors.grey[600],
//                         fontSize: 14,
//                       ),
//                     ),
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.pushNamed(context, '/register');
//                       },
//                       child: Text(
//                         'Register',
//                         style: TextStyle(
//                           color: AppColors.primaryBlue,
//                           fontSize: 14,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),

//                 SizedBox(height: 30),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   // TextField builder
//   Widget _buildTextField({
//     required TextEditingController controller,
//     required String hint,
//     required IconData icon,
//     bool obscure = false,
//   }) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.grey[50],
//         borderRadius: BorderRadius.circular(12),
//         border: Border.all(color: Colors.grey[300]!),
//       ),
//       child: TextField(
//         controller: controller,
//         obscureText: obscure,
//         keyboardType: obscure ? TextInputType.text : TextInputType.emailAddress,
//         decoration: InputDecoration(
//           hintText: hint,
//           prefixIcon: Icon(icon, color: Colors.grey[600]),
//           border: InputBorder.none,
//           contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
//           hintStyle: TextStyle(color: Colors.grey[500]),
//         ),
//       ),
//     );
//   }

//   // Handle login using AuthService
//   Future<void> _handleLogin() async {
//     String email = _emailController.text.trim();
//     String password = _passwordController.text.trim();

//     if (email.isEmpty || password.isEmpty) {
//       _showMessage('Please fill in all fields');
//       return;
//     }

//     setState(() => _isLoading = true);

//     final result = await AuthService.login(email, password);

//     setState(() => _isLoading = false);

//     if (result.isSuccess) {
//       _showMessage(result.message, isSuccess: true);

//       // ✅ Navigate to DashboardScreen
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (_) => DashboardScreen()),
//       );
//     } else {
//       _showMessage(result.message);
//     }
//   }

//   // Snackbar
//   void _showMessage(String message, {bool isSuccess = false}) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text(message),
//         backgroundColor: isSuccess ? Colors.green : Colors.red,
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _emailController.dispose();
//     _passwordController.dispose();
//     super.dispose();
//   }
// }
import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import 'forgot_password_screen.dart';
import 'register_screen.dart';
import 'dashboard_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;
  bool _isLoading = false;

  // Demo credentials (in real app, this would be API call)
  final String _demoUsername = "Krisha Shira";
  final String _demoPassword = "password123";

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
              // Custom AppBar
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
              // MySociety Logo Section
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
                        // Username Field
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
                              hintText: 'Krisha Shira',
                              hintStyle: TextStyle(color: AppColors.darkGrey),
                              prefixIcon: Icon(
                                Icons.person,
                                color: AppColors.darkGrey,
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
                        SizedBox(height: 20),
                        // Password Field
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
                              hintText: '••••••••••••••••',
                              hintStyle: TextStyle(color: AppColors.darkGrey),
                              prefixIcon: Icon(
                                Icons.lock,
                                color: AppColors.darkGrey,
                              ),
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
                        // Forgot Password Link
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
                        Container(
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
                        // Register Link
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

  void _handleLogin() async {
    // Basic validation
    if (_usernameController.text.trim().isEmpty) {
      _showErrorSnackBar('Please enter username');
      return;
    }

    if (_passwordController.text.trim().isEmpty) {
      _showErrorSnackBar('Please enter password');
      return;
    }

    setState(() {
      _isLoading = true;
    });

    // Simulate API call delay
    await Future.delayed(Duration(seconds: 2));

    // Demo login validation (replace with actual API call)
    if (_validateLogin(_usernameController.text.trim(), _passwordController.text.trim())) {
      // Login successful - navigate to dashboard
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => DashboardScreen(
            userName: _usernameController.text.trim(),
          ),
        ),
      );
    } else {
      // Login failed
      setState(() {
        _isLoading = false;
      });
      _showErrorSnackBar('Invalid username or password');
    }
  }

  bool _validateLogin(String username, String password) {
    // Demo validation - replace with actual authentication logic
    return username.toLowerCase() == _demoUsername.toLowerCase() || 
           username.toLowerCase() == "krisha" ||
           (password == _demoPassword || password == "123456");
  }

  void _showErrorSnackBar(String message) {
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

  void _showSuccessSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.green,
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