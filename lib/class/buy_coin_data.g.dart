// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'buy_coin_data.dart';

// **************************************************************************
// _IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, invalid_use_of_protected_member, lines_longer_than_80_chars, constant_identifier_names, avoid_js_rounded_ints, no_leading_underscores_for_local_identifiers, require_trailing_commas, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_in_if_null_operators, library_private_types_in_public_api, prefer_const_constructors
// ignore_for_file: type=lint

extension GetBuyCoinDataCollection on Isar {
  IsarCollection<int, BuyCoinData> get buyCoinDatas => this.collection();
}

const BuyCoinDataSchema = IsarGeneratedSchema(
  schema: IsarSchema(
    name: 'BuyCoinData',
    idName: 'id',
    embedded: false,
    properties: [
      IsarPropertySchema(
        name: 'walletID',
        type: IsarType.string,
      ),
      IsarPropertySchema(
        name: 'coinId',
        type: IsarType.string,
      ),
      IsarPropertySchema(
        name: 'coinName',
        type: IsarType.string,
      ),
      IsarPropertySchema(
        name: 'price',
        type: IsarType.double,
      ),
      IsarPropertySchema(
        name: 'timestamp',
        type: IsarType.dateTime,
      ),
    ],
    indexes: [],
  ),
  converter: IsarObjectConverter<int, BuyCoinData>(
    serialize: serializeBuyCoinData,
    deserialize: deserializeBuyCoinData,
    deserializeProperty: deserializeBuyCoinDataProp,
  ),
  embeddedSchemas: [],
);

@isarProtected
int serializeBuyCoinData(IsarWriter writer, BuyCoinData object) {
  IsarCore.writeString(writer, 1, object.walletID);
  {
    final value = object.coinId;
    if (value == null) {
      IsarCore.writeNull(writer, 2);
    } else {
      IsarCore.writeString(writer, 2, value);
    }
  }
  {
    final value = object.coinName;
    if (value == null) {
      IsarCore.writeNull(writer, 3);
    } else {
      IsarCore.writeString(writer, 3, value);
    }
  }
  IsarCore.writeDouble(writer, 4, object.price ?? double.nan);
  IsarCore.writeLong(writer, 5,
      object.timestamp?.toUtc().microsecondsSinceEpoch ?? -9223372036854775808);
  return object.id;
}

@isarProtected
BuyCoinData deserializeBuyCoinData(IsarReader reader) {
  final int _id;
  _id = IsarCore.readId(reader);
  final String _walletID;
  _walletID = IsarCore.readString(reader, 1) ?? '';
  final String? _coinId;
  _coinId = IsarCore.readString(reader, 2);
  final String? _coinName;
  _coinName = IsarCore.readString(reader, 3);
  final double? _price;
  {
    final value = IsarCore.readDouble(reader, 4);
    if (value.isNaN) {
      _price = null;
    } else {
      _price = value;
    }
  }
  final DateTime? _timestamp;
  {
    final value = IsarCore.readLong(reader, 5);
    if (value == -9223372036854775808) {
      _timestamp = null;
    } else {
      _timestamp =
          DateTime.fromMicrosecondsSinceEpoch(value, isUtc: true).toLocal();
    }
  }
  final object = BuyCoinData(
    id: _id,
    walletID: _walletID,
    coinId: _coinId,
    coinName: _coinName,
    price: _price,
    timestamp: _timestamp,
  );
  return object;
}

@isarProtected
dynamic deserializeBuyCoinDataProp(IsarReader reader, int property) {
  switch (property) {
    case 0:
      return IsarCore.readId(reader);
    case 1:
      return IsarCore.readString(reader, 1) ?? '';
    case 2:
      return IsarCore.readString(reader, 2);
    case 3:
      return IsarCore.readString(reader, 3);
    case 4:
      {
        final value = IsarCore.readDouble(reader, 4);
        if (value.isNaN) {
          return null;
        } else {
          return value;
        }
      }
    case 5:
      {
        final value = IsarCore.readLong(reader, 5);
        if (value == -9223372036854775808) {
          return null;
        } else {
          return DateTime.fromMicrosecondsSinceEpoch(value, isUtc: true)
              .toLocal();
        }
      }
    default:
      throw ArgumentError('Unknown property: $property');
  }
}

sealed class _BuyCoinDataUpdate {
  bool call({
    required int id,
    String? walletID,
    String? coinId,
    String? coinName,
    double? price,
    DateTime? timestamp,
  });
}

class _BuyCoinDataUpdateImpl implements _BuyCoinDataUpdate {
  const _BuyCoinDataUpdateImpl(this.collection);

