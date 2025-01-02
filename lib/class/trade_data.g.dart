// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trade_data.dart';

// **************************************************************************
// _IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, invalid_use_of_protected_member, lines_longer_than_80_chars, constant_identifier_names, avoid_js_rounded_ints, no_leading_underscores_for_local_identifiers, require_trailing_commas, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_in_if_null_operators, library_private_types_in_public_api, prefer_const_constructors
// ignore_for_file: type=lint

extension GetTradeDataCollection on Isar {
  IsarCollection<int, TradeData> get tradeDatas => this.collection();
}

const TradeDataSchema = IsarGeneratedSchema(
  schema: IsarSchema(
    name: 'TradeData',
    idName: 'id',
    embedded: false,
    properties: [
      IsarPropertySchema(
        name: 'userID',
        type: IsarType.string,
      ),
      IsarPropertySchema(
        name: 'userName',
        type: IsarType.string,
      ),
      IsarPropertySchema(
        name: 'tradeId',
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
        name: 'sell',
        type: IsarType.double,
      ),
      IsarPropertySchema(
        name: 'buy',
        type: IsarType.double,
      ),
      IsarPropertySchema(
        name: 'timestamp',
        type: IsarType.dateTime,
      ),
    ],
    indexes: [],
  ),
  converter: IsarObjectConverter<int, TradeData>(
    serialize: serializeTradeData,
    deserialize: deserializeTradeData,
    deserializeProperty: deserializeTradeDataProp,
  ),
  embeddedSchemas: [],
);

@isarProtected
int serializeTradeData(IsarWriter writer, TradeData object) {
  {
    final value = object.userID;
    if (value == null) {
      IsarCore.writeNull(writer, 1);
    } else {
      IsarCore.writeString(writer, 1, value);
    }
  }
  {
    final value = object.userName;
    if (value == null) {
      IsarCore.writeNull(writer, 2);
    } else {
      IsarCore.writeString(writer, 2, value);
    }
  }
  {
    final value = object.tradeId;
    if (value == null) {
      IsarCore.writeNull(writer, 3);
    } else {
      IsarCore.writeString(writer, 3, value);
    }
  }
  {
    final value = object.coinId;
    if (value == null) {
      IsarCore.writeNull(writer, 4);
    } else {
      IsarCore.writeString(writer, 4, value);
    }
  }
  {
    final value = object.coinName;
    if (value == null) {
      IsarCore.writeNull(writer, 5);
    } else {
      IsarCore.writeString(writer, 5, value);
    }
  }
  IsarCore.writeDouble(writer, 6, object.sell ?? double.nan);
  IsarCore.writeDouble(writer, 7, object.buy ?? double.nan);
  IsarCore.writeLong(writer, 8,
      object.timestamp?.toUtc().microsecondsSinceEpoch ?? -9223372036854775808);
  return object.id;
}

@isarProtected
TradeData deserializeTradeData(IsarReader reader) {
  final int _id;
  _id = IsarCore.readId(reader);
  final String? _userID;
  _userID = IsarCore.readString(reader, 1);
  final String? _userName;
  _userName = IsarCore.readString(reader, 2);
  final String? _tradeId;
  _tradeId = IsarCore.readString(reader, 3);
  final String? _coinId;
  _coinId = IsarCore.readString(reader, 4);
  final String? _coinName;
  _coinName = IsarCore.readString(reader, 5);
  final double? _sell;
  {
    final value = IsarCore.readDouble(reader, 6);
    if (value.isNaN) {
      _sell = null;
    } else {
      _sell = value;
    }
  }
  final double? _buy;
  {
    final value = IsarCore.readDouble(reader, 7);
    if (value.isNaN) {
      _buy = null;
    } else {
      _buy = value;
    }
  }
  final DateTime? _timestamp;
  {
    final value = IsarCore.readLong(reader, 8);
    if (value == -9223372036854775808) {
      _timestamp = null;
    } else {
      _timestamp =
          DateTime.fromMicrosecondsSinceEpoch(value, isUtc: true).toLocal();
    }
  }
  final object = TradeData(
    id: _id,
    userID: _userID,
    userName: _userName,
    tradeId: _tradeId,
    coinId: _coinId,
    coinName: _coinName,
    sell: _sell,
    buy: _buy,
    timestamp: _timestamp,
  );
  return object;
}

