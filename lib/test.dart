// import 'package:flutter/material.dart';

// void main() {
//   runApp(const CareerTrackerApp());
// }

// class CareerTrackerApp extends StatelessWidget {
//   const CareerTrackerApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Career Tracker',
//       theme: ThemeData(
//         primarySwatch: Colors.deepPurple,
//         fontFamily: 'Poppins',
//         scaffoldBackgroundColor: const Color(0xFFF7F8FA),
//         appBarTheme: const AppBarTheme(
//           elevation: 0,
//           backgroundColor: Colors.white,
//           iconTheme: IconThemeData(color: Color(0xFF1F1F1F)),
//           titleTextStyle: TextStyle(
//             color: Color(0xFF1F1F1F),
//             fontSize: 20,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//       ),
//       home: const MainNavigation(),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }

// class MainNavigation extends StatefulWidget {
//   const MainNavigation({super.key});

//   @override
//   State<MainNavigation> createState() => _MainNavigationState();
// }

// class _MainNavigationState extends State<MainNavigation> {
//   int _currentIndex = 0;

//   final List<Widget> _screens = [
//     const DashboardScreen(),
//     const ApplicationsScreen(),
//     const AddApplicationScreen(),
//     const NotificationsScreen(),
//     const ProfileScreen(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _screens[_currentIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _currentIndex,
//         onTap: (index) => setState(() => _currentIndex = index),
//         type: BottomNavigationBarType.fixed,
//         selectedItemColor: const Color(0xFF5A31F4),
//         unselectedItemColor: const Color(0xFF6C6C6C),
//         selectedLabelStyle: const TextStyle(fontSize: 12),
//         unselectedLabelStyle: const TextStyle(fontSize: 12),
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.dashboard),
//             label: 'Dashboard',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.list_alt),
//             label: 'Applications',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.add_circle_outline),
//             label: 'Add',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.notifications_outlined),
//             label: 'Reminders',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person_outline),
//             label: 'Profile',
//           ),
//         ],
//       ),
//     );
//   }
// }