  final IsarCollection<int, BuyCoinData> collection;

  @override
  bool call({
    required int id,
    Object? walletID = ignore,
    Object? coinId = ignore,
    Object? coinName = ignore,
    Object? price = ignore,
    Object? timestamp = ignore,
  }) {
    return collection.updateProperties([
          id
        ], {
          if (walletID != ignore) 1: walletID as String?,
          if (coinId != ignore) 2: coinId as String?,
          if (coinName != ignore) 3: coinName as String?,
          if (price != ignore) 4: price as double?,
          if (timestamp != ignore) 5: timestamp as DateTime?,
        }) >
        0;
  }
}

sealed class _BuyCoinDataUpdateAll {
  int call({
    required List<int> id,
    String? walletID,
    String? coinId,
    String? coinName,
    double? price,
    DateTime? timestamp,
  });
}

class _BuyCoinDataUpdateAllImpl implements _BuyCoinDataUpdateAll {
  const _BuyCoinDataUpdateAllImpl(this.collection);

  final IsarCollection<int, BuyCoinData> collection;

  @override
  int call({
    required List<int> id,
    Object? walletID = ignore,
    Object? coinId = ignore,
    Object? coinName = ignore,
    Object? price = ignore,
    Object? timestamp = ignore,
  }) {
    return collection.updateProperties(id, {
      if (walletID != ignore) 1: walletID as String?,
      if (coinId != ignore) 2: coinId as String?,
      if (coinName != ignore) 3: coinName as String?,
      if (price != ignore) 4: price as double?,
      if (timestamp != ignore) 5: timestamp as DateTime?,
    });
  }
}

extension BuyCoinDataUpdate on IsarCollection<int, BuyCoinData> {
  _BuyCoinDataUpdate get update => _BuyCoinDataUpdateImpl(this);

  _BuyCoinDataUpdateAll get updateAll => _BuyCoinDataUpdateAllImpl(this);
}

sealed class _BuyCoinDataQueryUpdate {
  int call({
    String? walletID,
    String? coinId,
    String? coinName,
    double? price,
    DateTime? timestamp,
  });
}

class _BuyCoinDataQueryUpdateImpl implements _BuyCoinDataQueryUpdate {
  const _BuyCoinDataQueryUpdateImpl(this.query, {this.limit});

  final IsarQuery<BuyCoinData> query;
  final int? limit;

  @override
  int call({
    Object? walletID = ignore,
    Object? coinId = ignore,
    Object? coinName = ignore,
    Object? price = ignore,
    Object? timestamp = ignore,
  }) {
    return query.updateProperties(limit: limit, {
      if (walletID != ignore) 1: walletID as String?,
      if (coinId != ignore) 2: coinId as String?,
      if (coinName != ignore) 3: coinName as String?,
      if (price != ignore) 4: price as double?,
      if (timestamp != ignore) 5: timestamp as DateTime?,
    });
  }
}

extension BuyCoinDataQueryUpdate on IsarQuery<BuyCoinData> {
  _BuyCoinDataQueryUpdate get updateFirst =>
      _BuyCoinDataQueryUpdateImpl(this, limit: 1);

  _BuyCoinDataQueryUpdate get updateAll => _BuyCoinDataQueryUpdateImpl(this);
}

class _BuyCoinDataQueryBuilderUpdateImpl implements _BuyCoinDataQueryUpdate {
  const _BuyCoinDataQueryBuilderUpdateImpl(this.query, {this.limit});

  final QueryBuilder<BuyCoinData, BuyCoinData, QOperations> query;
  final int? limit;

  @override
  int call({
    Object? walletID = ignore,
    Object? coinId = ignore,
    Object? coinName = ignore,
    Object? price = ignore,
    Object? timestamp = ignore,
  }) {
    final q = query.build();
    try {
      return q.updateProperties(limit: limit, {
        if (walletID != ignore) 1: walletID as String?,
        if (coinId != ignore) 2: coinId as String?,
        if (coinName != ignore) 3: coinName as String?,
        if (price != ignore) 4: price as double?,
        if (timestamp != ignore) 5: timestamp as DateTime?,
      });
    } finally {
      q.close();
    }
  }
}

extension BuyCoinDataQueryBuilderUpdate
    on QueryBuilder<BuyCoinData, BuyCoinData, QOperations> {
  _BuyCoinDataQueryUpdate get updateFirst =>
      _BuyCoinDataQueryBuilderUpdateImpl(this, limit: 1);

  _BuyCoinDataQueryUpdate get updateAll =>
      _BuyCoinDataQueryBuilderUpdateImpl(this);
}

