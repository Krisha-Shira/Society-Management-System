// import 'package:flutter/material.dart';

// class AdminNoticesScreen extends StatefulWidget {
//   @override
//   _AdminNoticesScreenState createState() => _AdminNoticesScreenState();
// }

// class _AdminNoticesScreenState extends State<AdminNoticesScreen> {
//   final TextEditingController _noticeController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Color.fromARGB(255, 91, 129, 186), // dark blue
//         title: Text(
//           "Notice & Communication",
//           style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//         ),
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back_ios, color: Colors.white),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         shape: const RoundedRectangleBorder(
//           borderRadius: BorderRadius.only(
//             bottomRight: Radius.circular(40),
//           ),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           children: [
//             // Notice box
//             Container(
//               padding: EdgeInsets.all(10),
//               decoration: BoxDecoration(
//                 border: Border.all(color: Colors.grey.shade400),
//                 borderRadius: BorderRadius.circular(5),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     "Notice :",
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black87,
//                     ),
//                   ),
//                   TextField(
//                     controller: _noticeController,
//                     maxLines: 4,
//                     decoration: InputDecoration(
//                       hintText: "Type Here",
//                       border: InputBorder.none,
//                     ),
//                   ),
//                 ],
//               ),
//             ),

//             const SizedBox(height: 40),

//             // Action Buttons
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 _buildActionButton(Icons.send, "Send", Colors.blue, () {
//                   // Handle send action
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     SnackBar(content: Text("Notice Sent")),
//                   );
//                 }),
//                 _buildActionButton(Icons.delete, "Delete", Colors.red, () {
//                   _noticeController.clear();
//                 }),
//                 _buildActionButton(Icons.edit, "Edit", Colors.green, () {
//                   FocusScope.of(context).requestFocus(FocusNode());
//                 }),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildActionButton(
//       IconData icon, String label, Color color, VoidCallback onTap) {
//     return GestureDetector(
//       onTap: onTap,
//       child: CircleAvatar(
//         radius: 28,
//         backgroundColor: Color.fromARGB(255, 107, 147, 207),
//         child: Icon(icon, color: Colors.white, size: 28),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';

// class AdminNoticesScreen extends StatefulWidget {
//   @override
//   _AdminNoticesScreenState createState() => _AdminNoticesScreenState();
// }

// class _AdminNoticesScreenState extends State<AdminNoticesScreen> {
//   final TextEditingController _noticeController = TextEditingController();

//   // Define light blue (you can adjust this if you have AppColors.lightBlue)
//   final Color primaryBlue = const Color(0xFF6CA8F1); // soft light blue

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: primaryBlue, // ✅ light blue title bar
//         title: Text(
//           "Notice & Communication",
//           style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//         ),
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back_ios, color: Colors.white),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         shape: const RoundedRectangleBorder(
//           borderRadius: BorderRadius.only(
//             bottomRight: Radius.circular(40),
//           ),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           children: [
//             // Notice box
//             Container(
//               padding: EdgeInsets.all(10),
//               decoration: BoxDecoration(
//                 border: Border.all(color: Colors.grey.shade400),
//                 borderRadius: BorderRadius.circular(5),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     "Notice :",
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black54,
//                     ),
//                   ),
//                   TextField(
//                     controller: _noticeController,
//                     maxLines: 4,
//                     decoration: InputDecoration(
//                       hintText: "Type Here",
//                       border: InputBorder.none,
//                     ),
//                   ),
//                 ],
//               ),
//             ),

//             const SizedBox(height: 40),

//             // Action Buttons
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 _buildActionButton(Icons.send, "Send", primaryBlue, () {
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     SnackBar(content: Text("Notice Sent")),
//                   );
//                 }),
//                 _buildActionButton(Icons.delete, "Delete", primaryBlue, () {
//                   _noticeController.clear();
//                 }),
//                 _buildActionButton(Icons.edit, "Edit", primaryBlue, () {
//                   FocusScope.of(context).requestFocus(FocusNode());
//                 }),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildActionButton(
//       IconData icon, String label, Color color, VoidCallback onTap) {
//     return GestureDetector(
//       onTap: onTap,
//       child: CircleAvatar(
//         radius: 28,
//         backgroundColor: color, // ✅ use light blue color
//         child: Icon(icon, color: Colors.white, size: 28),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class AdminNoticesScreen extends StatefulWidget {
  @override
  _AdminNoticesScreenState createState() => _AdminNoticesScreenState();
}

class _AdminNoticesScreenState extends State<AdminNoticesScreen> {
  final TextEditingController _noticeController = TextEditingController();

  // Define light blue (you can adjust this if you have AppColors.lightBlue)
  final Color primaryBlue =
      const Color.fromARGB(255, 90, 159, 243); // soft light blue

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: primaryBlue, // ✅ light blue title bar
        title: Text(
          "Notice & Communication",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white, // ✅ white text
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(40),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Notice box
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade400),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Notice :",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ),
                  ),
                  TextField(
                    controller: _noticeController,
                    maxLines: 4,
                    decoration: InputDecoration(
                      hintText: "Type Here",
                      border: InputBorder.none,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),

            // Action Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildActionButton(Icons.send, "Send", primaryBlue, () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Notice Sent")),
                  );
                }),
                _buildActionButton(Icons.delete, "Delete", primaryBlue, () {
                  _noticeController.clear();
                }),
                _buildActionButton(Icons.edit, "Edit", primaryBlue, () {
                  FocusScope.of(context).requestFocus(FocusNode());
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton(
      IconData icon, String label, Color color, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        radius: 28,
        backgroundColor: color, // ✅ use light blue color
        child: Icon(icon, color: Colors.white, size: 28),
      ),
    );
  }
}
