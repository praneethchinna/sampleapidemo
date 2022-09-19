import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

TestApplicationLocator locator() => TestApplicationLocator();

Logger logger() => TestApplicationLocator().logger;

class TestApplicationLocator implements Locator {
  TestApplicationLocator._();

  factory TestApplicationLocator() {
    Locator.init(TestApplicationLocator._());
    return Locator.getInstance();
  }

  @override
  Connectivity connectivity = AlwaysOnlineConnectivity();

  @override
  Logger logger = ConsoleLogger(LogLevel.debug);
  SimpleRestApi api = SimpleRestApi();

  Repository repository = Repository();

  void dispose() => Locator.dispose();
}