extension BuyCoinDataQueryFilter
    on QueryBuilder<BuyCoinData, BuyCoinData, QFilterCondition> {
  QueryBuilder<BuyCoinData, BuyCoinData, QAfterFilterCondition> idEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 0,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<BuyCoinData, BuyCoinData, QAfterFilterCondition> idGreaterThan(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 0,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<BuyCoinData, BuyCoinData, QAfterFilterCondition>
      idGreaterThanOrEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 0,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<BuyCoinData, BuyCoinData, QAfterFilterCondition> idLessThan(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 0,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<BuyCoinData, BuyCoinData, QAfterFilterCondition>
      idLessThanOrEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 0,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<BuyCoinData, BuyCoinData, QAfterFilterCondition> idBetween(
    int lower,
    int upper,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 0,
          lower: lower,
          upper: upper,
        ),
      );
    });
  }

  QueryBuilder<BuyCoinData, BuyCoinData, QAfterFilterCondition> walletIDEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BuyCoinData, BuyCoinData, QAfterFilterCondition>
      walletIDGreaterThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BuyCoinData, BuyCoinData, QAfterFilterCondition>
      walletIDGreaterThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BuyCoinData, BuyCoinData, QAfterFilterCondition>
      walletIDLessThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BuyCoinData, BuyCoinData, QAfterFilterCondition>
      walletIDLessThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BuyCoinData, BuyCoinData, QAfterFilterCondition> walletIDBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 1,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BuyCoinData, BuyCoinData, QAfterFilterCondition>
      walletIDStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BuyCoinData, BuyCoinData, QAfterFilterCondition>
      walletIDEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BuyCoinData, BuyCoinData, QAfterFilterCondition>
      walletIDContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BuyCoinData, BuyCoinData, QAfterFilterCondition> walletIDMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 1,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BuyCoinData, BuyCoinData, QAfterFilterCondition>
      walletIDIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 1,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<BuyCoinData, BuyCoinData, QAfterFilterCondition>
      walletIDIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 1,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<BuyCoinData, BuyCoinData, QAfterFilterCondition> coinIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const IsNullCondition(property: 2));
    });
  }

  QueryBuilder<BuyCoinData, BuyCoinData, QAfterFilterCondition>
      coinIdIsNotNull() {
    return QueryBuilder.apply(not(), (query) {
      return query.addFilterCondition(const IsNullCondition(property: 2));
    });
  }

  QueryBuilder<BuyCoinData, BuyCoinData, QAfterFilterCondition> coinIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BuyCoinData, BuyCoinData, QAfterFilterCondition>
      coinIdGreaterThan(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BuyCoinData, BuyCoinData, QAfterFilterCondition>
      coinIdGreaterThanOrEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BuyCoinData, BuyCoinData, QAfterFilterCondition> coinIdLessThan(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BuyCoinData, BuyCoinData, QAfterFilterCondition>
      coinIdLessThanOrEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BuyCoinData, BuyCoinData, QAfterFilterCondition> coinIdBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 2,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BuyCoinData, BuyCoinData, QAfterFilterCondition>
      coinIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BuyCoinData, BuyCoinData, QAfterFilterCondition> coinIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BuyCoinData, BuyCoinData, QAfterFilterCondition> coinIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BuyCoinData, BuyCoinData, QAfterFilterCondition> coinIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 2,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BuyCoinData, BuyCoinData, QAfterFilterCondition>
      coinIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 2,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<BuyCoinData, BuyCoinData, QAfterFilterCondition>
      coinIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 2,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<BuyCoinData, BuyCoinData, QAfterFilterCondition>
      coinNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const IsNullCondition(property: 3));
    });
  }

  QueryBuilder<BuyCoinData, BuyCoinData, QAfterFilterCondition>
      coinNameIsNotNull() {
    return QueryBuilder.apply(not(), (query) {
      return query.addFilterCondition(const IsNullCondition(property: 3));
    });
  }

  QueryBuilder<BuyCoinData, BuyCoinData, QAfterFilterCondition> coinNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BuyCoinData, BuyCoinData, QAfterFilterCondition>
      coinNameGreaterThan(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BuyCoinData, BuyCoinData, QAfterFilterCondition>
      coinNameGreaterThanOrEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BuyCoinData, BuyCoinData, QAfterFilterCondition>
      coinNameLessThan(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BuyCoinData, BuyCoinData, QAfterFilterCondition>
      coinNameLessThanOrEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BuyCoinData, BuyCoinData, QAfterFilterCondition> coinNameBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 3,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BuyCoinData, BuyCoinData, QAfterFilterCondition>
      coinNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BuyCoinData, BuyCoinData, QAfterFilterCondition>
      coinNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BuyCoinData, BuyCoinData, QAfterFilterCondition>
      coinNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BuyCoinData, BuyCoinData, QAfterFilterCondition> coinNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 3,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<BuyCoinData, BuyCoinData, QAfterFilterCondition>
      coinNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 3,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<BuyCoinData, BuyCoinData, QAfterFilterCondition>
      coinNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 3,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<BuyCoinData, BuyCoinData, QAfterFilterCondition> priceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const IsNullCondition(property: 4));
    });
  }

  QueryBuilder<BuyCoinData, BuyCoinData, QAfterFilterCondition>
      priceIsNotNull() {
    return QueryBuilder.apply(not(), (query) {
      return query.addFilterCondition(const IsNullCondition(property: 4));
    });
  }

  QueryBuilder<BuyCoinData, BuyCoinData, QAfterFilterCondition> priceEqualTo(
    double? value, {
    double epsilon = Filter.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 4,
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<BuyCoinData, BuyCoinData, QAfterFilterCondition>
      priceGreaterThan(
    double? value, {
    double epsilon = Filter.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 4,
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<BuyCoinData, BuyCoinData, QAfterFilterCondition>
      priceGreaterThanOrEqualTo(
    double? value, {
    double epsilon = Filter.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 4,
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<BuyCoinData, BuyCoinData, QAfterFilterCondition> priceLessThan(
    double? value, {
    double epsilon = Filter.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 4,
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<BuyCoinData, BuyCoinData, QAfterFilterCondition>
      priceLessThanOrEqualTo(
    double? value, {
    double epsilon = Filter.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 4,
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<BuyCoinData, BuyCoinData, QAfterFilterCondition> priceBetween(
    double? lower,
    double? upper, {
    double epsilon = Filter.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 4,
          lower: lower,
          upper: upper,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<BuyCoinData, BuyCoinData, QAfterFilterCondition>
      timestampIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const IsNullCondition(property: 5));
    });
  }

  QueryBuilder<BuyCoinData, BuyCoinData, QAfterFilterCondition>
      timestampIsNotNull() {
    return QueryBuilder.apply(not(), (query) {
      return query.addFilterCondition(const IsNullCondition(property: 5));
    });
  }

  QueryBuilder<BuyCoinData, BuyCoinData, QAfterFilterCondition>
      timestampEqualTo(
    DateTime? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 5,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<BuyCoinData, BuyCoinData, QAfterFilterCondition>
      timestampGreaterThan(
    DateTime? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 5,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<BuyCoinData, BuyCoinData, QAfterFilterCondition>
      timestampGreaterThanOrEqualTo(
    DateTime? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 5,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<BuyCoinData, BuyCoinData, QAfterFilterCondition>
      timestampLessThan(
    DateTime? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 5,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<BuyCoinData, BuyCoinData, QAfterFilterCondition>
      timestampLessThanOrEqualTo(
    DateTime? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 5,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<BuyCoinData, BuyCoinData, QAfterFilterCondition>
      timestampBetween(
    DateTime? lower,
    DateTime? upper,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 5,
          lower: lower,
          upper: upper,
        ),
      );
    });
  }
}

extension BuyCoinDataQueryObject
    on QueryBuilder<BuyCoinData, BuyCoinData, QFilterCondition> {}

extension BuyCoinDataQuerySortBy
    on QueryBuilder<BuyCoinData, BuyCoinData, QSortBy> {
  QueryBuilder<BuyCoinData, BuyCoinData, QAfterSortBy> sortById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0);
    });
  }

  QueryBuilder<BuyCoinData, BuyCoinData, QAfterSortBy> sortByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0, sort: Sort.desc);
    });
  }

  QueryBuilder<BuyCoinData, BuyCoinData, QAfterSortBy> sortByWalletID(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        1,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<BuyCoinData, BuyCoinData, QAfterSortBy> sortByWalletIDDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        1,
        sort: Sort.desc,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<BuyCoinData, BuyCoinData, QAfterSortBy> sortByCoinId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        2,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<BuyCoinData, BuyCoinData, QAfterSortBy> sortByCoinIdDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        2,
        sort: Sort.desc,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<BuyCoinData, BuyCoinData, QAfterSortBy> sortByCoinName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        3,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<BuyCoinData, BuyCoinData, QAfterSortBy> sortByCoinNameDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        3,
        sort: Sort.desc,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<BuyCoinData, BuyCoinData, QAfterSortBy> sortByPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(4);
    });
  }

  QueryBuilder<BuyCoinData, BuyCoinData, QAfterSortBy> sortByPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(4, sort: Sort.desc);
    });
  }

  QueryBuilder<BuyCoinData, BuyCoinData, QAfterSortBy> sortByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(5);
    });
  }

  QueryBuilder<BuyCoinData, BuyCoinData, QAfterSortBy> sortByTimestampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(5, sort: Sort.desc);
    });
  }
}

