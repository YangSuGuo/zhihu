// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stars_dao.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$findAllSubjectsStarsHash() =>
    r'db9a7f0862e8392033038ba7ab864a819aa876fe';

/// See also [findAllSubjectsStars].
@ProviderFor(findAllSubjectsStars)
final findAllSubjectsStarsProvider =
    AutoDisposeFutureProvider<List<Stars>>.internal(
  findAllSubjectsStars,
  name: r'findAllSubjectsStarsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$findAllSubjectsStarsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FindAllSubjectsStarsRef = AutoDisposeFutureProviderRef<List<Stars>>;
String _$deleteStarsHash() => r'dba875bf53cd6f7dd793b8286dffd7e7afd68766';

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

/// See also [deleteStars].
@ProviderFor(deleteStars)
const deleteStarsProvider = DeleteStarsFamily();

/// See also [deleteStars].
class DeleteStarsFamily extends Family<AsyncValue<void>> {
  /// See also [deleteStars].
  const DeleteStarsFamily();

  /// See also [deleteStars].
  DeleteStarsProvider call(
    int id,
  ) {
    return DeleteStarsProvider(
      id,
    );
  }

  @override
  DeleteStarsProvider getProviderOverride(
    covariant DeleteStarsProvider provider,
  ) {
    return call(
      provider.id,
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
  String? get name => r'deleteStarsProvider';
}

/// See also [deleteStars].
class DeleteStarsProvider extends AutoDisposeFutureProvider<void> {
  /// See also [deleteStars].
  DeleteStarsProvider(
    int id,
  ) : this._internal(
          (ref) => deleteStars(
            ref as DeleteStarsRef,
            id,
          ),
          from: deleteStarsProvider,
          name: r'deleteStarsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$deleteStarsHash,
          dependencies: DeleteStarsFamily._dependencies,
          allTransitiveDependencies:
              DeleteStarsFamily._allTransitiveDependencies,
          id: id,
        );

  DeleteStarsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  Override overrideWith(
    FutureOr<void> Function(DeleteStarsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DeleteStarsProvider._internal(
        (ref) => create(ref as DeleteStarsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _DeleteStarsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DeleteStarsProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin DeleteStarsRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `id` of this provider.
  int get id;
}

class _DeleteStarsProviderElement extends AutoDisposeFutureProviderElement<void>
    with DeleteStarsRef {
  _DeleteStarsProviderElement(super.provider);

  @override
  int get id => (origin as DeleteStarsProvider).id;
}

String _$insertStarsHash() => r'f6da92fb297a5d209cf92a78a10839535640954b';

/// See also [insertStars].
@ProviderFor(insertStars)
const insertStarsProvider = InsertStarsFamily();

/// See also [insertStars].
class InsertStarsFamily extends Family<AsyncValue<void>> {
  /// See also [insertStars].
  const InsertStarsFamily();

  /// See also [insertStars].
  InsertStarsProvider call(
    Stars stars,
  ) {
    return InsertStarsProvider(
      stars,
    );
  }

  @override
  InsertStarsProvider getProviderOverride(
    covariant InsertStarsProvider provider,
  ) {
    return call(
      provider.stars,
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
  String? get name => r'insertStarsProvider';
}

/// See also [insertStars].
class InsertStarsProvider extends AutoDisposeFutureProvider<void> {
  /// See also [insertStars].
  InsertStarsProvider(
    Stars stars,
  ) : this._internal(
          (ref) => insertStars(
            ref as InsertStarsRef,
            stars,
          ),
          from: insertStarsProvider,
          name: r'insertStarsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$insertStarsHash,
          dependencies: InsertStarsFamily._dependencies,
          allTransitiveDependencies:
              InsertStarsFamily._allTransitiveDependencies,
          stars: stars,
        );

  InsertStarsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.stars,
  }) : super.internal();

  final Stars stars;

  @override
  Override overrideWith(
    FutureOr<void> Function(InsertStarsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: InsertStarsProvider._internal(
        (ref) => create(ref as InsertStarsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        stars: stars,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _InsertStarsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is InsertStarsProvider && other.stars == stars;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, stars.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin InsertStarsRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `stars` of this provider.
  Stars get stars;
}

class _InsertStarsProviderElement extends AutoDisposeFutureProviderElement<void>
    with InsertStarsRef {
  _InsertStarsProviderElement(super.provider);

  @override
  Stars get stars => (origin as InsertStarsProvider).stars;
}

String _$isSavedHash() => r'8d965c7c2b704b9fb48b11bc1be361318fe98380';

/// See also [isSaved].
@ProviderFor(isSaved)
const isSavedProvider = IsSavedFamily();

/// See also [isSaved].
class IsSavedFamily extends Family<AsyncValue<bool>> {
  /// See also [isSaved].
  const IsSavedFamily();

  /// See also [isSaved].
  IsSavedProvider call(
    int id,
  ) {
    return IsSavedProvider(
      id,
    );
  }

  @override
  IsSavedProvider getProviderOverride(
    covariant IsSavedProvider provider,
  ) {
    return call(
      provider.id,
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
  String? get name => r'isSavedProvider';
}

/// See also [isSaved].
class IsSavedProvider extends AutoDisposeFutureProvider<bool> {
  /// See also [isSaved].
  IsSavedProvider(
    int id,
  ) : this._internal(
          (ref) => isSaved(
            ref as IsSavedRef,
            id,
          ),
          from: isSavedProvider,
          name: r'isSavedProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$isSavedHash,
          dependencies: IsSavedFamily._dependencies,
          allTransitiveDependencies: IsSavedFamily._allTransitiveDependencies,
          id: id,
        );

  IsSavedProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  Override overrideWith(
    FutureOr<bool> Function(IsSavedRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: IsSavedProvider._internal(
        (ref) => create(ref as IsSavedRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<bool> createElement() {
    return _IsSavedProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is IsSavedProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin IsSavedRef on AutoDisposeFutureProviderRef<bool> {
  /// The parameter `id` of this provider.
  int get id;
}

class _IsSavedProviderElement extends AutoDisposeFutureProviderElement<bool>
    with IsSavedRef {
  _IsSavedProviderElement(super.provider);

  @override
  int get id => (origin as IsSavedProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
