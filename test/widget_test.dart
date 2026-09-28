import 'package:flutter_test/flutter_test.dart';
import 'package:profile_app/main.dart';

void main() {
  testWidgets('ProfileApp loads and renders profile information', (WidgetTester tester) async {
    await tester.pumpWidget(const ProfileApp());

    // Verify key texts are present
    expect(find.text('Profile'), findsOneWidget);
    expect(find.text('Gia Sinh'), findsOneWidget);
    expect(find.text('Lead Mobile Engineer'), findsOneWidget);
    expect(find.text('TP.HCM, VietNam'), findsOneWidget);
    expect(find.text('148'), findsOneWidget);
    expect(find.text('Projects'), findsOneWidget);
    expect(find.text('9 Yrs'), findsOneWidget);
    expect(find.text('Experience'), findsOneWidget);
    expect(find.text('4.9'), findsOneWidget);
    expect(find.text('Rating'), findsOneWidget);
    expect(find.text('About Me'), findsOneWidget);
    expect(find.text('Skills & Expertise'), findsOneWidget);
    expect(find.text('Featured Projects'), findsOneWidget);
    expect(find.text('E-Shop Flutter'), findsOneWidget);
    expect(find.text('Crypto Vault'), findsOneWidget);
    expect(find.text('Contact Information'), findsOneWidget);
    expect(find.text('huy118108@gmail.com'), findsOneWidget);
    expect(find.text('0962193817'), findsOneWidget);
  });
}