extension BuyCoinDataQuerySortThenBy
    on QueryBuilder<BuyCoinData, BuyCoinData, QSortThenBy> {
  QueryBuilder<BuyCoinData, BuyCoinData, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0);
    });
  }

  QueryBuilder<BuyCoinData, BuyCoinData, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0, sort: Sort.desc);
    });
  }

  QueryBuilder<BuyCoinData, BuyCoinData, QAfterSortBy> thenByWalletID(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BuyCoinData, BuyCoinData, QAfterSortBy> thenByWalletIDDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BuyCoinData, BuyCoinData, QAfterSortBy> thenByCoinId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BuyCoinData, BuyCoinData, QAfterSortBy> thenByCoinIdDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BuyCoinData, BuyCoinData, QAfterSortBy> thenByCoinName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BuyCoinData, BuyCoinData, QAfterSortBy> thenByCoinNameDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BuyCoinData, BuyCoinData, QAfterSortBy> thenByPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(4);
    });
  }

  QueryBuilder<BuyCoinData, BuyCoinData, QAfterSortBy> thenByPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(4, sort: Sort.desc);
    });
  }

  QueryBuilder<BuyCoinData, BuyCoinData, QAfterSortBy> thenByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(5);
    });
  }

  QueryBuilder<BuyCoinData, BuyCoinData, QAfterSortBy> thenByTimestampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(5, sort: Sort.desc);
    });
  }
}

