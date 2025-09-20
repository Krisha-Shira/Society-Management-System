// import 'package:flutter/material.dart';
// import '../../../utils/app_colors.dart';

// // Import the same feature screens as User dashboard
// // import 'screens/admin/notices/admin_notices_screen.dart';
// import '../../maintenance_billing_screen.dart';
// import '../../account_finance_screen.dart';
// import '../../member_resident_screen.dart';
// import '../../notice_communication_screen.dart';
// import '../../profile_screen.dart';

// class AdminDashboardScreen extends StatelessWidget {
//   final String adminName;
//   final String? buildingInfo;

//   const AdminDashboardScreen({
//     Key? key,
//     this.adminName = "Admin",
//     this.buildingInfo,
//   }) : super(key: key);

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
//               // Header Section
//               Padding(
//                 padding: EdgeInsets.all(20),
//                 child: Row(
//                   children: [
//                     // Left Avatar → ProfileScreen
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) =>
//                                 ProfileScreen(userName: adminName),
//                           ),
//                         );
//                       },
//                       child: CircleAvatar(
//                         radius: 25,
//                         backgroundColor: AppColors.white,
//                         child: Icon(Icons.admin_panel_settings,
//                             color: AppColors.primaryBlue, size: 30),
//                       ),
//                     ),
//                     SizedBox(width: 15),
//                     Expanded(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Row(
//                             children: [
//                               Text(
//                                 adminName,
//                                 style: TextStyle(
//                                   color: AppColors.white,
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                               SizedBox(width: 8),
//                               Container(
//                                 padding: EdgeInsets.symmetric(
//                                     horizontal: 6, vertical: 2),
//                                 decoration: BoxDecoration(
//                                   color: Colors.orange,
//                                   borderRadius: BorderRadius.circular(8),
//                                 ),
//                                 child: Text(
//                                   'ADMIN',
//                                   style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 10,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           Text(
//                             buildingInfo ?? 'A-101, Sunrise Residency',
//                             style: TextStyle(
//                               color: AppColors.white.withOpacity(0.8),
//                               fontSize: 14,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               // Dashboard Content
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
//                   child: Column(
//                     children: [
//                       // Welcome Text
//                       // Text(
//                       //   'Welcome back, $adminName 👑',
//                       //   style: TextStyle(
//                       //     fontSize: 20,
//                       //     fontWeight: FontWeight.w600,
//                       //     color: AppColors.primaryBlue,
//                       //   ),
//                       // ),
//                       SizedBox(height: 30),
//                       // Dashboard Grid
//                       Expanded(
//                         child: GridView.count(
//                           crossAxisCount: 2,
//                           crossAxisSpacing: 20,
//                           mainAxisSpacing: 20,
//                           children: [
//                             _buildDashboardCard(
//                               context,
//                               'Notice\n&\nCommunication',
//                               Icons.message_rounded,
//                               Color(0xFF2196F3),
//                               () => Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) =>
//                                       NoticeCommunicationScreen(),
//                                 ),
//                               ),
//                             ),
//                             _buildDashboardCard(
//                               context,
//                               'Maintenance\n&\nBilling',
//                               Icons.receipt_long,
//                               Color(0xFF4CAF50),
//                               () => Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) =>
//                                       MaintenanceBillingScreen(),
//                                 ),
//                               ),
//                             ),
//                             _buildDashboardCard(
//                               context,
//                               'Accounting\nof\nSociety',
//                               Icons.account_balance,
//                               Color(0xFFFF9800),
//                               () => Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => AccountFinanceScreen(),
//                                 ),
//                               ),
//                             ),
//                             _buildDashboardCard(
//                               context,
//                               'Member\n&\nResident',
//                               Icons.people,
//                               Color(0xFF9C27B0),
//                               () => Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => MemberResidentScreen(),
//                                 ),
//                               ),
//                             ),
//                           ],
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
//           borderRadius: BorderRadius.circular(20),
//           border: Border.all(
//             color: color.withOpacity(0.3),
//             width: 1,
//           ),
//           boxShadow: [
//             BoxShadow(
//               color: color.withOpacity(0.2),
//               blurRadius: 10,
//               offset: Offset(0, 5),
//             ),
//           ],
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
//                 boxShadow: [
//                   BoxShadow(
//                     color: color.withOpacity(0.3),
//                     blurRadius: 8,
//                     offset: Offset(0, 3),
//                   ),
//                 ],
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
//                 height: 1.2,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:mysociety/screens/admin/finance/admin_finance_screen.dart';
import 'package:mysociety/screens/admin/maintenance/admin_maintenance_screen.dart';
import 'package:mysociety/screens/admin/members/admin_members_screen.dart'
    show AdminMembersScreen;
import 'package:mysociety/screens/admin/notices/admin_notices_screen.dart'
    show AdminNoticesScreen;
import '../../../utils/app_colors.dart';
// import '../utils/app_colors.dart';
// import 'profile_screen.dart';
// import 'notice_communication_screen.dart';
// import 'maintenance_billing_screen.dart';
// import 'admin_finance_screen.dart';
// import 'member_resident_screen.dart';
// ✅ Import admin dashboard (nested folder)
import 'admin_dashboard_screen.dart';

class AdminDashboardScreen extends StatelessWidget {
  final String userName;
  final String? buildingInfo;

  const AdminDashboardScreen({
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
              // Header Section (same as before) ...
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
                      Text(
                        'Welcome, ${userName.split(' ').first}!',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primaryBlue,
                        ),
                      ),
                      SizedBox(height: 30),
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
                                  builder: (context) => AdminNoticesScreen(),
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
                                  builder: (context) =>
                                      AdminMaintenanceScreen(),
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
                                  builder: (context) => AdminFinanceScreen(),
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
                                  builder: (context) => AdminMembersScreen(),
                                ),
                              ),
                            ),
                            // ✅ New Admin Panel card
                            // _buildDashboardCard(
                            //   context,
                            //   'Admin\nDashboard',
                            //   Icons.admin_panel_settings,
                            //   Color(0xFF795548),
                            //   () => Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //       builder: (context) => AdminDashboardScreen(
                            //         userName: '',
                            //       ),
                            //     ),
                            //   ),
                            // ),
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
          border: Border.all(color: color.withOpacity(0.3), width: 1),
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
              child: Icon(icon, color: AppColors.white, size: 30),
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
