// import 'package:flutter/material.dart';
// import '../../../utils/app_colors.dart';
// // import '../../../widgets/common/custom_button.dart';

// class AdminMembersScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: BoxDecoration(gradient: AppColors.primaryGradient),
//         child: SafeArea(
//           child: Column(
//             children: [
//               // Header
//               Padding(
//                 padding: EdgeInsets.all(16.0),
//                 child: Row(
//                   children: [
//                     GestureDetector(
//                       onTap: () => Navigator.pop(context),
//                       child: Icon(Icons.arrow_back, color: Colors.white),
//                     ),
//                     Expanded(
//                       child: Text(
//                         'Member Management',
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 18,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                     ),
//                     IconButton(
//                       onPressed: () => _showAddMemberDialog(context),
//                       icon: Icon(Icons.add, color: Colors.white),
//                     ),
//                   ],
//                 ),
//               ),

//               // Content
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
//                   child: Column(
//                     children: [
//                       // Search and Stats
//                       Padding(
//                         padding: EdgeInsets.all(20),
//                         child: Column(
//                           children: [
//                             // Search Bar
//                             TextField(
//                               decoration: InputDecoration(
//                                 hintText: 'Search members...',
//                                 prefixIcon: Icon(Icons.search),
//                                 border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(12),
//                                 ),
//                               ),
//                             ),
//                             SizedBox(height: 20),

//                             // Stats Row
//                             Row(
//                               children: [
//                                 Expanded(child: _buildStatCard('Total Members', '156', Colors.blue)),
//                                 SizedBox(width: 12),
//                                 Expanded(child: _buildStatCard('Active', '144', Colors.green)),
//                                 SizedBox(width: 12),
//                                 Expanded(child: _buildStatCard('Pending', '12', Colors.orange)),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),

//                       // Members List
//                       Expanded(
//                         child: ListView(
//                           padding: EdgeInsets.symmetric(horizontal: 20),
//                           children: [
//                             _buildMemberManagementCard('John Doe', 'A-101', '+91 98765 43210', 'JD', true, false),
//                             _buildMemberManagementCard('Priya Sharma', 'A-102', '+91 98123 45678', 'PS', true, false),
//                             _buildMemberManagementCard('Rahul Patel', 'B-201', '+91 97654 32110', 'RP', false, true),
//                             _buildMemberManagementCard('Anita Singh', 'B-202', '+91 96543 21009', 'AS', true, false),
//                             _buildMemberManagementCard('Vikram Kumar', 'C-301', '+91 95432 10098', 'VK', true, false),
//                             _buildMemberManagementCard('Sneha Gupta', 'C-302', '+91 94321 00987', 'SG', false, true),
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

//   Widget _buildStatCard(String title, String count, Color color) {
//     return Container(
//       padding: EdgeInsets.all(12),
//       decoration: BoxDecoration(
//         color: color.withOpacity(0.1),
//         borderRadius: BorderRadius.circular(8),
//         border: Border.all(color: color.withOpacity(0.3)),
//       ),
//       child: Column(
//         children: [
//           Text(
//             count,
//             style: TextStyle(
//               fontSize: 20,
//               fontWeight: FontWeight.bold,
//               color: color,
//             ),
//           ),
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

//   Widget _buildMemberManagementCard(String name, String flat, String phone, String initials,
//       bool isActive, bool isAdmin) {
//     return Container(
//       margin: EdgeInsets.only(bottom: 16),
//       padding: EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//         border: Border.all(color: Colors.grey[300]!),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.1),
//             spreadRadius: 1,
//             blurRadius: 5,
//             offset: Offset(0, 2),
//           ),
//         ],
//       ),
//       child: Column(
//         children: [
//           Row(
//             children: [
//               // Avatar
//               Container(
//                 width: 50,
//                 height: 50,
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   gradient: AppColors.primaryGradient,
//                 ),
//                 child: Center(
//                   child: Text(
//                     initials,
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(width: 16),

