class Media {
  final String baseUrl;
  final String filename;
  final String id;
  final String mimeType;
  final String productUrl;

  Media({
    this.baseUrl,
    this.filename,
    this.id,
    this.mimeType,
    this.productUrl,
  });

  factory Media.fromJson(Map<String, dynamic> json) {
    return Media(
      baseUrl: json['baseUrl'],
      filename: json['filename'],
      id: json['id'],
      mimeType: json['mimeType'],
      productUrl: json['productUrl'],
    );
  }
}
