// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stories_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$storiesModelHash() => r'6a60ccfbcb828be92042d0c8d26d2a8603709363';

/// See also [storiesModel].
@ProviderFor(storiesModel)
final storiesModelProvider = AutoDisposeProvider<StoriesModel>.internal(
  storiesModel,
  name: r'storiesModelProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$storiesModelHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef StoriesModelRef = AutoDisposeProviderRef<StoriesModel>;
String _$getListHash() => r'f028e7fdda060170b947b858bb951ed8403b294c';

/// See also [getList].
@ProviderFor(getList)
final getListProvider = AutoDisposeFutureProvider<List<StoriesData>>.internal(
  getList,
  name: r'getListProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetListRef = AutoDisposeFutureProviderRef<List<StoriesData>>;
String _$getOldListHash() => r'94f1e8532959acfcc136313c7ae94d973f5fcf5d';

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

/// See also [getOldList].
@ProviderFor(getOldList)
const getOldListProvider = GetOldListFamily();

/// See also [getOldList].
class GetOldListFamily extends Family<AsyncValue<List<StoriesData>>> {
  /// See also [getOldList].
  const GetOldListFamily();

  /// See also [getOldList].
  GetOldListProvider call(
    DateTime date,
  ) {
    return GetOldListProvider(
      date,
    );
  }

  @override
  GetOldListProvider getProviderOverride(
    covariant GetOldListProvider provider,
  ) {
    return call(
      provider.date,
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
  String? get name => r'getOldListProvider';
}

/// See also [getOldList].
class GetOldListProvider extends AutoDisposeFutureProvider<List<StoriesData>> {
  /// See also [getOldList].
  GetOldListProvider(
    DateTime date,
  ) : this._internal(
          (ref) => getOldList(
            ref as GetOldListRef,
            date,
          ),
          from: getOldListProvider,
          name: r'getOldListProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getOldListHash,
          dependencies: GetOldListFamily._dependencies,
          allTransitiveDependencies:
              GetOldListFamily._allTransitiveDependencies,
          date: date,
        );

  GetOldListProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.date,
  }) : super.internal();

  final DateTime date;

  @override
  Override overrideWith(
    FutureOr<List<StoriesData>> Function(GetOldListRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetOldListProvider._internal(
        (ref) => create(ref as GetOldListRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        date: date,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<StoriesData>> createElement() {
    return _GetOldListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetOldListProvider && other.date == date;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, date.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GetOldListRef on AutoDisposeFutureProviderRef<List<StoriesData>> {
  /// The parameter `date` of this provider.
  DateTime get date;
}

class _GetOldListProviderElement
    extends AutoDisposeFutureProviderElement<List<StoriesData>>
    with GetOldListRef {
  _GetOldListProviderElement(super.provider);

  @override
  DateTime get date => (origin as GetOldListProvider).date;
}

String _$getCommentsInfoHash() => r'997cdc8814905dc83c32033ae028ec47157b6732';

/// See also [getCommentsInfo].
@ProviderFor(getCommentsInfo)
const getCommentsInfoProvider = GetCommentsInfoFamily();

/// See also [getCommentsInfo].
class GetCommentsInfoFamily extends Family<AsyncValue<CommentInfoData>> {
  /// See also [getCommentsInfo].
  const GetCommentsInfoFamily();

  /// See also [getCommentsInfo].
  GetCommentsInfoProvider call(
    int id,
  ) {
    return GetCommentsInfoProvider(
      id,
    );
  }

  @override
  GetCommentsInfoProvider getProviderOverride(
    covariant GetCommentsInfoProvider provider,
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
  String? get name => r'getCommentsInfoProvider';
}

/// See also [getCommentsInfo].
class GetCommentsInfoProvider
    extends AutoDisposeFutureProvider<CommentInfoData> {
  /// See also [getCommentsInfo].
  GetCommentsInfoProvider(
    int id,
  ) : this._internal(
          (ref) => getCommentsInfo(
            ref as GetCommentsInfoRef,
            id,
          ),
          from: getCommentsInfoProvider,
          name: r'getCommentsInfoProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getCommentsInfoHash,
          dependencies: GetCommentsInfoFamily._dependencies,
          allTransitiveDependencies:
              GetCommentsInfoFamily._allTransitiveDependencies,
          id: id,
        );

  GetCommentsInfoProvider._internal(
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
    FutureOr<CommentInfoData> Function(GetCommentsInfoRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetCommentsInfoProvider._internal(
        (ref) => create(ref as GetCommentsInfoRef),
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
  AutoDisposeFutureProviderElement<CommentInfoData> createElement() {
    return _GetCommentsInfoProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetCommentsInfoProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GetCommentsInfoRef on AutoDisposeFutureProviderRef<CommentInfoData> {
  /// The parameter `id` of this provider.
  int get id;
}

class _GetCommentsInfoProviderElement
    extends AutoDisposeFutureProviderElement<CommentInfoData>
    with GetCommentsInfoRef {
  _GetCommentsInfoProviderElement(super.provider);

  @override
  int get id => (origin as GetCommentsInfoProvider).id;
}

String _$getCommentsHash() => r'c8fad5d5cbd9f66881df8f3daece129d099a46c5';

/// See also [getComments].
@ProviderFor(getComments)
const getCommentsProvider = GetCommentsFamily();

/// See also [getComments].
class GetCommentsFamily extends Family<AsyncValue<List<CommentsData>>> {
  /// See also [getComments].
  const GetCommentsFamily();

  /// See also [getComments].
  GetCommentsProvider call(
    String id,
    bool isShort,
  ) {
    return GetCommentsProvider(
      id,
      isShort,
    );
  }

  @override
  GetCommentsProvider getProviderOverride(
    covariant GetCommentsProvider provider,
  ) {
    return call(
      provider.id,
      provider.isShort,
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
  String? get name => r'getCommentsProvider';
}

/// See also [getComments].
class GetCommentsProvider
    extends AutoDisposeFutureProvider<List<CommentsData>> {
  /// See also [getComments].
  GetCommentsProvider(
    String id,
    bool isShort,
  ) : this._internal(
          (ref) => getComments(
            ref as GetCommentsRef,
            id,
            isShort,
          ),
          from: getCommentsProvider,
          name: r'getCommentsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getCommentsHash,
          dependencies: GetCommentsFamily._dependencies,
          allTransitiveDependencies:
              GetCommentsFamily._allTransitiveDependencies,
          id: id,
          isShort: isShort,
        );

  GetCommentsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
    required this.isShort,
  }) : super.internal();

  final String id;
  final bool isShort;

  @override
  Override overrideWith(
    FutureOr<List<CommentsData>> Function(GetCommentsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetCommentsProvider._internal(
        (ref) => create(ref as GetCommentsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
        isShort: isShort,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<CommentsData>> createElement() {
    return _GetCommentsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetCommentsProvider &&
        other.id == id &&
        other.isShort == isShort;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);
    hash = _SystemHash.combine(hash, isShort.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GetCommentsRef on AutoDisposeFutureProviderRef<List<CommentsData>> {
  /// The parameter `id` of this provider.
  String get id;

  /// The parameter `isShort` of this provider.
  bool get isShort;
}

class _GetCommentsProviderElement
    extends AutoDisposeFutureProviderElement<List<CommentsData>>
    with GetCommentsRef {
  _GetCommentsProviderElement(super.provider);

  @override
  String get id => (origin as GetCommentsProvider).id;
  @override
  bool get isShort => (origin as GetCommentsProvider).isShort;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
