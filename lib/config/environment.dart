enum AppEnv { dev, prod, local }

abstract class Environment {
  String name;
  String baseUrl;
  String resourceUrl;

  Environment(
      {required this.baseUrl, required this.resourceUrl, required this.name});

  factory Environment.fromEnv(AppEnv appEnv) {
    if (appEnv == AppEnv.local) {
      return LocalEnvironment();
    } else if (appEnv == AppEnv.dev) {
      return DevEnvironment();
    } else {
      return ProdEnvironment();
    }
  }

  Future<void> map({
    required Future<void> Function() prod,
    required Future<void> Function() dev,
  }) async {
    if (this is ProdEnvironment) {
      await prod();
    } else if (this is DevEnvironment) {
      await dev();
    }
  }
}

/// ================= Local =======================

class LocalEnvironment extends Environment {
  LocalEnvironment()
      : super(
          name: 'Local',
          baseUrl: '',
          resourceUrl: 'h',
        );
}

/// ================= Development =======================

class DevEnvironment extends Environment {
  DevEnvironment()
      : super(
          name: 'Dev',
          baseUrl: 'https://randomuser.me/api',
          resourceUrl: 'https://randomuser.me/api',
        );
}

/// ================= Production =======================

class ProdEnvironment extends Environment {
  ProdEnvironment()
      : super(
          name: 'Prod',
          baseUrl: '',
          resourceUrl: '',
        );
}
