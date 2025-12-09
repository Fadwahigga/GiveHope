/// Represents the status of a payout
enum PayoutStatus {
  pending,
  completed,
  failed;

  static PayoutStatus fromString(String status) {
    switch (status.toLowerCase()) {
      case 'completed':
      case 'successful':
        return PayoutStatus.completed;
      case 'failed':
        return PayoutStatus.failed;
      case 'pending':
      default:
        return PayoutStatus.pending;
    }
  }

  String toJson() => name;
}

/// Represents a payout requested by a cause owner
class Payout {
  final String id;
  final String causeId;
  final String amount;
  final String currency;
  final PayoutStatus status;
  final String? externalId;
  final String? momoRefId;
  final String? description; // User info/description
  final DateTime createdAt;
  final DateTime updatedAt;
  final PayoutCause? cause;

  Payout({
    required this.id,
    required this.causeId,
    required this.amount,
    required this.currency,
    this.status = PayoutStatus.pending,
    this.externalId,
    this.momoRefId,
    this.description,
    required this.createdAt,
    required this.updatedAt,
    this.cause,
  });

  /// Get amount as double
  double get amountValue => double.tryParse(amount) ?? 0.0;

  /// Creates a Payout from JSON map
  factory Payout.fromJson(Map<String, dynamic> json) {
    return Payout(
      id: json['id']?.toString() ?? '',
      causeId: json['causeId']?.toString() ?? '',
      amount: json['amount']?.toString() ?? '0',
      currency: json['currency']?.toString() ?? 'EUR',
      status: PayoutStatus.fromString(json['status']?.toString() ?? 'pending'),
      externalId: json['externalId']?.toString(),
      momoRefId: json['momoRefId']?.toString(),
      description: json['description']?.toString(),
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'].toString())
          : DateTime.now(),
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'].toString())
          : DateTime.now(),
      cause: json['cause'] != null
          ? PayoutCause.fromJson(json['cause'] as Map<String, dynamic>)
          : null,
    );
  }

  /// Converts the Payout to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'causeId': causeId,
      'amount': amount,
      'currency': currency,
      'status': status.toJson(),
      'externalId': externalId,
      'momoRefId': momoRefId,
      'description': description,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  /// Creates a copy of this Payout with the given fields replaced
  Payout copyWith({
    String? id,
    String? causeId,
    String? amount,
    String? currency,
    PayoutStatus? status,
    String? externalId,
    String? momoRefId,
    String? description,
    DateTime? createdAt,
    DateTime? updatedAt,
    PayoutCause? cause,
  }) {
    return Payout(
      id: id ?? this.id,
      causeId: causeId ?? this.causeId,
      amount: amount ?? this.amount,
      currency: currency ?? this.currency,
      status: status ?? this.status,
      externalId: externalId ?? this.externalId,
      momoRefId: momoRefId ?? this.momoRefId,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      cause: cause ?? this.cause,
    );
  }

  @override
  String toString() {
    return 'Payout(id: $id, amount: $amount $currency, status: ${status.name})';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Payout && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}

/// Cause info within payout
class PayoutCause {
  final String id;
  final String name;
  final String? description;
  final String ownerPhone;
  final DateTime createdAt;
  final DateTime updatedAt;

  PayoutCause({
    required this.id,
    required this.name,
    this.description,
    required this.ownerPhone,
    required this.createdAt,
    required this.updatedAt,
  });

  factory PayoutCause.fromJson(Map<String, dynamic> json) {
    return PayoutCause(
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
    );
  }
}

/// Request model for requesting a payout
class PayoutRequest {
  final String causeId;
  final String amount;
  final String currency;
  final String? description; // User info/description

  PayoutRequest({
    required this.causeId,
    required this.amount,
    this.currency = 'EUR',
    this.description,
  });

  Map<String, dynamic> toJson() {
    return {
      'causeId': causeId,
      'amount': amount,
      'currency': currency,
      if (description != null && description!.isNotEmpty)
        'description': description,
    };
  }
}

/// Response from creating a payout
class PayoutResponse {
  final String payoutId;
  final String externalId;
  final String status;
  final String? momoRefId;
  final bool transferInitiated;
  final String amount;
  final String currency;
  final double? availableBalanceAfter;
  final String? transferError;

  PayoutResponse({
    required this.payoutId,
    required this.externalId,
    required this.status,
    this.momoRefId,
    required this.transferInitiated,
    required this.amount,
    required this.currency,
    this.availableBalanceAfter,
    this.transferError,
  });

  factory PayoutResponse.fromJson(Map<String, dynamic> json) {
    return PayoutResponse(
      payoutId: json['payoutId']?.toString() ?? '',
      externalId: json['externalId']?.toString() ?? '',
      status: json['status']?.toString() ?? 'pending',
      momoRefId: json['momoRefId']?.toString(),
      transferInitiated: json['transferInitiated'] == true,
      amount: json['amount']?.toString() ?? '0',
      currency: json['currency']?.toString() ?? 'EUR',
      availableBalanceAfter: json['availableBalanceAfter'] != null
          ? (json['availableBalanceAfter'] as num?)?.toDouble()
          : null,
      transferError: json['transferError']?.toString(),
    );
  }
}