extension BuyCoinDataQueryWhereDistinct
    on QueryBuilder<BuyCoinData, BuyCoinData, QDistinct> {
  QueryBuilder<BuyCoinData, BuyCoinData, QAfterDistinct> distinctByWalletID(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(1, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BuyCoinData, BuyCoinData, QAfterDistinct> distinctByCoinId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(2, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BuyCoinData, BuyCoinData, QAfterDistinct> distinctByCoinName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(3, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BuyCoinData, BuyCoinData, QAfterDistinct> distinctByPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(4);
    });
  }

  QueryBuilder<BuyCoinData, BuyCoinData, QAfterDistinct> distinctByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(5);
    });
  }
}

extension BuyCoinDataQueryProperty1
    on QueryBuilder<BuyCoinData, BuyCoinData, QProperty> {
  QueryBuilder<BuyCoinData, int, QAfterProperty> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<BuyCoinData, String, QAfterProperty> walletIDProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<BuyCoinData, String?, QAfterProperty> coinIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<BuyCoinData, String?, QAfterProperty> coinNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }

  QueryBuilder<BuyCoinData, double?, QAfterProperty> priceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(4);
    });
  }

  QueryBuilder<BuyCoinData, DateTime?, QAfterProperty> timestampProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(5);
    });
  }
}

extension BuyCoinDataQueryProperty2<R>
    on QueryBuilder<BuyCoinData, R, QAfterProperty> {
  QueryBuilder<BuyCoinData, (R, int), QAfterProperty> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<BuyCoinData, (R, String), QAfterProperty> walletIDProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<BuyCoinData, (R, String?), QAfterProperty> coinIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<BuyCoinData, (R, String?), QAfterProperty> coinNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }

  QueryBuilder<BuyCoinData, (R, double?), QAfterProperty> priceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(4);
    });
  }

  QueryBuilder<BuyCoinData, (R, DateTime?), QAfterProperty>
      timestampProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(5);
    });
  }
}

extension BuyCoinDataQueryProperty3<R1, R2>
    on QueryBuilder<BuyCoinData, (R1, R2), QAfterProperty> {
  QueryBuilder<BuyCoinData, (R1, R2, int), QOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<BuyCoinData, (R1, R2, String), QOperations> walletIDProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<BuyCoinData, (R1, R2, String?), QOperations> coinIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<BuyCoinData, (R1, R2, String?), QOperations> coinNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }

  QueryBuilder<BuyCoinData, (R1, R2, double?), QOperations> priceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(4);
    });
  }

  QueryBuilder<BuyCoinData, (R1, R2, DateTime?), QOperations>
      timestampProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(5);
    });
  }
}
