import 'package:firebase_core/firebase_core.dart';
import '../firebase/firebase_options_prod.dart' as prod;
import '../firebase/firebase_options_stg.dart' as stg;

enum Flavor {
  dev('dev'),
  stg('stg'),
  prod('prod'),
  unknown('');

  const Flavor(this.rawValue);

  factory Flavor.from({required String value}) {
    if (value.isEmpty) {
      return Flavor.unknown;
    }

    return Flavor.values.firstWhere(
      (flavor) => flavor.rawValue == value,
      orElse: () => Flavor.unknown,
    );
  }

  final String rawValue;
}

class FirebaseConfig {
  /// 環境の設定
  static String get currentFlavor {
    return const String.fromEnvironment('FLAVOR');
  }

  /// 開発環境かどうか
  static bool get isDev => currentFlavor == Flavor.dev.rawValue;

  /// stg環境かどうか
  static bool get isStg => currentFlavor == Flavor.stg.rawValue;

  /// 本番環境かどうか
  static bool get isProd => currentFlavor == Flavor.prod.rawValue;

  /// 環境に応じたFirebaesOptionの取得
  static FirebaseOptions get currentPlatform {
    switch (currentFlavor) {
      case 'prod':
        return prod.DefaultFirebaseOptions.currentPlatform;
      case 'stg':
      case 'dev':
      default:
        return stg.DefaultFirebaseOptions.currentPlatform;
    }
  }

  /// 環境情報表示用
  static String get environmentName => Flavor.from(value: currentFlavor).name;
}
