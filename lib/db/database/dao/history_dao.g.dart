// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_dao.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$findAllSubjectsHistoryHash() =>
    r'613393c51d51c914745c26e122a4844cd886d7e4';

/// See also [findAllSubjectsHistory].
@ProviderFor(findAllSubjectsHistory)
final findAllSubjectsHistoryProvider =
    AutoDisposeFutureProvider<List<Stars>>.internal(
  findAllSubjectsHistory,
  name: r'findAllSubjectsHistoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$findAllSubjectsHistoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FindAllSubjectsHistoryRef = AutoDisposeFutureProviderRef<List<Stars>>;
String _$deleteAllSubjectsHistoryHash() =>
    r'960b7d937ba7e5af5ef7487d552fe56119abdd7b';

/// See also [deleteAllSubjectsHistory].
@ProviderFor(deleteAllSubjectsHistory)
final deleteAllSubjectsHistoryProvider =
    AutoDisposeFutureProvider<void>.internal(
  deleteAllSubjectsHistory,
  name: r'deleteAllSubjectsHistoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$deleteAllSubjectsHistoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef DeleteAllSubjectsHistoryRef = AutoDisposeFutureProviderRef<void>;
String _$insertSubjectsHistoryHash() =>
    r'8114ce418db59b5b94c9b32443a10cc05a91a183';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [insertSubjectsHistory].
@ProviderFor(insertSubjectsHistory)
const insertSubjectsHistoryProvider = InsertSubjectsHistoryFamily();

/// See also [insertSubjectsHistory].
class InsertSubjectsHistoryFamily extends Family<AsyncValue<void>> {
  /// See also [insertSubjectsHistory].
  const InsertSubjectsHistoryFamily();

  /// See also [insertSubjectsHistory].
  InsertSubjectsHistoryProvider call(
    History history,
  ) {
    return InsertSubjectsHistoryProvider(
      history,
    );
  }

  @override
  InsertSubjectsHistoryProvider getProviderOverride(
    covariant InsertSubjectsHistoryProvider provider,
  ) {
    return call(
      provider.history,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'insertSubjectsHistoryProvider';
}

/// See also [insertSubjectsHistory].
class InsertSubjectsHistoryProvider extends AutoDisposeFutureProvider<void> {
  /// See also [insertSubjectsHistory].
  InsertSubjectsHistoryProvider(
    History history,
  ) : this._internal(
          (ref) => insertSubjectsHistory(
            ref as InsertSubjectsHistoryRef,
            history,
          ),
          from: insertSubjectsHistoryProvider,
          name: r'insertSubjectsHistoryProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$insertSubjectsHistoryHash,
          dependencies: InsertSubjectsHistoryFamily._dependencies,
          allTransitiveDependencies:
              InsertSubjectsHistoryFamily._allTransitiveDependencies,
          history: history,
        );

  InsertSubjectsHistoryProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.history,
  }) : super.internal();

  final History history;

  @override
  Override overrideWith(
    FutureOr<void> Function(InsertSubjectsHistoryRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: InsertSubjectsHistoryProvider._internal(
        (ref) => create(ref as InsertSubjectsHistoryRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        history: history,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _InsertSubjectsHistoryProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is InsertSubjectsHistoryProvider && other.history == history;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, history.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin InsertSubjectsHistoryRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `history` of this provider.
  History get history;
}

class _InsertSubjectsHistoryProviderElement
    extends AutoDisposeFutureProviderElement<void>
    with InsertSubjectsHistoryRef {
  _InsertSubjectsHistoryProviderElement(super.provider);

  @override
  History get history => (origin as InsertSubjectsHistoryProvider).history;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