@isarProtected
dynamic deserializeTradeDataProp(IsarReader reader, int property) {
  switch (property) {
    case 0:
      return IsarCore.readId(reader);
    case 1:
      return IsarCore.readString(reader, 1);
    case 2:
      return IsarCore.readString(reader, 2);
    case 3:
      return IsarCore.readString(reader, 3);
    case 4:
      return IsarCore.readString(reader, 4);
    case 5:
      return IsarCore.readString(reader, 5);
    case 6:
      {
        final value = IsarCore.readDouble(reader, 6);
        if (value.isNaN) {
          return null;
        } else {
          return value;
        }
      }
    case 7:
      {
        final value = IsarCore.readDouble(reader, 7);
        if (value.isNaN) {
          return null;
        } else {
          return value;
        }
      }
    case 8:
      {
        final value = IsarCore.readLong(reader, 8);
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

sealed class _TradeDataUpdate {
  bool call({
    required int id,
    String? userID,
    String? userName,
    String? tradeId,
    String? coinId,
    String? coinName,
    double? sell,
    double? buy,
    DateTime? timestamp,
  });
}

class _TradeDataUpdateImpl implements _TradeDataUpdate {
  const _TradeDataUpdateImpl(this.collection);

  final IsarCollection<int, TradeData> collection;

  @override
  bool call({
    required int id,
    Object? userID = ignore,
    Object? userName = ignore,
    Object? tradeId = ignore,
    Object? coinId = ignore,
    Object? coinName = ignore,
    Object? sell = ignore,
    Object? buy = ignore,
    Object? timestamp = ignore,
  }) {
    return collection.updateProperties([
          id
        ], {
          if (userID != ignore) 1: userID as String?,
          if (userName != ignore) 2: userName as String?,
          if (tradeId != ignore) 3: tradeId as String?,
          if (coinId != ignore) 4: coinId as String?,
          if (coinName != ignore) 5: coinName as String?,
          if (sell != ignore) 6: sell as double?,
          if (buy != ignore) 7: buy as double?,
          if (timestamp != ignore) 8: timestamp as DateTime?,
        }) >
        0;
  }
}

sealed class _TradeDataUpdateAll {
  int call({
    required List<int> id,
    String? userID,
    String? userName,
    String? tradeId,
    String? coinId,
    String? coinName,
    double? sell,
    double? buy,
    DateTime? timestamp,
  });
}

class _TradeDataUpdateAllImpl implements _TradeDataUpdateAll {
  const _TradeDataUpdateAllImpl(this.collection);

  final IsarCollection<int, TradeData> collection;

  @override
  int call({
    required List<int> id,
    Object? userID = ignore,
    Object? userName = ignore,
    Object? tradeId = ignore,
    Object? coinId = ignore,
    Object? coinName = ignore,
    Object? sell = ignore,
    Object? buy = ignore,
    Object? timestamp = ignore,
  }) {
    return collection.updateProperties(id, {
      if (userID != ignore) 1: userID as String?,
      if (userName != ignore) 2: userName as String?,
      if (tradeId != ignore) 3: tradeId as String?,
      if (coinId != ignore) 4: coinId as String?,
      if (coinName != ignore) 5: coinName as String?,
      if (sell != ignore) 6: sell as double?,
      if (buy != ignore) 7: buy as double?,
      if (timestamp != ignore) 8: timestamp as DateTime?,
    });
  }
}

extension TradeDataUpdate on IsarCollection<int, TradeData> {
  _TradeDataUpdate get update => _TradeDataUpdateImpl(this);

  _TradeDataUpdateAll get updateAll => _TradeDataUpdateAllImpl(this);
}

sealed class _TradeDataQueryUpdate {
  int call({
    String? userID,
    String? userName,
    String? tradeId,
    String? coinId,
    String? coinName,
    double? sell,
    double? buy,
    DateTime? timestamp,
  });
}

class _TradeDataQueryUpdateImpl implements _TradeDataQueryUpdate {
  const _TradeDataQueryUpdateImpl(this.query, {this.limit});

  final IsarQuery<TradeData> query;
  final int? limit;

  @override
  int call({
    Object? userID = ignore,
    Object? userName = ignore,
    Object? tradeId = ignore,
    Object? coinId = ignore,
    Object? coinName = ignore,
    Object? sell = ignore,
    Object? buy = ignore,
    Object? timestamp = ignore,
  }) {
    return query.updateProperties(limit: limit, {
      if (userID != ignore) 1: userID as String?,
      if (userName != ignore) 2: userName as String?,
      if (tradeId != ignore) 3: tradeId as String?,
      if (coinId != ignore) 4: coinId as String?,
      if (coinName != ignore) 5: coinName as String?,
      if (sell != ignore) 6: sell as double?,
      if (buy != ignore) 7: buy as double?,
      if (timestamp != ignore) 8: timestamp as DateTime?,
    });
  }
}

extension TradeDataQueryUpdate on IsarQuery<TradeData> {
  _TradeDataQueryUpdate get updateFirst =>
      _TradeDataQueryUpdateImpl(this, limit: 1);

  _TradeDataQueryUpdate get updateAll => _TradeDataQueryUpdateImpl(this);
}

class _TradeDataQueryBuilderUpdateImpl implements _TradeDataQueryUpdate {
  const _TradeDataQueryBuilderUpdateImpl(this.query, {this.limit});

  final QueryBuilder<TradeData, TradeData, QOperations> query;
  final int? limit;

  @override
  int call({
    Object? userID = ignore,
    Object? userName = ignore,
    Object? tradeId = ignore,
    Object? coinId = ignore,
    Object? coinName = ignore,
    Object? sell = ignore,
    Object? buy = ignore,
    Object? timestamp = ignore,
  }) {
    final q = query.build();
    try {
      return q.updateProperties(limit: limit, {
        if (userID != ignore) 1: userID as String?,
        if (userName != ignore) 2: userName as String?,
        if (tradeId != ignore) 3: tradeId as String?,
        if (coinId != ignore) 4: coinId as String?,
        if (coinName != ignore) 5: coinName as String?,
        if (sell != ignore) 6: sell as double?,
        if (buy != ignore) 7: buy as double?,
        if (timestamp != ignore) 8: timestamp as DateTime?,
      });
    } finally {
      q.close();
    }
  }
}

extension TradeDataQueryBuilderUpdate
    on QueryBuilder<TradeData, TradeData, QOperations> {
  _TradeDataQueryUpdate get updateFirst =>
      _TradeDataQueryBuilderUpdateImpl(this, limit: 1);

  _TradeDataQueryUpdate get updateAll => _TradeDataQueryBuilderUpdateImpl(this);
}

extension TradeDataQueryFilter
    on QueryBuilder<TradeData, TradeData, QFilterCondition> {
  QueryBuilder<TradeData, TradeData, QAfterFilterCondition> idEqualTo(
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

  QueryBuilder<TradeData, TradeData, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<TradeData, TradeData, QAfterFilterCondition>
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

  QueryBuilder<TradeData, TradeData, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<TradeData, TradeData, QAfterFilterCondition> idLessThanOrEqualTo(
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

  QueryBuilder<TradeData, TradeData, QAfterFilterCondition> idBetween(
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

  QueryBuilder<TradeData, TradeData, QAfterFilterCondition> userIDIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const IsNullCondition(property: 1));
    });
  }

  QueryBuilder<TradeData, TradeData, QAfterFilterCondition> userIDIsNotNull() {
    return QueryBuilder.apply(not(), (query) {
      return query.addFilterCondition(const IsNullCondition(property: 1));
    });
  }

  QueryBuilder<TradeData, TradeData, QAfterFilterCondition> userIDEqualTo(
    String? value, {
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

  QueryBuilder<TradeData, TradeData, QAfterFilterCondition> userIDGreaterThan(
    String? value, {
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

  QueryBuilder<TradeData, TradeData, QAfterFilterCondition>
      userIDGreaterThanOrEqualTo(
    String? value, {
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

  QueryBuilder<TradeData, TradeData, QAfterFilterCondition> userIDLessThan(
    String? value, {
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

  QueryBuilder<TradeData, TradeData, QAfterFilterCondition>
      userIDLessThanOrEqualTo(
    String? value, {
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

  QueryBuilder<TradeData, TradeData, QAfterFilterCondition> userIDBetween(
    String? lower,
    String? upper, {
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

  QueryBuilder<TradeData, TradeData, QAfterFilterCondition> userIDStartsWith(
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

  QueryBuilder<TradeData, TradeData, QAfterFilterCondition> userIDEndsWith(
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

  QueryBuilder<TradeData, TradeData, QAfterFilterCondition> userIDContains(
      String value,
      {bool caseSensitive = true}) {
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

  QueryBuilder<TradeData, TradeData, QAfterFilterCondition> userIDMatches(
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

  QueryBuilder<TradeData, TradeData, QAfterFilterCondition> userIDIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 1,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<TradeData, TradeData, QAfterFilterCondition> userIDIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 1,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<TradeData, TradeData, QAfterFilterCondition> userNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const IsNullCondition(property: 2));
    });
  }

  QueryBuilder<TradeData, TradeData, QAfterFilterCondition>
      userNameIsNotNull() {
    return QueryBuilder.apply(not(), (query) {
      return query.addFilterCondition(const IsNullCondition(property: 2));
    });
  }

  QueryBuilder<TradeData, TradeData, QAfterFilterCondition> userNameEqualTo(
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

  QueryBuilder<TradeData, TradeData, QAfterFilterCondition> userNameGreaterThan(
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

  QueryBuilder<TradeData, TradeData, QAfterFilterCondition>
      userNameGreaterThanOrEqualTo(
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

  QueryBuilder<TradeData, TradeData, QAfterFilterCondition> userNameLessThan(
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

  QueryBuilder<TradeData, TradeData, QAfterFilterCondition>
      userNameLessThanOrEqualTo(
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

  QueryBuilder<TradeData, TradeData, QAfterFilterCondition> userNameBetween(
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

  QueryBuilder<TradeData, TradeData, QAfterFilterCondition> userNameStartsWith(
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

  QueryBuilder<TradeData, TradeData, QAfterFilterCondition> userNameEndsWith(
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

  QueryBuilder<TradeData, TradeData, QAfterFilterCondition> userNameContains(
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

  QueryBuilder<TradeData, TradeData, QAfterFilterCondition> userNameMatches(
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

  QueryBuilder<TradeData, TradeData, QAfterFilterCondition> userNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 2,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<TradeData, TradeData, QAfterFilterCondition>
      userNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 2,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<TradeData, TradeData, QAfterFilterCondition> tradeIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const IsNullCondition(property: 3));
    });
  }

  QueryBuilder<TradeData, TradeData, QAfterFilterCondition> tradeIdIsNotNull() {
    return QueryBuilder.apply(not(), (query) {
      return query.addFilterCondition(const IsNullCondition(property: 3));
    });
  }

  QueryBuilder<TradeData, TradeData, QAfterFilterCondition> tradeIdEqualTo(
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

  QueryBuilder<TradeData, TradeData, QAfterFilterCondition> tradeIdGreaterThan(
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

  QueryBuilder<TradeData, TradeData, QAfterFilterCondition>
      tradeIdGreaterThanOrEqualTo(
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

  QueryBuilder<TradeData, TradeData, QAfterFilterCondition> tradeIdLessThan(
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

  QueryBuilder<TradeData, TradeData, QAfterFilterCondition>
      tradeIdLessThanOrEqualTo(
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

  QueryBuilder<TradeData, TradeData, QAfterFilterCondition> tradeIdBetween(
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

  QueryBuilder<TradeData, TradeData, QAfterFilterCondition> tradeIdStartsWith(
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

  QueryBuilder<TradeData, TradeData, QAfterFilterCondition> tradeIdEndsWith(
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

  QueryBuilder<TradeData, TradeData, QAfterFilterCondition> tradeIdContains(
      String value,
      {bool caseSensitive = true}) {
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

  QueryBuilder<TradeData, TradeData, QAfterFilterCondition> tradeIdMatches(
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

  QueryBuilder<TradeData, TradeData, QAfterFilterCondition> tradeIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 3,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<TradeData, TradeData, QAfterFilterCondition>
      tradeIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 3,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<TradeData, TradeData, QAfterFilterCondition> coinIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const IsNullCondition(property: 4));
    });
  }

  QueryBuilder<TradeData, TradeData, QAfterFilterCondition> coinIdIsNotNull() {
    return QueryBuilder.apply(not(), (query) {
      return query.addFilterCondition(const IsNullCondition(property: 4));
    });
  }

  QueryBuilder<TradeData, TradeData, QAfterFilterCondition> coinIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 4,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TradeData, TradeData, QAfterFilterCondition> coinIdGreaterThan(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 4,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TradeData, TradeData, QAfterFilterCondition>
      coinIdGreaterThanOrEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 4,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TradeData, TradeData, QAfterFilterCondition> coinIdLessThan(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 4,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TradeData, TradeData, QAfterFilterCondition>
      coinIdLessThanOrEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 4,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TradeData, TradeData, QAfterFilterCondition> coinIdBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 4,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TradeData, TradeData, QAfterFilterCondition> coinIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 4,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TradeData, TradeData, QAfterFilterCondition> coinIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 4,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TradeData, TradeData, QAfterFilterCondition> coinIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 4,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TradeData, TradeData, QAfterFilterCondition> coinIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 4,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TradeData, TradeData, QAfterFilterCondition> coinIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 4,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<TradeData, TradeData, QAfterFilterCondition> coinIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 4,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<TradeData, TradeData, QAfterFilterCondition> coinNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const IsNullCondition(property: 5));
    });
  }

  QueryBuilder<TradeData, TradeData, QAfterFilterCondition>
      coinNameIsNotNull() {
    return QueryBuilder.apply(not(), (query) {
      return query.addFilterCondition(const IsNullCondition(property: 5));
    });
  }

  QueryBuilder<TradeData, TradeData, QAfterFilterCondition> coinNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 5,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TradeData, TradeData, QAfterFilterCondition> coinNameGreaterThan(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 5,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TradeData, TradeData, QAfterFilterCondition>
      coinNameGreaterThanOrEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 5,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TradeData, TradeData, QAfterFilterCondition> coinNameLessThan(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 5,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TradeData, TradeData, QAfterFilterCondition>
      coinNameLessThanOrEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 5,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TradeData, TradeData, QAfterFilterCondition> coinNameBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 5,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TradeData, TradeData, QAfterFilterCondition> coinNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 5,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TradeData, TradeData, QAfterFilterCondition> coinNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 5,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TradeData, TradeData, QAfterFilterCondition> coinNameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 5,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TradeData, TradeData, QAfterFilterCondition> coinNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 5,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<TradeData, TradeData, QAfterFilterCondition> coinNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 5,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<TradeData, TradeData, QAfterFilterCondition>
      coinNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 5,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<TradeData, TradeData, QAfterFilterCondition> sellIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const IsNullCondition(property: 6));
    });
  }

  QueryBuilder<TradeData, TradeData, QAfterFilterCondition> sellIsNotNull() {
    return QueryBuilder.apply(not(), (query) {
      return query.addFilterCondition(const IsNullCondition(property: 6));
    });
  }

  QueryBuilder<TradeData, TradeData, QAfterFilterCondition> sellEqualTo(
    double? value, {
    double epsilon = Filter.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 6,
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<TradeData, TradeData, QAfterFilterCondition> sellGreaterThan(
    double? value, {
    double epsilon = Filter.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 6,
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<TradeData, TradeData, QAfterFilterCondition>
      sellGreaterThanOrEqualTo(
    double? value, {
    double epsilon = Filter.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 6,
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<TradeData, TradeData, QAfterFilterCondition> sellLessThan(
    double? value, {
    double epsilon = Filter.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 6,
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<TradeData, TradeData, QAfterFilterCondition>
      sellLessThanOrEqualTo(
    double? value, {
    double epsilon = Filter.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 6,
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<TradeData, TradeData, QAfterFilterCondition> sellBetween(
    double? lower,
    double? upper, {
    double epsilon = Filter.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 6,
          lower: lower,
          upper: upper,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<TradeData, TradeData, QAfterFilterCondition> buyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const IsNullCondition(property: 7));
    });
  }

  QueryBuilder<TradeData, TradeData, QAfterFilterCondition> buyIsNotNull() {
    return QueryBuilder.apply(not(), (query) {
      return query.addFilterCondition(const IsNullCondition(property: 7));
    });
  }

  QueryBuilder<TradeData, TradeData, QAfterFilterCondition> buyEqualTo(
    double? value, {
    double epsilon = Filter.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 7,
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<TradeData, TradeData, QAfterFilterCondition> buyGreaterThan(
    double? value, {
    double epsilon = Filter.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 7,
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<TradeData, TradeData, QAfterFilterCondition>
      buyGreaterThanOrEqualTo(
    double? value, {
    double epsilon = Filter.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 7,
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<TradeData, TradeData, QAfterFilterCondition> buyLessThan(
    double? value, {
    double epsilon = Filter.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 7,
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<TradeData, TradeData, QAfterFilterCondition>
      buyLessThanOrEqualTo(
    double? value, {
    double epsilon = Filter.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 7,
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<TradeData, TradeData, QAfterFilterCondition> buyBetween(
    double? lower,
    double? upper, {
    double epsilon = Filter.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 7,
          lower: lower,
          upper: upper,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<TradeData, TradeData, QAfterFilterCondition> timestampIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const IsNullCondition(property: 8));
    });
  }

  QueryBuilder<TradeData, TradeData, QAfterFilterCondition>
      timestampIsNotNull() {
    return QueryBuilder.apply(not(), (query) {
      return query.addFilterCondition(const IsNullCondition(property: 8));
    });
  }

  QueryBuilder<TradeData, TradeData, QAfterFilterCondition> timestampEqualTo(
    DateTime? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 8,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<TradeData, TradeData, QAfterFilterCondition>
      timestampGreaterThan(
    DateTime? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 8,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<TradeData, TradeData, QAfterFilterCondition>
      timestampGreaterThanOrEqualTo(
    DateTime? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 8,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<TradeData, TradeData, QAfterFilterCondition> timestampLessThan(
    DateTime? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 8,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<TradeData, TradeData, QAfterFilterCondition>
      timestampLessThanOrEqualTo(
    DateTime? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 8,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<TradeData, TradeData, QAfterFilterCondition> timestampBetween(
    DateTime? lower,
    DateTime? upper,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 8,
          lower: lower,
          upper: upper,
        ),
      );
    });
  }
}

extension TradeDataQueryObject
    on QueryBuilder<TradeData, TradeData, QFilterCondition> {}

extension TradeDataQuerySortBy on QueryBuilder<TradeData, TradeData, QSortBy> {
  QueryBuilder<TradeData, TradeData, QAfterSortBy> sortById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0);
    });
  }

  QueryBuilder<TradeData, TradeData, QAfterSortBy> sortByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0, sort: Sort.desc);
    });
  }

  QueryBuilder<TradeData, TradeData, QAfterSortBy> sortByUserID(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        1,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<TradeData, TradeData, QAfterSortBy> sortByUserIDDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        1,
        sort: Sort.desc,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<TradeData, TradeData, QAfterSortBy> sortByUserName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        2,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<TradeData, TradeData, QAfterSortBy> sortByUserNameDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        2,
        sort: Sort.desc,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<TradeData, TradeData, QAfterSortBy> sortByTradeId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        3,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<TradeData, TradeData, QAfterSortBy> sortByTradeIdDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        3,
        sort: Sort.desc,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<TradeData, TradeData, QAfterSortBy> sortByCoinId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        4,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<TradeData, TradeData, QAfterSortBy> sortByCoinIdDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        4,
        sort: Sort.desc,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<TradeData, TradeData, QAfterSortBy> sortByCoinName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        5,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<TradeData, TradeData, QAfterSortBy> sortByCoinNameDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        5,
        sort: Sort.desc,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<TradeData, TradeData, QAfterSortBy> sortBySell() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(6);
    });
  }

  QueryBuilder<TradeData, TradeData, QAfterSortBy> sortBySellDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(6, sort: Sort.desc);
    });
  }

  QueryBuilder<TradeData, TradeData, QAfterSortBy> sortByBuy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(7);
    });
  }

  QueryBuilder<TradeData, TradeData, QAfterSortBy> sortByBuyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(7, sort: Sort.desc);
    });
  }

  QueryBuilder<TradeData, TradeData, QAfterSortBy> sortByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(8);
    });
  }

  QueryBuilder<TradeData, TradeData, QAfterSortBy> sortByTimestampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(8, sort: Sort.desc);
    });
  }
}

extension TradeDataQuerySortThenBy
    on QueryBuilder<TradeData, TradeData, QSortThenBy> {
  QueryBuilder<TradeData, TradeData, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0);
    });
  }

  QueryBuilder<TradeData, TradeData, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0, sort: Sort.desc);
    });
  }

  QueryBuilder<TradeData, TradeData, QAfterSortBy> thenByUserID(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TradeData, TradeData, QAfterSortBy> thenByUserIDDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TradeData, TradeData, QAfterSortBy> thenByUserName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TradeData, TradeData, QAfterSortBy> thenByUserNameDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TradeData, TradeData, QAfterSortBy> thenByTradeId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TradeData, TradeData, QAfterSortBy> thenByTradeIdDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TradeData, TradeData, QAfterSortBy> thenByCoinId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(4, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TradeData, TradeData, QAfterSortBy> thenByCoinIdDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(4, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TradeData, TradeData, QAfterSortBy> thenByCoinName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(5, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TradeData, TradeData, QAfterSortBy> thenByCoinNameDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(5, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TradeData, TradeData, QAfterSortBy> thenBySell() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(6);
    });
  }

  QueryBuilder<TradeData, TradeData, QAfterSortBy> thenBySellDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(6, sort: Sort.desc);
    });
  }

  QueryBuilder<TradeData, TradeData, QAfterSortBy> thenByBuy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(7);
    });
  }

  QueryBuilder<TradeData, TradeData, QAfterSortBy> thenByBuyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(7, sort: Sort.desc);
    });
  }

  QueryBuilder<TradeData, TradeData, QAfterSortBy> thenByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(8);
    });
  }

  QueryBuilder<TradeData, TradeData, QAfterSortBy> thenByTimestampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(8, sort: Sort.desc);
    });
  }
}

