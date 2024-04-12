// プラットフォームごとに実装クラスが異なるため

export 'ConnectionOpenerUnknownImpl.dart'
  if (dart.library.ffi) 'ConnectionOpenerAndroidImpl.dart'
  if (dart.library.html) 'ConnectionOpenerWebImpl.dart';