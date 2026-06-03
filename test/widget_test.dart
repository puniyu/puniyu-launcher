import 'package:flutter_test/flutter_test.dart';
import 'package:puniyu_launcher/app.dart';

void main() {
  testWidgets('HomePage renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(const App());

    // 验证品牌标题
    expect(find.text('Puniyu'), findsOneWidget);
    expect(find.text('游戏启动与管理平台'), findsOneWidget);

    // 验证功能区域
    expect(find.text('快速启动'), findsOneWidget);
    expect(find.text('游戏库'), findsOneWidget);
    expect(find.text('系统设置'), findsOneWidget);

    // 验证系统状态区域
    expect(find.text('系统状态'), findsOneWidget);
    expect(find.text('运行状态'), findsOneWidget);
    expect(find.text('正常'), findsOneWidget);

    // 验证版本信息
    expect(find.text('Puniyu Launcher v1.0.0'), findsOneWidget);
  });
}
