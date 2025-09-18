import 'package:flutter/material.dart';
import '../../../utils/app_colors.dart';
// import '../../../widgets/common/custom_button.dart';

class AdminMaintenanceScreen extends StatefulWidget {
  @override
  _AdminMaintenanceScreenState createState() => _AdminMaintenanceScreenState();
}

class _AdminMaintenanceScreenState extends State<AdminMaintenanceScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: AppColors.primaryGradient),
        child: SafeArea(
          child: Column(
            children: [
              // Header
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Icon(Icons.arrow_back, color: Colors.white),
                    ),
                    Expanded(
                      child: Text(
                        'Maintenance Management',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(width: 24),
                  ],
                ),
              ),

              // Content
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    children: [
                      // Tab Bar
                      Container(
                        margin: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: TabBar(
                          controller: _tabController,
                          indicator: BoxDecoration(
                            color: AppColors.primaryBlue,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          labelColor: Colors.white,
                          unselectedLabelColor: Colors.grey[600],
                          tabs: [
                            Tab(text: 'Overview'),
                            Tab(text: 'Pending'),
                            Tab(text: 'Reports'),
                          ],
                        ),
                      ),

                      // Tab Views
                      Expanded(
                        child: TabBarView(
                          controller: _tabController,
                          children: [
                            _buildOverviewTab(),
                            _buildPendingTab(),
                            _buildReportsTab(),
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

  Widget _buildOverviewTab() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          // Stats Cards
          Row(
            children: [
              Expanded(
                child: _buildStatCard('Total Collection', '₹1,50,000', Colors.green, Icons.trending_up),
              ),
              SizedBox(width: 16),
              Expanded(
                child: _buildStatCard('Pending Amount', '₹25,000', Colors.orange, Icons.pending),
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _buildStatCard('Paid Members', '144/156', Colors.blue, Icons.people),
              ),
              SizedBox(width: 16),
              Expanded(
                child: _buildStatCard('Overdue', '12', Colors.red, Icons.warning),
              ),
            ],
          ),
          SizedBox(height: 30),

          // Quick Actions
          Text(
            'Quick Actions',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.grey[800],
            ),
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: CustomButton(
                  text: 'Send Reminder',
                  onPressed: () => _showMessage('Maintenance reminders sent'),
                  backgroundColor: Colors.orange,
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: CustomButton(
                  text: 'Generate Report',
                  onPressed: () => _showMessage('Report generated'),
                  backgroundColor: Colors.blue,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPendingTab() {
    return ListView(
      padding: EdgeInsets.all(20),
      children: [
        _buildPendingItem('A-101', 'John Doe', '₹3,500', '15 days overdue'),
        _buildPendingItem('B-203', 'Priya Sharma', '₹3,500', '8 days overdue'),
        _buildPendingItem('C-305', 'Rahul Patel', '₹3,500', '22 days overdue'),
        _buildPendingItem('A-204', 'Anita Singh', '₹3,500', '5 days overdue'),
        _buildPendingItem('B-101', 'Vikram Kumar', '₹3,500', '12 days overdue'),
      ],
    );
  }

  Widget _buildReportsTab() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Monthly Reports',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.grey[800],
            ),
          ),
          SizedBox(height: 16),
          _buildReportItem('December 2024', '₹1,45,000', '92%'),
          _buildReportItem('November 2024', '₹1,48,000', '95%'),
          _buildReportItem('October 2024', '₹1,42,000', '91%'),
          _buildReportItem('September 2024', '₹1,50,000', '96%'),
          SizedBox(height: 30),
          
          CustomButton(
            text: 'Export All Reports',
            onPressed: () => _showMessage('Reports exported successfully'),
            backgroundColor: Colors.green,
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(String title, String value, Color color, IconData icon) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 32),
          SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[600],
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildPendingItem(String flat, String name, String amount, String overdue) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.red[200]!),
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.red[100],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                flat,
                style: TextStyle(
                  color: Colors.red[700],
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  overdue,
                  style: TextStyle(color: Colors.red, fontSize: 12),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                amount,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                ),
              ),
              TextButton(
                onPressed: () => _showMessage('Reminder sent to $name'),
                child: Text('Send Reminder'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildReportItem(String month, String amount, String percentage) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                month,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                'Collection: $amount',
                style: TextStyle(color: Colors.grey[600]),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.green[100],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              percentage,
              style: TextStyle(
                color: Colors.green[700],
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}

CustomButton({required String text, required void Function() onPressed, required MaterialColor backgroundColor}) {
}