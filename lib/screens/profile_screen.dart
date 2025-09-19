// import 'package:flutter/material.dart';
// import '../widgets/app_colors.dart';
// import '../widgets/custom_text_field.dart';
// import '../widgets/custom_button.dart';

// class ProfileScreen extends StatefulWidget {
//   @override
//   _ProfileScreenState createState() => _ProfileScreenState();
// }

// class _ProfileScreenState extends State<ProfileScreen> {
//   final _usernameController = TextEditingController(text: 'krisha shira');
//   final _emailController = TextEditingController(text: 'abc123@gmail.com');
//   final _buildingController = TextEditingController(text: 'B-402');

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
//               // ✅ AppBar
//               AppBar(
//                 backgroundColor: Colors.transparent,
//                 elevation: 0,
//                 leading: IconButton(
//                   icon: Icon(Icons.arrow_back, color: AppColors.white),
//                   onPressed: () => Navigator.pop(context),
//                 ),
//                 title: Text(
//                   'Profile', // changed from 'john'
//                   style: TextStyle(color: AppColors.white),
//                 ),
//               ),

//               // ✅ Profile Form
//               Expanded(
//                 child: Container(
//                   margin: EdgeInsets.only(top: 20),
//                   padding: EdgeInsets.all(24),
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
//                         // Username
//                         Text(
//                           'Username',
//                           style: TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.w500,
//                             color: AppColors.darkGrey,
//                           ),
//                         ),
//                         CustomTextField(
//                           hintText: 'Username',
//                           prefixIcon: Icons.person,
//                           controller: _usernameController,
//                         ),
//                         SizedBox(height: 20),

//                         // Email
//                         Text(
//                           'Email',
//                           style: TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.w500,
//                             color: AppColors.darkGrey,
//                           ),
//                         ),
//                         CustomTextField(
//                           hintText: 'Email',
//                           prefixIcon: Icons.email,
//                           controller: _emailController,
//                         ),
//                         SizedBox(height: 20),

//                         // Building / Flat No.
//                         Text(
//                           'Building / Flat No.',
//                           style: TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.w500,
//                             color: AppColors.darkGrey,
//                           ),
//                         ),
//                         CustomTextField(
//                           hintText: 'Flat No.',
//                           prefixIcon: Icons.home,
//                           controller: _buildingController,
//                         ),
//                         SizedBox(height: 30),

//                         // Save button
//                         CustomButton(
//                           text: "Save Changes",
//                           onPressed: () {
//                             ScaffoldMessenger.of(context).showSnackBar(
//                               SnackBar(
//                                 content: Text("Profile updated successfully!"),
//                               ),
//                             );
//                           },
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
// }
// screens/profile_screen.dart (Updated User Profile)
// import 'package:flutter/material.dart';
// import '../widgets/app_colors.dart';
// import '../utils/auth_service.dart';
// import '../models/user_model.dart';

// class ProfileScreen extends StatefulWidget {
//   @override
//   _ProfileScreenState createState() => _ProfileScreenState();
// }

// class _ProfileScreenState extends State<ProfileScreen> {
//   late TextEditingController _usernameController;
//   late TextEditingController _emailController;
//   late TextEditingController _buildingController;
//   late TextEditingController _mobileController;

//   @override
//   void initState() {
//     super.initState();
//     final user = AuthService.currentUser!;
//     _usernameController = TextEditingController(text: user.username);
//     _emailController = TextEditingController(text: user.email);
//     _buildingController = TextEditingController(text: user.buildingNumber);
//     _mobileController = TextEditingController(text: user.mobileNumber);
//   }

//   @override
//   Widget build(BuildContext context) {
//     final user = AuthService.currentUser!;

//     return Scaffold(
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: AppColors.primaryGradient,
//         ),
//         child: SafeArea(
//           child: Column(
//             children: [
//               // Custom App Bar
//               Padding(
//                 padding: EdgeInsets.all(16.0),
//                 child: Row(
//                   children: [
//                     GestureDetector(
//                       onTap: () => Navigator.pop(context),
//                       child: Container(
//                         padding: EdgeInsets.all(8),
//                         child: Icon(
//                           Icons.arrow_back_ios,
//                           color: Colors.white,
//                           size: 20,
//                         ),
//                       ),
//                     ),
//                     Expanded(
//                       child: Text(
//                         'My Profile',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 18,
//                           fontWeight: FontWeight.w600,
//                         ),
//                         textAlign: TextAlign.center,
//                       ),
//                     ),
//                     SizedBox(width: 36), // Balance the back button
//                   ],
//                 ),
//               ),

