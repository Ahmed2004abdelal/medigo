import 'package:supabase_flutter/supabase_flutter.dart';

abstract class SupabaseService {
  // ==================== READ ====================

  Future<List<Map<String, dynamic>>> fetchData({
    required String table,
    Map<String, dynamic>? filters,
    String? searchColumn,
    String? searchQuery,
    int? page,
    int pageSize = 20,
    String? orderBy,
    bool ascending = true,
  });

  Future<Map<String, dynamic>?> fetchSingle({
    required String table,
    required Map<String, dynamic> filters,
  });

  // ==================== CREATE ====================

  Future<Map<String, dynamic>> insertData({
    required String table,
    required Map<String, dynamic> data,
  });

  Future<List<Map<String, dynamic>>> insertMany({
    required String table,
    required List<Map<String, dynamic>> dataList,
  });

  // ==================== UPDATE ====================

  Future<List<Map<String, dynamic>>> updateData({
    required String table,
    required Map<String, dynamic> data,
    required Map<String, dynamic> filters,
  });

  // ==================== DELETE ====================

  Future<void> deleteData({
    required String table,
    required Map<String, dynamic> filters,
  });
}

  // ==================== CREATE ====================

  class SupabaseServiceImpl implements SupabaseService {
  final SupabaseClient _client;

  SupabaseServiceImpl(this._client);

  // ==================== READ ====================

  @override
  Future<List<Map<String, dynamic>>> fetchData({
    required String table,
    Map<String, dynamic>? filters,
    String? searchColumn,
    String? searchQuery,
    int? page,
    int pageSize = 20,
    String? orderBy,
    bool ascending = true,
  }) async {
    var query = _client.from(table).select();

    if (filters != null) {
      filters.forEach((key, value) {
        query = query.eq(key, value);
      });
    }

    if (searchColumn != null && searchQuery != null && searchQuery.isNotEmpty) {
      query = query.ilike(searchColumn, '%$searchQuery%');
    }

    PostgrestTransformBuilder finalQuery = query;

    if (orderBy != null) {
      finalQuery = query.order(orderBy, ascending: ascending);
    }

    if (page != null) {
      final from = page * pageSize;
      final to = from + pageSize - 1;
      finalQuery = finalQuery.range(from, to);
    }

    final response = await finalQuery;
    return (response as List).cast<Map<String, dynamic>>();
  }

  @override
  Future<Map<String, dynamic>?> fetchSingle({
    required String table,
    required Map<String, dynamic> filters,
  }) async {
    var query = _client.from(table).select();

    filters.forEach((key, value) {
      query = query.eq(key, value);
    });

    final response = await query.maybeSingle();
    return response;
  }

  // ==================== CREATE ====================

  @override
  Future<Map<String, dynamic>> insertData({
    required String table,
    required Map<String, dynamic> data,
  }) async {
    final response = await _client
        .from(table)
        .insert(data)
        .select()
        .single();

    return response;
  }

  @override
  Future<List<Map<String, dynamic>>> insertMany({
    required String table,
    required List<Map<String, dynamic>> dataList,
  }) async {
    final response = await _client
        .from(table)
        .insert(dataList)
        .select();

    return (response as List).cast<Map<String, dynamic>>();
  }

  // ==================== UPDATE ====================

  @override
  Future<List<Map<String, dynamic>>> updateData({
    required String table,
    required Map<String, dynamic> data,
    required Map<String, dynamic> filters,
  }) async {
    var query = _client.from(table).update(data);

    filters.forEach((key, value) {
      query = query.eq(key, value);
    });

    final response = await query.select();
    return (response as List).cast<Map<String, dynamic>>();
  }

  // ==================== DELETE ====================

  @override
  Future<void> deleteData({
    required String table,
    required Map<String, dynamic> filters,
  }) async {
    var query = _client.from(table).delete();

    filters.forEach((key, value) {
      query = query.eq(key, value);
    });

    await query;
  }
}