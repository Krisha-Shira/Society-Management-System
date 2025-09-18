// import 'package:flutter/material.dart';
// import '../widgets/app_colors.dart';
// import 'profile_screen.dart';
// import 'maintenance_billing_screen.dart';
// import 'account_finance_screen.dart';
// import 'member_resident_screen.dart';
// import 'notice_communication_screen.dart'; // ✅ Added missing import

// class DashboardScreen extends StatelessWidget {
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
//               // Header
//               Padding(
//                 padding: EdgeInsets.all(20),
//                 child: Row(
//                   children: [
//                     // ✅ Left-side profile avatar (still here)
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => ProfileScreen(),
//                           ),
//                         );
//                       },
//                       child: CircleAvatar(
//                         radius: 25,
//                         backgroundColor: AppColors.white,
//                         child: Icon(Icons.person, color: AppColors.primaryBlue),
//                       ),
//                     ),
//                     SizedBox(width: 15),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           'KRISHA SHIRA',
//                           style: TextStyle(
//                             color: AppColors.white,
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         Text(
//                           'B-402, Spire heights',
//                           style: TextStyle(
//                             color: AppColors.white.withOpacity(0.8),
//                             fontSize: 14,
//                           ),
//                         ),
//                       ],
//                     ),
//                     Spacer(),
//                     // ✅ Removed right-side IconButton (profile logo)
//                   ],
//                 ),
//               ),

//               // Dashboard Grid
//               Expanded(
//                 child: Container(
//                   margin: EdgeInsets.only(top: 20),
//                   padding: EdgeInsets.all(30),
//                   decoration: BoxDecoration(
//                     color: AppColors.white,
//                     borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(30),
//                       topRight: Radius.circular(30),
//                     ),
//                   ),
//                   child: GridView.count(
//                     crossAxisCount: 2,
//                     crossAxisSpacing: 20,
//                     mainAxisSpacing: 20,
//                     children: [
//                       _buildDashboardCard(
//                         context,
//                         'Notice & Communication',
//                         Icons.message,
//                         Colors.blue,
//                         () => Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => NoticeCommunicationScreen(),
//                           ),
//                         ),
//                       ),
//                       _buildDashboardCard(
//                         context,
//                         'Maintenance & Billing',
//                         Icons.receipt,
//                         Colors.green,
//                         () => Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => MaintenanceBillingScreen(),
//                           ),
//                         ),
//                       ),
//                       _buildDashboardCard(
//                         context,
//                         'Account & Fiance',
//                         Icons.account_balance,
//                         Colors.orange,
//                         () => Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => AccountFinanceScreen(),
//                           ),
//                         ),
//                       ),
//                       _buildDashboardCard(
//                         context,
//                         'Members & Resident',
//                         Icons.group,
//                         Colors.purple,
//                         () => Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => MemberResidentScreen(),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildDashboardCard(
//     BuildContext context,
//     String title,
//     IconData icon,
//     Color color,
//     VoidCallback onTap,
//   ) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         decoration: BoxDecoration(
//           color: color.withOpacity(0.1),
//           borderRadius: BorderRadius.circular(15),
//           border: Border.all(color: color.withOpacity(0.3)),
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Container(
//               width: 60,
//               height: 60,
//               decoration: BoxDecoration(
//                 color: color,
//                 borderRadius: BorderRadius.circular(15),
//               ),
//               child: Icon(
//                 icon,
//                 color: AppColors.white,
//                 size: 30,
//               ),
//             ),
//             SizedBox(height: 15),
//             Text(
//               title,
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 fontSize: 12,
//                 fontWeight: FontWeight.w600,
//                 color: AppColors.darkGrey,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import '../widgets/app_colors.dart';
// import '../utils/auth_service.dart';

// class DashboardScreen extends StatelessWidget {
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
//               // Header with user info and role-based profile navigation
//               Padding(
//                 padding: EdgeInsets.all(20.0),
//                 child: Row(
//                   children: [
//                     // Profile Picture - Navigate to appropriate profile
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.pushNamed(context, '/profile');
//                       },
//                       child: Container(
//                         width: 50,
//                         height: 50,
//                         decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                           color: Colors.white,
//                         ),
//                         child: Center(
//                           child: Text(
//                             user.initials,
//                             style: TextStyle(
//                               color: AppColors.primaryBlue,
//                               fontSize: 18,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     SizedBox(width: 15),
//                     // User info with role badge
//                     Expanded(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Row(
//                             children: [
//                               Text(
//                                 user.username,
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                               if (user.isAdmin) ...[
//                                 SizedBox(width: 8),
//                                 Container(
//                                   padding: EdgeInsets.symmetric(
//                                       horizontal: 6, vertical: 2),
//                                   decoration: BoxDecoration(
//                                     color: Colors.orange,
//                                     borderRadius: BorderRadius.circular(8),
//                                   ),
//                                   child: Text(
//                                     'ADMIN',
//                                     style: TextStyle(
//                                       color: Colors.white,
//                                       fontSize: 10,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ],
//                           ),
//                           Text(
//                             user.buildingNumber,
//                             style: TextStyle(
//                               color: Colors.white70,
//                               fontSize: 14,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),

//               // Dashboard modules (same for both roles, but admin might see additional options)
//               Expanded(
//                 child: Container(
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(30),
//                       topRight: Radius.circular(30),
//                     ),
//                   ),
//                   child: Padding(
//                     padding: EdgeInsets.all(20.0),
//                     child: Column(
//                       children: [
//                         // Module Cards
//                         Expanded(
//                           child: GridView.count(
//                             crossAxisCount: 2,
//                             crossAxisSpacing: 15,
//                             mainAxisSpacing: 15,
//                             children: [
//                               _buildModuleCard(
//                                 context,
//                                 'Notice &\nCommunication',
//                                 Icons.notifications,
//                                 Colors.blue[100]!,
//                                 Colors.blue,
//                                 '/notice',
//                               ),
//                               _buildModuleCard(
//                                 context,
//                                 'Maintenance\n& Billing',
//                                 Icons.payment,
//                                 Colors.green[100]!,
//                                 Colors.green,
//                                 '/maintenance',
//                               ),
//                               _buildModuleCard(
//                                 context,
//                                 'Account &\nFinance',
//                                 Icons.account_balance,
//                                 Colors.orange[100]!,
//                                 Colors.orange,
//                                 '/finance',
//                               ),
//                               _buildModuleCard(
//                                 context,
//                                 'Member &\nResident',
//                                 Icons.people,
//                                 Colors.purple[100]!,
//                                 Colors.purple,
//                                 '/members',
//                               ),
//                             ],
//                           ),
//                         ),

//                         // Admin-only section
//                         if (user.isAdmin) ...[
//                           Divider(),
//                           SizedBox(height: 10),
//                           Text(
//                             'Admin Controls',
//                             style: TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.grey[700],
//                             ),
//                           ),
//                           SizedBox(height: 10),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             children: [
//                               _buildAdminButton(context, 'Manage Users',
//                                   Icons.admin_panel_settings),
//                               _buildAdminButton(
//                                   context, 'Reports', Icons.analytics),
//                               _buildAdminButton(
//                                   context, 'Settings', Icons.settings),
//                             ],
//                           ),
//                         ],
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

//   Widget _buildModuleCard(BuildContext context, String title, IconData icon,
//       Color bgColor, Color? iconColor, String route) {
//     return GestureDetector(
//       onTap: () {
//         Navigator.pushNamed(context, route);
//       },
//       child: Container(
//         decoration: BoxDecoration(
//           color: bgColor,
//           borderRadius: BorderRadius.circular(15),
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(
//               icon,
//               size: 40,
//               color: iconColor,
//             ),
//             SizedBox(height: 10),
//             Text(
//               title,
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 fontSize: 14,
//                 fontWeight: FontWeight.w600,
//                 color: iconColor,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildAdminButton(BuildContext context, String title, IconData icon) {
//     return GestureDetector(
//       onTap: () {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('$title clicked')),
//         );
//       },
//       child: Column(
//         children: [
//           Container(
//             padding: EdgeInsets.all(12),
//             decoration: BoxDecoration(
//               color: Colors.orange[50],
//               borderRadius: BorderRadius.circular(12),
//               border: Border.all(color: Colors.orange[200]!),
//             ),
//             child: Icon(
//               icon,
//               size: 24,
//               color: Colors.orange[700],
//             ),
//           ),
//           SizedBox(height: 4),
//           Text(
//             title,
//             style: TextStyle(
//               fontSize: 12,
//               color: Colors.grey[600],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import '../utils/app_colors.dart';
// import '../utils/auth_service.dart';
// import '../models/user_model.dart';

// class DashboardScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<User?>(
//       stream: AuthService.authStateChanges,
//       builder: (context, snapshot) {
//         final user = snapshot.data;

//         // Case 1: No user logged in → redirect to login
//         if (user == null) {
//           Future.microtask(() {
//             Navigator.pushReplacementNamed(context, '/login');
//           });
//           return Scaffold(
//             body: Center(child: CircularProgressIndicator()),
//           );
//         }

//         // Case 2: User available → build dashboard
//         return Scaffold(
//           body: Container(
//             decoration: BoxDecoration(gradient: AppColors.primaryGradient),
//             child: SafeArea(
//               child: Column(
//                 children: [
//                   // Header with user info
//                   Padding(
//                     padding: EdgeInsets.all(20.0),
//                     child: Row(
//                       children: [
//                         // Profile Picture
//                         GestureDetector(
//                           onTap: () {
//                             Navigator.pushNamed(context, '/profile');
//                           },
//                           child: Container(
//                             width: 50,
//                             height: 50,
//                             decoration: BoxDecoration(
//                               shape: BoxShape.circle,
//                               color: Colors.white,
//                             ),
//                             child: Center(
//                               child: Text(
//                                 user.initials,
//                                 style: TextStyle(
//                                   color: AppColors.primaryBlue,
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                         SizedBox(width: 15),
//                         // User info with role badge
//                         Expanded(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Row(
//                                 children: [
//                                   Text(
//                                     user.username,
//                                     style: TextStyle(
//                                       color: Colors.white,
//                                       fontSize: 18,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                   if (user.isAdmin) ...[
//                                     SizedBox(width: 8),
//                                     Container(
//                                       padding: EdgeInsets.symmetric(
//                                           horizontal: 6, vertical: 2),
//                                       decoration: BoxDecoration(
//                                         color: Colors.orange,
//                                         borderRadius: BorderRadius.circular(8),
//                                       ),
//                                       child: Text(
//                                         'ADMIN',
//                                         style: TextStyle(
//                                           color: Colors.white,
//                                           fontSize: 10,
//                                           fontWeight: FontWeight.bold,
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ],
//                               ),
//                               Text(
//                                 user.buildingNumber,
//                                 style: TextStyle(
//                                   color: Colors.white70,
//                                   fontSize: 14,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),

//                   // Dashboard body (your grid + admin controls)
//                   Expanded(
//                     child: Container(
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.only(
//                           topLeft: Radius.circular(30),
//                           topRight: Radius.circular(30),
//                         ),
//                       ),
//                       child: Padding(
//                         padding: EdgeInsets.all(20.0),
//                         child: _buildDashboardContent(context, user),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }

//   /// Builds the main dashboard content
//   Widget _buildDashboardContent(BuildContext context, User user) {
//     return Column(
//       children: [
//         // Module Cards
//         Expanded(
//           child: GridView.count(
//             crossAxisCount: 2,
//             crossAxisSpacing: 15,
//             mainAxisSpacing: 15,
//             children: [
//               _buildModuleCard(
//                 context,
//                 'Notice &\nCommunication',
//                 Icons.notifications,
//                 Colors.blue[100]!,
//                 Colors.blue,
//                 '/notice',
//               ),
//               _buildModuleCard(
//                 context,
//                 'Maintenance\n& Billing',
//                 Icons.payment,
//                 Colors.green[100]!,
//                 Colors.green,
//                 '/maintenance',
//               ),
//               _buildModuleCard(
//                 context,
//                 'Account &\nFinance',
//                 Icons.account_balance,
//                 Colors.orange[100]!,
//                 Colors.orange,
//                 '/finance',
//               ),
//               _buildModuleCard(
//                 context,
//                 'Member &\nResident',
//                 Icons.people,
//                 Colors.purple[100]!,
//                 Colors.purple,
//                 '/members',
//               ),
//             ],
//           ),
//         ),

//         // Admin-only section
//         if (user.isAdmin) ...[
//           Divider(),
//           SizedBox(height: 10),
//           Text(
//             'Admin Controls',
//             style: TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.bold,
//               color: Colors.grey[700],
//             ),
//           ),
//           SizedBox(height: 10),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               _buildAdminButton(
//                   context, 'Manage Users', Icons.admin_panel_settings),
//               _buildAdminButton(context, 'Reports', Icons.analytics),
//               _buildAdminButton(context, 'Settings', Icons.settings),
//             ],
//           ),
//         ],
//       ],
//     );
//   }

//   /// Builds a dashboard module card
//   Widget _buildModuleCard(
//     BuildContext context,
//     String title,
//     IconData icon,
//     Color bgColor,
//     Color? iconColor,
//     String route,
//   ) {
//     return GestureDetector(
//       onTap: () {
//         Navigator.pushNamed(context, route);
//       },
//       child: Container(
//         decoration: BoxDecoration(
//           color: bgColor,
//           borderRadius: BorderRadius.circular(15),
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(icon, size: 40, color: iconColor),
//             SizedBox(height: 10),
//             Text(
//               title,
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 fontSize: 14,
//                 fontWeight: FontWeight.w600,
//                 color: iconColor,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   /// Builds an admin-only action button
//   Widget _buildAdminButton(BuildContext context, String title, IconData icon) {
//     return GestureDetector(
//       onTap: () {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('$title clicked')),
//         );
//       },
//       child: Column(
//         children: [
//           Container(
//             padding: EdgeInsets.all(12),
//             decoration: BoxDecoration(
//               color: Colors.orange[50],
//               borderRadius: BorderRadius.circular(12),
//               border: Border.all(color: Colors.orange[200]!),
//             ),
//             child: Icon(icon, size: 24, color: Colors.orange[700]),
//           ),
//           SizedBox(height: 4),
//           Text(
//             title,
//             style: TextStyle(fontSize: 12, color: Colors.grey[600]),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import 'profile_screen.dart';
import 'notice_communication_screen.dart';
import 'maintenance_billing_screen.dart';
import 'account_finance_screen.dart';
import 'member_resident_screen.dart';

class DashboardScreen extends StatelessWidget {
  final String userName;
  final String? buildingInfo;

  const DashboardScreen({
    Key? key,
    required this.userName,
    this.buildingInfo,
  }) : super(key: key);

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
              // Header Section
              Padding(
                padding: EdgeInsets.all(20),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: AppColors.white,
                      child: ClipOval(
                        child: Image.asset(
                          'assets/images/profile.jpg', // Add profile image or use default
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Icon(
                              Icons.person,
                              color: AppColors.primaryBlue,
                              size: 30,
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            userName,
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            buildingInfo ?? 'B-402, Spire heights',
                            style: TextStyle(
                              color: AppColors.white.withOpacity(0.8),
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.person, color: AppColors.white, size: 30),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProfileScreen(userName: userName),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              // Dashboard Content
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(top: 20),
                  padding: EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    children: [
                      // Welcome Text
                      Text(
                        'Welcome, ${userName.split(' ').first}!',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primaryBlue,
                        ),
                      ),
                      SizedBox(height: 30),
                      // Dashboard Grid
                      Expanded(
                        child: GridView.count(
                          crossAxisCount: 2,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                          children: [
                            _buildDashboardCard(
                              context,
                              'Notice\n&\nCommunication',
                              Icons.message_rounded,
                              Color(0xFF2196F3),
                              () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => NoticeCommunicationScreen(),
                                ),
                              ),
                            ),
                            _buildDashboardCard(
                              context,
                              'Maintenance\n&\nBilling',
                              Icons.receipt_long,
                              Color(0xFF4CAF50),
                              () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MaintenanceBillingScreen(),
                                ),
                              ),
                            ),
                            _buildDashboardCard(
                              context,
                              'Accounting\nof\nSociety',
                              Icons.account_balance,
                              Color(0xFFFF9800),
                              () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AccountFinanceScreen(),
                                ),
                              ),
                            ),
                            _buildDashboardCard(
                              context,
                              'Member\n&\nResident',
                              Icons.people,
                              Color(0xFF9C27B0),
                              () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MemberResidentScreen(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDashboardCard(
    BuildContext context,
    String title,
    IconData icon,
    Color color,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: color.withOpacity(0.3),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.2),
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: color.withOpacity(0.3),
                    blurRadius: 8,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Icon(
                icon,
                color: AppColors.white,
                size: 30,
              ),
            ),
            SizedBox(height: 15),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: AppColors.darkGrey,
                height: 1.2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}