// class DashboardScreen extends StatelessWidget {
//   const DashboardScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Dashboard'),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.search),
//             onPressed: () {},
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text(
//               'Overview',
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.w600,
//                 color: Color(0xFF1F1F1F),
//               ),
//             ),
//             const SizedBox(height: 16),
//             Row(
//               children: [
//                 _buildStatCard(
//                   'Total Applications',
//                   '24',
//                   const Color(0xFF5A31F4),
//                 ),
//                 const SizedBox(width: 12),
//                 _buildStatCard(
//                   'Pending',
//                   '12',
//                   const Color(0xFFFFD700),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 12),
//             Row(
//               children: [
//                 _buildStatCard(
//                   'Accepted',
//                   '5',
//                   const Color(0xFF00C896),
//                 ),
//                 const SizedBox(width: 12),
//                 _buildStatCard(
//                   'Rejected',
//                   '7',
//                   const Color(0xFFFF4D4D),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 24),
//             const Text(
//               'Insights',
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.w600,
//                 color: Color(0xFF1F1F1F),
//               ),
//             ),
//             const SizedBox(height: 16),
//             _buildInsightCard(
//               'Most Common Type',
//               'Internship',
//               Icons.work_outline,
//             ),
//             const SizedBox(height: 12),
//             _buildInsightCard(
//               'Top Field',
//               'Tech',
//               Icons.category_outlined,
//             ),
//             const SizedBox(height: 24),
//             const Text(
//               'Recent Applications',
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.w600,
//                 color: Color(0xFF1F1F1F),
//               ),
//             ),
//             const SizedBox(height: 16),
//             _buildRecentApplicationItem(
//               'UX Designer',
//               'Google',
//               'Pending',
//               const Color(0xFFFFD700),
//             ),
//             _buildRecentApplicationItem(
//               'Frontend Dev',
//               'Meta',
//               'Interview',
//               const Color(0xFF5A31F4),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildStatCard(String title, String value, Color color) {
//     return Expanded(
//       child: Container(
//         padding: const EdgeInsets.all(16),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(16),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.05),
//               blurRadius: 8,
//               offset: const Offset(0, 4),
//             ),
//           ],
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               title,
//               style: const TextStyle(
//                 fontSize: 14,
//                 color: Color(0xFF6C6C6C),
//               ),
//             ),
//             const SizedBox(height: 8),
//             Text(
//               value,
//               style: TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.w600,
//                 color: color,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildInsightCard(String title, String value, IconData icon) {
//     return Container(
//       width: double.infinity,
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(16),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.05),
//             blurRadius: 8,
//             offset: const Offset(0, 4),
//           ),
//         ],
//       ),
//       child: Row(
//         children: [
//           Container(
//             padding: const EdgeInsets.all(12),
//             decoration: BoxDecoration(
//               color: const Color(0xFF5A31F4).withOpacity(0.1),
//               borderRadius: BorderRadius.circular(12),
//             ),
//             child: Icon(
//               icon,
//               color: const Color(0xFF5A31F4),
//               size: 24,
//             ),
//           ),
//           const SizedBox(width: 16),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 title,
//                 style: const TextStyle(
//                   fontSize: 14,
//                   color: Color(0xFF6C6C6C),
//                 ),
//               ),
//               const SizedBox(height: 4),
//               Text(
//                 value,
//                 style: const TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.w600,
//                   color: Color(0xFF1F1F1F),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildRecentApplicationItem(
//       String title, String company, String status, Color statusColor) {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 12),
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(16),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.05),
//             blurRadius: 8,
//             offset: const Offset(0, 4),
//           ),
//         ],
//       ),
//       child: Row(
//         children: [
//           Container(
//             width: 48,
//             height: 48,
//             decoration: BoxDecoration(
//               color: const Color(0xFF5A31F4).withOpacity(0.1),
//               borderRadius: BorderRadius.circular(12),
//             ),
//             child: const Icon(
//               Icons.work_outline,
//               color: Color(0xFF5A31F4),
//               size: 24,
//             ),
//           ),
//           const SizedBox(width: 16),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   title,
//                   style: const TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.w600,
//                     color: Color(0xFF1F1F1F),
//                   ),
//                 ),
//                 const SizedBox(height: 4),
//                 Text(
//                   company,
//                   style: const TextStyle(
//                     fontSize: 14,
//                     color: Color(0xFF6C6C6C),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Container(
//             padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//             decoration: BoxDecoration(
//               color: statusColor.withOpacity(0.1),
//               borderRadius: BorderRadius.circular(20),
//             ),
//             child: Text(
//               status,
//               style: TextStyle(
//                 fontSize: 12,
//                 fontWeight: FontWeight.w600,
//                 color: statusColor,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class ApplicationsScreen extends StatefulWidget {
//   const ApplicationsScreen({super.key});

//   @override
//   State<ApplicationsScreen> createState() => _ApplicationsScreenState();
// }