//               // Profile Content
//               Expanded(
//                 child: Container(
//                   margin: EdgeInsets.only(top: 20),
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(30),
//                       topRight: Radius.circular(30),
//                     ),
//                   ),
//                   child: Padding(
//                     padding: EdgeInsets.all(24.0),
//                     child: Column(
//                       children: [
//                         // Profile Picture
//                         Container(
//                           width: 100,
//                           height: 100,
//                           decoration: BoxDecoration(
//                             shape: BoxShape.circle,
//                             gradient: AppColors.primaryGradient,
//                           ),
//                           child: Center(
//                             child: Text(
//                               user.initials,
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 32,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ),
//                         ),

//                         SizedBox(height: 8),

//                         // User Badge
//                         Container(
//                           padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
//                           decoration: BoxDecoration(
//                             color: Colors.blue,
//                             borderRadius: BorderRadius.circular(12),
//                           ),
//                           child: Text(
//                             'RESIDENT',
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 12,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),

//                         SizedBox(height: 32),

//                         // Form Fields
//                         Expanded(
//                           child: SingleChildScrollView(
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 // Username Field
//                                 _buildInputField('Full Name', _usernameController),
//                                 SizedBox(height: 16),

//                                 // Email Field
//                                 _buildInputField('Email Address', _emailController),
//                                 SizedBox(height: 16),

//                                 // Building Number Field
//                                 _buildInputField('Building Number', _buildingController),
//                                 SizedBox(height: 16),

//                                 // Mobile Number Field
//                                 _buildInputField('Mobile Number', _mobileController, hintText: 'Enter your mobile number'),

//                                 SizedBox(height: 32),

//                                 // User Information Section
//                                 Container(
//                                   width: double.infinity,
//                                   padding: EdgeInsets.all(16),
//                                   decoration: BoxDecoration(
//                                     color: Colors.blue[50],
//                                     borderRadius: BorderRadius.circular(12),
//                                     border: Border.all(color: Colors.blue[200]!),
//                                   ),
//                                   child: Column(
//                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                     children: [
//                                       Row(
//                                         children: [
//                                           Icon(Icons.info, color: Colors.blue, size: 20),
//                                           SizedBox(width: 8),
//                                           Text(
//                                             'Account Information',
//                                             style: TextStyle(
//                                               fontSize: 16,
//                                               fontWeight: FontWeight.w600,
//                                               color: Colors.blue[800],
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                       SizedBox(height: 12),
//                                       _buildInfoItem('Account Type', 'Regular Resident'),
//                                       _buildInfoItem('Member Since', 'January 2024'),
//                                       _buildInfoItem('Status', 'Active'),
//                                       _buildInfoItem('Maintenance Status', 'Up to Date'),
//                                     ],
//                                   ),
//                                 ),

//                                 SizedBox(height: 24),

//                                 // Quick Actions
//                                 Container(
//                                   width: double.infinity,
//                                   padding: EdgeInsets.all(16),
//                                   decoration: BoxDecoration(
//                                     color: Colors.grey[50],
//                                     borderRadius: BorderRadius.circular(12),
//                                     border: Border.all(color: Colors.grey[200]!),
//                                   ),
//                                   child: Column(
//                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                     children: [
//                                       Text(
//                                         'Quick Actions',
//                                         style: TextStyle(
//                                           fontSize: 16,
//                                           fontWeight: FontWeight.w600,
//                                           color: Colors.grey[800],
//                                         ),
//                                       ),
//                                       SizedBox(height: 12),
//                                       Row(
//                                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                         children: [
//                                           _buildQuickAction('Change Password', Icons.lock, () {
//                                             _showChangePasswordDialog();
//                                           }),
//                                           _buildQuickAction('Download Report', Icons.download, () {
//                                             _showMessage('Report download started');
//                                           }),
//                                           _buildQuickAction('Contact Admin', Icons.support_agent, () {
//                                             _showMessage('Admin contact initiated');
//                                           }),
//                                         ],
//                                       ),
//                                     ],
//                                   ),
//                                 ),

//                                 SizedBox(height: 32),

//                                 // Save Button
//                                 Container(
//                                   width: double.infinity,
//                                   child: ElevatedButton(
//                                     onPressed: _saveProfile,
//                                     style: ElevatedButton.styleFrom(
//                                       backgroundColor: AppColors.primaryBlue,
//                                       padding: EdgeInsets.symmetric(vertical: 16),
//                                       shape: RoundedRectangleBorder(
//                                         borderRadius: BorderRadius.circular(12),
//                                       ),
//                                       elevation: 2,
//                                     ),
//                                     child: Text(
//                                       'Save Changes',
//                                       style: TextStyle(
//                                         color: Colors.white,
//                                         fontSize: 16,
//                                         fontWeight: FontWeight.w600,
//                                       ),
//                                     ),
//                                   ),
//                                 ),

//                                 SizedBox(height: 16),

