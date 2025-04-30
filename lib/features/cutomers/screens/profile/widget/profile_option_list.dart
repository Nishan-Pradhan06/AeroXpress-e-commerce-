import '../../../../../path/path.dart';

Widget buildProfileOption(
  String title,
  IconData icon, {
  bool showDivider = false,
  Function()? onTap,
}) {
  return Material(
    child: Column(
      children: [
        ListTile(
          leading: Icon(icon, size: 18),
          title: Text(title),
          trailing: Icon(LucideIcons.chevronRight),
          onTap: onTap,
        ),
        if (showDivider) Divider(height: 1),
      ],
    ),
  );
}