//               // Member Info
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       children: [
//                         Text(
//                           name,
//                           style: TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.grey[800],
//                           ),
//                         ),
//                         if (isAdmin) ...[
//                           SizedBox(width: 8),
//                           Container(
//                             padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
//                             decoration: BoxDecoration(
//                               color: Colors.orange,
//                               borderRadius: BorderRadius.circular(8),
//                             ),
//                             child: Text(
//                               'ADMIN',
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 8,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ],
//                     ),
//                     SizedBox(height: 4),
//                     Text('$flat • $phone', style: TextStyle(color: Colors.grey[600])),
//                   ],
//                 ),
//               ),

//               // Status
//               Container(
//                 padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//                 decoration: BoxDecoration(
//                   color: isActive ? Colors.green[100] : Colors.red[100],
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 child: Text(
//                   isActive ? 'Active' : 'Inactive',
//                   style: TextStyle(
//                     color: isActive ? Colors.green[700] : Colors.red[700],
//                     fontSize: 12,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(height: 12),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               TextButton(
//                 onPressed: () => _showMessage('Editing member: $name'),
//                 child: Text('Edit'),
//               ),
//               TextButton(
//                 onPressed: () => _showMessage(isActive ? 'Member deactivated' : 'Member activated'),
//                 child: Text(isActive ? 'Deactivate' : 'Activate'),
//               ),
//               TextButton(
//                 onPressed: () => _showMessage(isAdmin ? 'Admin rights removed' : 'Admin rights granted'),
//                 child: Text(isAdmin ? 'Remove Admin' : 'Make Admin'),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   void _showAddMemberDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Text('Add New Member'),
//         content: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             TextField(
//               decoration: InputDecoration(
//                 labelText: 'Full Name',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             SizedBox(height: 16),
//             TextField(
//               decoration: InputDecoration(
//                 labelText: 'Flat Number',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             SizedBox(height: 16),
//             TextField(
//               decoration: InputDecoration(
//                 labelText: 'Mobile Number',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//           ],
//         ),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: Text('Cancel'),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               Navigator.pop(context);
//               _showMessage('Member added successfully');
//             },
//             child: Text('Add Member'),
//           ),
//         ],
//       ),
//     );
//   }

//   void _showMessage(String message) {
//     // This would typically use a BuildContext from a StatefulWidget
//     // For demo purposes, we'll just print the message
//     print(message);
//   }
// }

// import 'package:flutter/material.dart';

// class Member {
//   final String name;
//   final String flat;
//   final String building;
//   final String phone;

//   Member({
//     required this.name,
//     required this.flat,
//     required this.building,
//     required this.phone,
//   });
// }

// class AdminMembersScreen extends StatefulWidget {
//   @override
//   _AdminMembersScreenState createState() => _AdminMembersScreenState();
// }

// class _AdminMembersScreenState extends State<AdminMembersScreen> {
//   List<Member> members = []; // initially empty

//   void _showAddMemberDialog() {
//     final nameController = TextEditingController();
//     final flatController = TextEditingController();
//     final buildingController = TextEditingController();
//     final phoneController = TextEditingController();

//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Text("Add New Member"),
//         content: SingleChildScrollView(
//           child: Column(
//             children: [
//               TextField(
//                   controller: nameController,
//                   decoration: InputDecoration(labelText: "Full Name")),
//               SizedBox(height: 10),
//               TextField(
//                   controller: flatController,
//                   decoration: InputDecoration(labelText: "Flat No")),
//               SizedBox(height: 10),
//               TextField(
//                   controller: buildingController,
//                   decoration: InputDecoration(labelText: "Building No")),
//               SizedBox(height: 10),
//               TextField(
//                   controller: phoneController,
//                   decoration: InputDecoration(labelText: "Mobile No")),
//             ],
//           ),
//         ),
//         actions: [
//           TextButton(
//               onPressed: () => Navigator.pop(context), child: Text("Cancel")),
//           ElevatedButton(
//             onPressed: () {
//               setState(() {
//                 members.add(Member(
//                   name: nameController.text.isEmpty ? "-" : nameController.text,
//                   flat: flatController.text.isEmpty ? "-" : flatController.text,
//                   building: buildingController.text.isEmpty
//                       ? "-"
//                       : buildingController.text,
//                   phone:
//                       phoneController.text.isEmpty ? "-" : phoneController.text,
//                 ));
//               });
//               Navigator.pop(context);
//             },
//             child: Text("Add"),
//           )
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Member & Resident")),
//       body: members.isEmpty
//           ? Center(child: Text("No Members Added"))
//           : ListView.builder(
//               itemCount: members.length,
//               itemBuilder: (context, index) {
//                 final member = members[index];
//                 return Card(
//                   margin: EdgeInsets.all(10),
//                   child: ListTile(
//                     title: Text("Member Name: ${member.name}"),
//                     subtitle: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text("Flat No: ${member.flat}"),
//                         Text("Building No: ${member.building}"),
//                         Text("Mobile No: ${member.phone}"),
//                       ],
//                     ),
//                     trailing: IconButton(
//                       icon: Icon(Icons.delete, color: Colors.red),
//                       onPressed: () {
//                         setState(() {
//                           members.removeAt(index);
//                         });
//                       },
//                     ),
//                   ),
//                 );
//               },
//             ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _showAddMemberDialog,
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class Member {
  final String name;
  final String flat;
  final String building;
  final String phone;

  Member({
    required this.name,
    required this.flat,
    required this.building,
    required this.phone,
  });
}

class AdminMembersScreen extends StatefulWidget {
  @override
  _AdminMembersScreenState createState() => _AdminMembersScreenState();
}

class _AdminMembersScreenState extends State<AdminMembersScreen> {
  List<Member> members = []; // initially empty

  void _showAddMemberDialog() {
    final nameController = TextEditingController();
    final flatController = TextEditingController();
    final buildingController = TextEditingController();
    final phoneController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Add New Member"),
        content: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                  controller: nameController,
                  decoration: InputDecoration(labelText: "Full Name")),
              SizedBox(height: 10),
              TextField(
                  controller: flatController,
                  decoration: InputDecoration(labelText: "Flat No")),
              SizedBox(height: 10),
              TextField(
                  controller: buildingController,
                  decoration: InputDecoration(labelText: "Building No")),
              SizedBox(height: 10),
              TextField(
                  controller: phoneController,
                  decoration: InputDecoration(labelText: "Mobile No")),
            ],
          ),
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context), child: Text("Cancel")),
          ElevatedButton(
            onPressed: () {
              setState(() {
                members.add(Member(
                  name: nameController.text.isEmpty ? "-" : nameController.text,
                  flat: flatController.text.isEmpty ? "-" : flatController.text,
                  building: buildingController.text.isEmpty
                      ? "-"
                      : buildingController.text,
                  phone:
                      phoneController.text.isEmpty ? "-" : phoneController.text,
                ));
              });
              Navigator.pop(context);
            },
            child: Text("Add"),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Color primaryBlue = const Color(0xFF1976D2);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // 🔹 Gradient Header with white arrow + white text
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(left: 16, right: 16, top: 40, bottom: 20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [primaryBlue, Colors.lightBlueAccent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(40),
              ),
            ),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white, // ✅ white arrow
                  ),
                ),
                Expanded(
                  child: Text(
                    "Member & Resident",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white, // ✅ white text
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(width: 24), // keep balance
              ],
            ),
          ),

          // 🔹 Main content
          Expanded(
            child: members.isEmpty
                ? Center(child: Text("No Members Added"))
                : ListView.builder(
                    itemCount: members.length,
                    itemBuilder: (context, index) {
                      final member = members[index];
                      return Card(
                        margin: EdgeInsets.all(10),
                        child: ListTile(
                          title: Text("Member Name: ${member.name}"),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Flat No: ${member.flat}"),
                              Text("Building No: ${member.building}"),
                              Text("Mobile No: ${member.phone}"),
                            ],
                          ),
                          trailing: IconButton(
                            icon: Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              setState(() {
                                members.removeAt(index);
                              });
                            },
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),

      // 🔹 Floating Add Button
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryBlue, // match header theme
        onPressed: _showAddMemberDialog,
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
