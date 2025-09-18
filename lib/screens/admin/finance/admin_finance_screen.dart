import 'package:flutter/material.dart';
import '../../../utils/app_colors.dart';

class AdminFinanceScreen extends StatelessWidget {
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
                        'Financial Management',
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
                  child: SingleChildScrollView(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Financial Overview
                        Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Colors.green[400]!, Colors.green[600]!],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Society Finance Overview',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  _buildFinanceItem('Total Income', '₹5,50,000'),
                                  _buildFinanceItem('Total Expenses', '₹1,80,000'),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  _buildFinanceItem('Net Balance', '₹3,70,000'),
                                  _buildFinanceItem('This Month', '₹1,45,000'),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 30),

                        // Monthly Collection
                        _buildSectionTitle('Monthly Maintenance Collection'),
                        _buildMaintenanceOverview(),
                        SizedBox(height: 30),

                        // Recent Transactions
                        _buildSectionTitle('Recent Transactions'),
                        _buildTransactionsList(),
                        SizedBox(height: 30),

                        // Expense Categories
                        _buildSectionTitle('Expense Breakdown'),
                        _buildExpenseBreakdown(),
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

  Widget _buildFinanceItem(String title, String amount) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(color: Colors.white70, fontSize: 14),
        ),
        Text(
          amount,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.grey[800],
        ),
      ),
    );
  }

  Widget _buildMaintenanceOverview() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.blue[200]!),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total Collected', style: TextStyle(fontWeight: FontWeight.w500)),
              Text('₹5,46,000', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 18)),
            ],
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Pending Collection', style: TextStyle(fontWeight: FontWeight.w500)),
              Text('₹42,000', style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold, fontSize: 16)),
            ],
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Collection Rate', style: TextStyle(fontWeight: FontWeight.w500)),
              Text('92.8%', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 16)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTransactionsList() {
    return Column(
      children: [
        _buildTransactionItem('Maintenance - A-101', '+₹3,500', '15 Dec 2024', true),
        _buildTransactionItem('Security Salary', '-₹50,000', '15 Dec 2024', false),
        _buildTransactionItem('Maintenance - B-203', '+₹3,500', '14 Dec 2024', true),
        _buildTransactionItem('Electricity Bill', '-₹28,000', '12 Dec 2024', false),
        _buildTransactionItem('Maintenance - C-305', '+₹3,500', '12 Dec 2024', true),
      ],
    );
  }

  Widget _buildTransactionItem(String title, String amount, String date, bool isIncome) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: isIncome ? Colors.green[100] : Colors.red[100],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              isIncome ? Icons.arrow_downward : Icons.arrow_upward,
              color: isIncome ? Colors.green : Colors.red,
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(fontWeight: FontWeight.w500)),
                Text(date, style: TextStyle(color: Colors.grey[600], fontSize: 12)),
              ],
            ),
          ),
          Text(
            amount,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: isIncome ? Colors.green : Colors.red,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExpenseBreakdown() {
    return Column(
      children: [
        _buildExpenseCategory('Security & Maintenance', '₹75,000', 42, Colors.blue),
        _buildExpenseCategory('Utilities (Water, Electric)', '₹45,000', 25, Colors.orange),
        _buildExpenseCategory('Cleaning & Housekeeping', '₹35,000', 19, Colors.green),
        _buildExpenseCategory('Repairs & Improvements', '₹25,000', 14, Colors.purple),
      ],
    );
  }

  Widget _buildExpenseCategory(String category, String amount, int percentage, Color color) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(category, style: TextStyle(fontWeight: FontWeight.w500)),
              Text(amount, style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 6,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(3),
                  ),
                  child: FractionallySizedBox(
                    alignment: Alignment.centerLeft,
                    widthFactor: percentage / 100,
                    child: Container(
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.circular(3),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 8),
              Text('$percentage%', style: TextStyle(fontSize: 12, color: Colors.grey[600])),
            ],
          ),
        ],
      ),
    );
  }
}
