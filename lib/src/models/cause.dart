/// Represents a charitable cause that can receive donations.
class Cause {
  final String id;
  final String name;
  final String? description;
  final String ownerPhone;
  final DateTime createdAt;
  final DateTime updatedAt;

  // Computed from summary endpoint (optional)
  final double? totalDonations;
  final double? totalPayouts;
  final double? availableBalance;
  final String? currency;

  Cause({
    required this.id,
    required this.name,
    this.description,
    required this.ownerPhone,
    required this.createdAt,
    required this.updatedAt,
    this.totalDonations,
    this.totalPayouts,
    this.availableBalance,
    this.currency,
  });

  /// Returns the progress percentage (0.0 to 1.0) if we have donation data
  double get progress {
    if (totalDonations == null || totalDonations! <= 0) return 0.0;
    // For display purposes, show as percentage of collected
    return 1.0; // Always show full since we don't have target
  }

  /// Creates a Cause from JSON map
  factory Cause.fromJson(Map<String, dynamic> json) {
    return Cause(
      id: json['id']?.toString() ?? '',
      name: json['name']?.toString() ?? '',
      description: json['description']?.toString(),
      ownerPhone: json['ownerPhone']?.toString() ?? '',
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'].toString())
          : DateTime.now(),
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'].toString())
          : DateTime.now(),
      totalDonations: json['totalDonations'] != null 
          ? (json['totalDonations'] as num?)?.toDouble()
          : null,
      totalPayouts: json['totalPayouts'] != null 
          ? (json['totalPayouts'] as num?)?.toDouble()
          : null,
      availableBalance: json['availableBalance'] != null 
          ? (json['availableBalance'] as num?)?.toDouble()
          : null,
      currency: json['currency']?.toString(),
    );
  }

  /// Converts the Cause to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'ownerPhone': ownerPhone,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  /// Creates a copy of this Cause with the given fields replaced
  Cause copyWith({
    String? id,
    String? name,
    String? description,
    String? ownerPhone,
    DateTime? createdAt,
    DateTime? updatedAt,
    double? totalDonations,
    double? totalPayouts,
    double? availableBalance,
    String? currency,
  }) {
    return Cause(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      ownerPhone: ownerPhone ?? this.ownerPhone,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      totalDonations: totalDonations ?? this.totalDonations,
      totalPayouts: totalPayouts ?? this.totalPayouts,
      availableBalance: availableBalance ?? this.availableBalance,
      currency: currency ?? this.currency,
    );
  }

  @override
  String toString() {
    return 'Cause(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Cause && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}

/// Request model for creating a cause
class CreateCauseRequest {
  final String name;
  final String? description;
  final String ownerPhone;

  CreateCauseRequest({
    required this.name,
    this.description,
    required this.ownerPhone,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'ownerPhone': ownerPhone,
    };
  }
}

/// Summary data for a cause
class CauseSummary {
  final Cause cause;
  final double totalDonations;
  final double totalPayouts;
  final double availableBalance;
  final String currency;

  CauseSummary({
    required this.cause,
    required this.totalDonations,
    required this.totalPayouts,
    required this.availableBalance,
    required this.currency,
  });

  factory CauseSummary.fromJson(Map<String, dynamic> json) {
    return CauseSummary(
      cause: Cause.fromJson(json['cause'] as Map<String, dynamic>),
      totalDonations: (json['totalDonations'] as num?)?.toDouble() ?? 0.0,
      totalPayouts: (json['totalPayouts'] as num?)?.toDouble() ?? 0.0,
      availableBalance: (json['availableBalance'] as num?)?.toDouble() ?? 0.0,
      currency: json['currency']?.toString() ?? 'EUR',
    );
  }
}
