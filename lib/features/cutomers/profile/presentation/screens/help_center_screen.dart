import '../../../../../path/path.dart';

class HelpCenterScreen extends StatelessWidget {
  const HelpCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Help Center'),
          bottom: TabBar(tabs: [Tab(text: 'FAQs'), Tab(text: 'Contact Us')]),
        ),
        body: TabBarView(
          children: [
            Center(child: Text('Frequently Asked Questions')),
            Center(child: Text('Contact Information')),
          ],
        ),
      ),
    );
  }
}