//                                 // Logout Button
//                                 Container(
//                                   width: double.infinity,
//                                   child: OutlinedButton(
//                                     onPressed: () {
//                                       _showLogoutDialog(context);
//                                     },
//                                     style: OutlinedButton.styleFrom(
//                                       padding: EdgeInsets.symmetric(vertical: 16),
//                                       shape: RoundedRectangleBorder(
//                                         borderRadius: BorderRadius.circular(12),
//                                       ),
//                                       side: BorderSide(color: Colors.red),
//                                     ),
//                                     child: Text(
//                                       'Logout',
//                                       style: TextStyle(
//                                         color: Colors.red,
//                                         fontSize: 16,
//                                         fontWeight: FontWeight.w600,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
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

//   Widget _buildInputField(String label, TextEditingController controller, {String? hintText}) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           label,
//           style: TextStyle(
//             fontSize: 14,
//             fontWeight: FontWeight.w500,
//             color: Colors.grey[700],
//           ),
//         ),
//         SizedBox(height: 8),
//         Container(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(8),
//             border: Border.all(color: Colors.grey[300]!),
//           ),
//           child: TextField(
//             controller: controller,
//             decoration: InputDecoration(
//               hintText: hintText,
//               hintStyle: TextStyle(color: Colors.grey[500]),
//               border: InputBorder.none,
//               contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildInfoItem(String label, String value) {
//     return Padding(
//       padding: EdgeInsets.symmetric(vertical: 4),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(
//             label,
//             style: TextStyle(
//               fontSize: 14,
//               color: Colors.grey[600],
//             ),
//           ),
//           Text(
//             value,
//             style: TextStyle(
//               fontSize: 14,
//               fontWeight: FontWeight.w500,
//               color: Colors.grey[800],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildQuickAction(String title, IconData icon, VoidCallback onTap) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Column(
//         children: [
//           Container(
//             padding: EdgeInsets.all(12),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(12),
//               border: Border.all(color: Colors.grey[300]!),
//             ),
//             child: Icon(
//               icon,
//               size: 24,
//               color: AppColors.primaryBlue,
//             ),
//           ),
//           SizedBox(height: 4),
//           Text(
//             title,
//             style: TextStyle(
//               fontSize: 12,
//               color: Colors.grey[600],
//             ),
//             textAlign: TextAlign.center,
//           ),
//         ],
//       ),
//     );
//   }

//   void _saveProfile() {
//     // Create updated user object
//     final currentUser = AuthService.currentUser!;
//     final updatedUser = User(
//       id: currentUser.id,
//       username: _usernameController.text.trim(),
//       email: _emailController.text.trim(),
//       buildingNumber: _buildingController.text.trim(),
//       mobileNumber: _mobileController.text.trim(),
//       role: currentUser.role, createdAt: null,
//     );

//     // Update user in AuthService
//     AuthService.updateProfile(updatedUser);

//     _showMessage('Profile updated successfully');
//   }

//   void _showChangePasswordDialog() {
//     final TextEditingController currentPasswordController = TextEditingController();
//     final TextEditingController newPasswordController = TextEditingController();
//     final TextEditingController confirmPasswordController = TextEditingController();