extension TradeDataQueryWhereDistinct
    on QueryBuilder<TradeData, TradeData, QDistinct> {
  QueryBuilder<TradeData, TradeData, QAfterDistinct> distinctByUserID(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(1, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TradeData, TradeData, QAfterDistinct> distinctByUserName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(2, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TradeData, TradeData, QAfterDistinct> distinctByTradeId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(3, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TradeData, TradeData, QAfterDistinct> distinctByCoinId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(4, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TradeData, TradeData, QAfterDistinct> distinctByCoinName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(5, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TradeData, TradeData, QAfterDistinct> distinctBySell() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(6);
    });
  }

  QueryBuilder<TradeData, TradeData, QAfterDistinct> distinctByBuy() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(7);
    });
  }

  QueryBuilder<TradeData, TradeData, QAfterDistinct> distinctByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(8);
    });
  }
}

extension TradeDataQueryProperty1
    on QueryBuilder<TradeData, TradeData, QProperty> {
  QueryBuilder<TradeData, int, QAfterProperty> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<TradeData, String?, QAfterProperty> userIDProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<TradeData, String?, QAfterProperty> userNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<TradeData, String?, QAfterProperty> tradeIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }

  QueryBuilder<TradeData, String?, QAfterProperty> coinIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(4);
    });
  }

  QueryBuilder<TradeData, String?, QAfterProperty> coinNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(5);
    });
  }

  QueryBuilder<TradeData, double?, QAfterProperty> sellProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(6);
    });
  }

  QueryBuilder<TradeData, double?, QAfterProperty> buyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(7);
    });
  }

  QueryBuilder<TradeData, DateTime?, QAfterProperty> timestampProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(8);
    });
  }
}

