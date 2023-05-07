class RequestGetMarvelCharacter {
  final int? limit;
  final int? offset;
  late String? hash;
  final DateTime timeStamp;
  final String apiKeyPublic;

  RequestGetMarvelCharacter({
    this.limit,
    this.offset,
    this.hash,
    required this.timeStamp,
    required this.apiKeyPublic,
  });

  Map<String, dynamic> toJson() {
    return {
      'limit': limit ?? 20,
      'offset': offset ?? 0,
      'hash': hash,
      'ts': timeStamp.toIso8601String(),
      'apikey': apiKeyPublic,
    };
  }
}