//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Change Password'),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               TextField(
//                 controller: currentPasswordController,
//                 obscureText: true,
//                 decoration: InputDecoration(
//                   labelText: 'Current Password',
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               SizedBox(height: 16),
//               TextField(
//                 controller: newPasswordController,
//                 obscureText: true,
//                 decoration: InputDecoration(
//                   labelText: 'New Password',
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               SizedBox(height: 16),
//               TextField(
//                 controller: confirmPasswordController,
//                 obscureText: true,
//                 decoration: InputDecoration(
//                   labelText: 'Confirm New Password',
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//             ],
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: Text('Cancel'),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 if (newPasswordController.text == confirmPasswordController.text) {
//                   Navigator.of(context).pop();
//                   _showMessage('Password changed successfully');
//                 } else {
//                   _showMessage('Passwords do not match', isError: true);
//                 }
//               },
//               child: Text('Update'),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   void _showLogoutDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Logout'),
//           content: Text('Are you sure you want to logout?'),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: Text('Cancel'),
//             ),
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//                 AuthService.logout();
//                 Navigator.of(context).pushNamedAndRemoveUntil('/login', (route) => false);
//               },
//               child: Text(
//                 'Logout',
//                 style: TextStyle(color: Colors.red),
//               ),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   void _showMessage(String message, {bool isError = false}) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text(message),
//         backgroundColor: isError ? Colors.red : Colors.green,
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _usernameController.dispose();
//     _emailController.dispose();
//     _buildingController.dispose();
//     _mobileController.dispose();
//     super.dispose();
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:mysociety/models/user_model.dart';
// import '../widgets/custom_text_field.dart';
// import '../widgets/custom_button.dart';
// import '../services/auth_service.dart';
// // import'../utils/app_colors.dart';
// // import '../models/user.dart';

// class ProfileScreen extends StatefulWidget {
//   const ProfileScreen({Key? key, required String userName}) : super(key: key);

//   @override
//   State<ProfileScreen> createState() => _ProfileScreenState();
// }

// class _ProfileScreenState extends State<ProfileScreen> {
//   final _usernameController = TextEditingController();
//   final _emailController = TextEditingController();
//   final _buildingController = TextEditingController();
//   final _mobileController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();

//     final user = AuthService.currentUser;
//     if (user != null) {
//       _usernameController.text = user.username;
//       _emailController.text = user.email;
//       _buildingController.text = user.buildingNumber;
//       _mobileController.text = user.mobileNumber;
//     }
//   }

//   void _saveProfile() {
//     final currentUser = AuthService.currentUser;
//     if (currentUser == null) {
//       _showMessage("No user logged in");
//       return;
//     }

//     // ✅ Fix: use currentUser.createdAt instead of null
//     final updatedUser = User(
//       id: currentUser.id,
//       username: _usernameController.text.trim(),
//       email: _emailController.text.trim(),
//       buildingNumber: _buildingController.text.trim(),
//       mobileNumber: _mobileController.text.trim(),
//       role: currentUser.role,
//       createdAt: currentUser.createdAt,
//     );

//     // Update user in AuthService
//     AuthService.updateProfile(updatedUser);

//     _showMessage('Profile updated successfully');
//   }

//   void _showMessage(String message) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text(message)),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final currentUser = AuthService.currentUser;

//     if (currentUser == null) {
//       return const Scaffold(
//         body: Center(
//           child: Text(
//             "No user logged in",
//             style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
//           ),
//         ),
//       );
//     }

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Profile"),
//         backgroundColor: Colors.blueAccent,
//         elevation: 0,
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           children: [
//             // ✅ Profile Icon
//             CircleAvatar(
//               radius: 40,
//               backgroundColor: Colors.blueAccent,
//               child: Text(
//                 currentUser.username.isNotEmpty
//                     ? currentUser.username[0].toUpperCase()
//                     : "?",
//                 style: const TextStyle(
//                   color: Colors.white,
//                   fontSize: 28,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//             const SizedBox(height: 20),

//             // ✅ Editable fields
//             CustomTextField(
//               controller: _usernameController,
//               hintText: "Username",
//               prefixIcon: Icons.person,
//             ),
//             CustomTextField(
//               controller: _emailController,
//               hintText: "Email",
//               prefixIcon: Icons.email,
//               keyboardType: TextInputType.emailAddress,
//             ),
//             CustomTextField(
//               controller: _buildingController,
//               hintText: "Building Number",
//               prefixIcon: Icons.home,
//             ),
//             CustomTextField(
//               controller: _mobileController,
//               hintText: "Mobile Number",
//               prefixIcon: Icons.phone,
//               keyboardType: TextInputType.phone,
//             ),

//             const SizedBox(height: 20),

//             CustomButton(
//               text: "Save Profile",
//               onPressed: _saveProfile,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// User({required String id, required String username, required String email, required String buildingNumber, required String mobileNumber, required UserRole role, required createdAt}) {
// }
import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class ProfileScreen extends StatefulWidget {
  final String userName;

  const ProfileScreen({Key? key, required this.userName}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _buildingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameController.text = widget.userName;
    _emailController.text = "abc123@gmail.com"; // default / can fetch from DB
    _buildingController.text = "B-402"; // default / can fetch from DB
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBlue,
      body: SafeArea(
        child: Column(
          children: [
            // Top Section with Avatar + Name
            Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person,
                        size: 50, color: AppColors.primaryBlue),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    widget.userName,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            // White Form Section
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),

                      _buildTextField("Username", _nameController),
                      const SizedBox(height: 20),

                      _buildTextField("Email", _emailController),
                      const SizedBox(height: 20),

                      _buildTextField("Building Number", _buildingController),
                      const SizedBox(height: 40),

                      // Save Button
                      Center(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryBlue,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 50, vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          onPressed: () {
                            // Save logic here
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text("Profile Saved Successfully")),
                            );
                          },
                          child: const Text(
                            "Save",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Custom TextField Builder
  Widget _buildTextField(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: AppColors.primaryBlue,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: label,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide:
                  BorderSide(color: AppColors.primaryBlue.withOpacity(0.5)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide:
                  BorderSide(color: AppColors.primaryBlue.withOpacity(0.5)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(color: AppColors.primaryBlue, width: 2),
            ),
          ),
        ),
      ],
    );
  }
}