extension TradeDataQueryProperty2<R>
    on QueryBuilder<TradeData, R, QAfterProperty> {
  QueryBuilder<TradeData, (R, int), QAfterProperty> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<TradeData, (R, String?), QAfterProperty> userIDProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<TradeData, (R, String?), QAfterProperty> userNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<TradeData, (R, String?), QAfterProperty> tradeIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }

  QueryBuilder<TradeData, (R, String?), QAfterProperty> coinIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(4);
    });
  }

  QueryBuilder<TradeData, (R, String?), QAfterProperty> coinNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(5);
    });
  }

  QueryBuilder<TradeData, (R, double?), QAfterProperty> sellProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(6);
    });
  }

  QueryBuilder<TradeData, (R, double?), QAfterProperty> buyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(7);
    });
  }

  QueryBuilder<TradeData, (R, DateTime?), QAfterProperty> timestampProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(8);
    });
  }
}

extension TradeDataQueryProperty3<R1, R2>
    on QueryBuilder<TradeData, (R1, R2), QAfterProperty> {
  QueryBuilder<TradeData, (R1, R2, int), QOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<TradeData, (R1, R2, String?), QOperations> userIDProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<TradeData, (R1, R2, String?), QOperations> userNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<TradeData, (R1, R2, String?), QOperations> tradeIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }

  QueryBuilder<TradeData, (R1, R2, String?), QOperations> coinIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(4);
    });
  }

  QueryBuilder<TradeData, (R1, R2, String?), QOperations> coinNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(5);
    });
  }

  QueryBuilder<TradeData, (R1, R2, double?), QOperations> sellProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(6);
    });
  }

  QueryBuilder<TradeData, (R1, R2, double?), QOperations> buyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(7);
    });
  }

  QueryBuilder<TradeData, (R1, R2, DateTime?), QOperations>
      timestampProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(8);
    });
  }
}