// class _ApplicationsScreenState extends State<ApplicationsScreen> {
//   String _selectedFilter = 'All';
//   String _selectedSort = 'Recent';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Applications'),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.search),
//             onPressed: () {},
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: DropdownButtonFormField<String>(
//                     value: _selectedFilter,
//                     items: const [
//                       DropdownMenuItem(
//                         value: 'All',
//                         child: Text('All'),
//                       ),
//                       DropdownMenuItem(
//                         value: 'Pending',
//                         child: Text('Pending'),
//                       ),
//                       DropdownMenuItem(
//                         value: 'Accepted',
//                         child: Text('Accepted'),
//                       ),
//                       DropdownMenuItem(
//                         value: 'Rejected',
//                         child: Text('Rejected'),
//                       ),
//                       DropdownMenuItem(
//                         value: 'Interview',
//                         child: Text('Interview'),
//                       ),
//                     ],
//                     onChanged: (value) {
//                       setState(() {
//                         _selectedFilter = value!;
//                       });
//                     },
//                     decoration: InputDecoration(
//                       contentPadding: const EdgeInsets.symmetric(
//                           horizontal: 16, vertical: 12),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12),
//                         borderSide: BorderSide.none,
//                       ),
//                       filled: true,
//                       fillColor: Colors.white,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(width: 12),
//                 Expanded(
//                   child: DropdownButtonFormField<String>(
//                     value: _selectedSort,
//                     items: const [
//                       DropdownMenuItem(
//                         value: 'Recent',
//                         child: Text('Recent'),
//                       ),
//                       DropdownMenuItem(
//                         value: 'Oldest',
//                         child: Text('Oldest'),
//                       ),
//                       DropdownMenuItem(
//                         value: 'Company',
//                         child: Text('Company'),
//                       ),
//                     ],
//                     onChanged: (value) {
//                       setState(() {
//                         _selectedSort = value!;
//                       });
//                     },
//                     decoration: InputDecoration(
//                       contentPadding: const EdgeInsets.symmetric(
//                           horizontal: 16, vertical: 12),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12),
//                         borderSide: BorderSide.none,
//                       ),
//                       filled: true,
//                       fillColor: Colors.white,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(height: 16),
//           Expanded(
//             child: ListView(
//               padding: const EdgeInsets.symmetric(horizontal: 16),
//               children: [
//                 _buildApplicationItem(
//                   'Product Designer',
//                   'Spotify',
//                   'Full-time',
//                   'Remote',
//                   'Pending',
//                   const Color(0xFFFFD700),
//                   'Tech',
//                   'May 12, 2023',
//                 ),
//                 _buildApplicationItem(
//                   'Marketing Intern',
//                   'Nike',
//                   'Internship',
//                   'Hybrid',
//                   'Interview',
//                   const Color(0xFF5A31F4),
//                   'Marketing',
//                   'May 10, 2023',
//                 ),
//                 _buildApplicationItem(
//                   'Backend Engineer',
//                   'Amazon',
//                   'Full-time',
//                   'Remote',
//                   'Rejected',
//                   const Color(0xFFFF4D4D),
//                   'Tech',
//                   'May 5, 2023',
//                 ),
//                 _buildApplicationItem(
//                   'UX Researcher',
//                   'Microsoft',
//                   'Full-time',
//                   'Hybrid',
//                   'Accepted',
//                   const Color(0xFF00C896),
//                   'Tech',
//                   'Apr 28, 2023',
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildApplicationItem(
//     String title,
//     String company,
//     String type,
//     String mode,
//     String status,
//     Color statusColor,
//     String tag,
//     String date,
//   ) {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 12),
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(16),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.05),
//             blurRadius: 8,
//             offset: const Offset(0, 4),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               Container(
//                 width: 40,
//                 height: 40,
//                 decoration: BoxDecoration(
//                   color: const Color(0xFF5A31F4).withOpacity(0.1),
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 child: const Icon(
//                   Icons.work_outline,
//                   color: Color(0xFF5A31F4),
//                   size: 20,
//                 ),
//               ),
//               const SizedBox(width: 12),
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       title,
//                       style: const TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w600,
//                         color: Color(0xFF1F1F1F),
//                       ),
//                     ),
//                     Text(
//                       company,
//                       style: const TextStyle(
//                         fontSize: 14,
//                         color: Color(0xFF6C6C6C),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//                 decoration: BoxDecoration(
//                   color: statusColor.withOpacity(0.1),
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//                 child: Text(
//                   status,
//                   style: TextStyle(
//                     fontSize: 12,
//                     fontWeight: FontWeight.w600,
//                     color: statusColor,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 12),
//           Row(
//             children: [
//               _buildDetailChip(type, Icons.work_outline),
//               const SizedBox(width: 8),
//               _buildDetailChip(mode, Icons.location_on_outlined),
//               const SizedBox(width: 8),
//               _buildDetailChip(tag, Icons.label_outlined),
//             ],
//           ),
//           const SizedBox(height: 12),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 date,
//                 style: const TextStyle(
//                   fontSize: 12,
//                   color: Color(0xFF6C6C6C),
//                 ),
//               ),
//               Row(
//                 children: [
//                   IconButton(
//                     icon: const Icon(Icons.edit_outlined, size: 20),
//                     onPressed: () {},
//                   ),
//                   IconButton(
//                     icon: const Icon(Icons.delete_outline, size: 20),
//                     onPressed: () {},
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildDetailChip(String text, IconData icon) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//       decoration: BoxDecoration(
//         color: const Color(0xFFF7F8FA),
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Icon(
//             icon,
//             size: 14,
//             color: const Color(0xFF6C6C6C),
//           ),
//           const SizedBox(width: 4),
//           Text(
//             text,
//             style: const TextStyle(
//               fontSize: 12,
//               color: Color(0xFF6C6C6C),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class AddApplicationScreen extends StatefulWidget {
//   const AddApplicationScreen({super.key});

//   @override
//   State<AddApplicationScreen> createState() => _AddApplicationScreenState();
// }

// class _AddApplicationScreenState extends State<AddApplicationScreen> {
//   String _jobType = 'Full-time';
//   String _workMode = 'Remote';
//   String _status = 'Pending';
//   String? _selectedTag;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Add Application'),
//         actions: [
//           TextButton(
//             onPressed: () {
             
//             },
//             child: const Text(
//               'Save',
//               style: TextStyle(
//                 color: Color(0xFF5A31F4),
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16),
//         child: Form(
//           child: Column(
//             children: [
//               TextFormField(
//                 decoration: InputDecoration(
//                   labelText: 'Job Title',
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter a job title';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 16),
//               TextFormField(
//                 decoration: InputDecoration(
//                   labelText: 'Company Name',
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter a company name';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 16),
//               DropdownButtonFormField<String>(
//                 value: _jobType,
//                 decoration: InputDecoration(
//                   labelText: 'Job Type',
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                 ),
//                 items: const [
//                   DropdownMenuItem(
//                     value: 'Full-time',
//                     child: Text('Full-time'),
//                   ),
//                   DropdownMenuItem(
//                     value: 'Part-time',
//                     child: Text('Part-time'),
//                   ),
//                   DropdownMenuItem(
//                     value: 'Internship',
//                     child: Text('Internship'),
//                   ),
//                   DropdownMenuItem(
//                     value: 'Freelance',
//                     child: Text('Freelance'),
//                   ),
//                 ],
//                 onChanged: (value) {
//                   setState(() {
//                     _jobType = value!;
//                   });
//                 },
//               ),
//               const SizedBox(height: 16),
//               DropdownButtonFormField<String>(
//                 value: _workMode,
//                 decoration: InputDecoration(
//                   labelText: 'Work Mode',
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                 ),
//                 items: const [
//                   DropdownMenuItem(
//                     value: 'On-site',
//                     child: Text('On-site'),
//                   ),
//                   DropdownMenuItem(
//                     value: 'Remote',
//                     child: Text('Remote'),
//                   ),
//                   DropdownMenuItem(
//                     value: 'Hybrid',
//                     child: Text('Hybrid'),
//                   ),
//                 ],
//                 onChanged: (value) {
//                   setState(() {
//                     _workMode = value!;
//                   });
//                 },
//               ),
//               const SizedBox(height: 16),
//               TextFormField(
//                 decoration: InputDecoration(
//                   labelText: 'Application Date',
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   suffixIcon: IconButton(
//                     icon: const Icon(Icons.calendar_today),
//                     onPressed: () {
//                       // Show date picker
//                     },
//                   ),
//                 ),
//                 readOnly: true,
//                 onTap: () {
//                   // Show date picker
//                 },
//               ),
//               const SizedBox(height: 16),
//               TextFormField(
//                 decoration: InputDecoration(
//                   labelText: 'Application Link',
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 16),
//               TextFormField(
//                 decoration: InputDecoration(
//                   labelText: 'Location (optional)',
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 16),
//               DropdownButtonFormField<String>(
//                 value: _status,
//                 decoration: InputDecoration(
//                   labelText: 'Current Status',
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                 ),
//                 items: const [
//                   DropdownMenuItem(
//                     value: 'Pending',
//                     child: Text('Pending'),
//                   ),
//                   DropdownMenuItem(
//                     value: 'Accepted',
//                     child: Text('Accepted'),
//                   ),
//                   DropdownMenuItem(
//                     value: 'Rejected',
//                     child: Text('Rejected'),
//                   ),
//                   DropdownMenuItem(
//                     value: 'Interview',
//                     child: Text('Interview Scheduled'),
//                   ),
//                 ],
//                 onChanged: (value) {
//                   setState(() {
//                     _status = value!;
//                   });
//                 },
//               ),
//               const SizedBox(height: 16),
//               DropdownButtonFormField<String>(
//                 value: _selectedTag,
//                 decoration: InputDecoration(
//                   labelText: 'Tag (optional)',
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                 ),
//                 items: const [
//                   DropdownMenuItem(
//                     value: 'Tech',
//                     child: Text('Tech'),
//                   ),
//                   DropdownMenuItem(
//                     value: 'Marketing',
//                     child: Text('Marketing'),
//                   ),
//                   DropdownMenuItem(
//                     value: 'Finance',
//                     child: Text('Finance'),
//                   ),
//                   DropdownMenuItem(
//                     value: 'Healthcare',
//                     child: Text('Healthcare'),
//                   ),
//                   DropdownMenuItem(
//                     value: 'Education',
//                     child: Text('Education'),
//                   ),
//                   DropdownMenuItem(
//                     value: 'NGO',
//                     child: Text('NGO'),
//                   ),
//                 ],
//                 onChanged: (value) {
//                   setState(() {
//                     _selectedTag = value;
//                   });
//                 },
//               ),
//               const SizedBox(height: 16),
//               TextFormField(
//                 decoration: InputDecoration(
//                   labelText: 'Notes (optional)',
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   alignLabelWithHint: true,
//                 ),
//                 maxLines: 3,
//               ),
//               const SizedBox(height: 16),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Text(
//                     'Upload CV (optional)',
//                     style: TextStyle(
//                       fontSize: 16,
//                       color: Color(0xFF6C6C6C),
//                     ),
//                   ),
//                   const SizedBox(height: 8),
//                   InkWell(
//                     onTap: () {
//                       // Handle file upload
//                     },
//                     child: Container(
//                       width: double.infinity,
//                       padding: const EdgeInsets.all(16),
//                       decoration: BoxDecoration(
//                         border: Border.all(
//                           color: const Color(0xFFE0E0E0),
//                           width: 1,
//                         ),
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       child: Row(
//                         children: [
//                           const Icon(
//                             Icons.attach_file,
//                             color: Color(0xFF6C6C6C),
//                           ),
//                           const SizedBox(width: 8),
//                           Text(
//                             'Choose file',
//                             style: TextStyle(
//                               color: Colors.grey[600],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 24),
//               SizedBox(
//                 width: double.infinity,
//                 child: ElevatedButton(
//                   onPressed: () {
                    
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: const Color(0xFF5A31F4),
//                     padding: const EdgeInsets.symmetric(vertical: 16),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                   ),
//                   child: const Text(
//                     'Save Application',
//                     style: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.w600,
//                       color: Colors.white,
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

// class NotificationsScreen extends StatelessWidget {
//   const NotificationsScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Reminders'),
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           children: [
//             _buildNotificationItem(
//               'Follow up with Google',
//               'Your application for UX Designer has been pending for 14 days',
//               'Today',
//               Icons.notifications_active,
//               const Color(0xFFFF8C42),
//             ),
//             _buildNotificationItem(
//               'Update status for Meta',
//               'Your interview was scheduled 3 days ago',
//               'Yesterday',
//               Icons.calendar_today,
//               const Color(0xFF5A31F4),
//             ),
//             _buildNotificationItem(
//               'Application deadline',
//               'Nike internship application closes tomorrow',
//               'May 10',
//               Icons.warning_amber,
//               const Color(0xFFFF4D4D),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildNotificationItem(
//     String title,
//     String message,
//     String time,
//     IconData icon,
//     Color iconColor,
//   ) {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 12),
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(16),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.05),
//             blurRadius: 8,
//             offset: const Offset(0, 4),
//           ),
//         ],
//       ),
//       child: Row(
//         children: [
//           Container(
//             padding: const EdgeInsets.all(12),
//             decoration: BoxDecoration(
//               color: iconColor.withOpacity(0.1),
//               borderRadius: BorderRadius.circular(12),
//             ),
//             child: Icon(
//               icon,
//               color: iconColor,
//               size: 24,
//             ),
//           ),
//           const SizedBox(width: 16),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   title,
//                   style: const TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.w600,
//                     color: Color(0xFF1F1F1F),
//                   ),
//                 ),
//                 const SizedBox(height: 4),
//                 Text(
//                   message,
//                   style: const TextStyle(
//                     fontSize: 14,
//                     color: Color(0xFF6C6C6C),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Text(
//             time,
//             style: const TextStyle(
//               fontSize: 12,
//               color: Color(0xFF6C6C6C),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class ProfileScreen extends StatelessWidget {
//   const ProfileScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Profile'),
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           children: [
//             Center(
//               child: Column(
//                 children: [
//                   Container(
//                     width: 100,
//                     height: 100,
//                     decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       color: const Color(0xFF5A31F4).withOpacity(0.1),
//                     ),
//                     child: const Icon(
//                       Icons.person,
//                       size: 48,
//                       color: Color(0xFF5A31F4),
//                     ),
//                   ),
//                   const SizedBox(height: 16),
//                   const Text(
//                     'John Doe',
//                     style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.w600,
//                       color: Color(0xFF1F1F1F),
//                     ),
//                   ),
//                   const SizedBox(height: 4),
//                   const Text(
//                     'john.doe@example.com',
//                     style: TextStyle(
//                       fontSize: 14,
//                       color: Color(0xFF6C6C6C),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 32),
//             _buildProfileOption(
//               'Edit Profile',
//               Icons.edit_outlined,
//               () {},
//             ),
//             _buildProfileOption(
//               'Settings',
//               Icons.settings_outlined,
//               () {},
//             ),
//             _buildProfileOption(
//               'Help & Support',
//               Icons.help_outline,
//               () {},
//             ),
//             _buildProfileOption(
//               'About Career Tracker',
//               Icons.info_outline,
//               () {},
//             ),
//             const SizedBox(height: 24),
//             SizedBox(
//               width: double.infinity,
//               child: OutlinedButton(
//                 onPressed: () {
//                   // Logout
//                 },
//                 style: OutlinedButton.styleFrom(
//                   padding: const EdgeInsets.symmetric(vertical: 16),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   side: const BorderSide(
//                     color: Color(0xFFFF4D4D),
//                   ),
//                 ),
//                 child: const Text(
//                   'Logout',
//                   style: TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.w600,
//                     color: Color(0xFFFF4D4D),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildProfileOption(String title, IconData icon, VoidCallback onTap) {
//     return InkWell(
//       onTap: onTap,
//       child: Container(
//         padding: const EdgeInsets.symmetric(vertical: 16),
//         decoration: const BoxDecoration(
//           border: Border(
//             bottom: BorderSide(
//               color: Color(0xFFF0F0F0),
//               width: 1,
//             ),
//           ),
//         ),
//         child: Row(
//           children: [
//             Icon(
//               icon,
//               color: const Color(0xFF6C6C6C),
//             ),
//             const SizedBox(width: 16),
//             Text(
//               title,
//               style: const TextStyle(
//                 fontSize: 16,
//                 color: Color(0xFF1F1F1F),
//               ),
//             ),
//             const Spacer(),
//             const Icon(
//               Icons.chevron_right,
//               color: Color(0xFF6C6C6C),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // class ApplicationDetailScreen extends StatelessWidget {
// //   final String title;