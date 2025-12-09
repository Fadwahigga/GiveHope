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
    required this.createdAt,
    required this.updatedAt,
    this.cause,
  });

  /// Get amount as double
  double get amountValue => double.tryParse(amount) ?? 0.0;

  /// Creates a Payout from JSON map
  factory Payout.fromJson(Map<String, dynamic> json) {
    return Payout(
      id: json['id'] as String,
      causeId: json['causeId'] as String,
      amount: json['amount'].toString(),
      currency: json['currency'] as String,
      status: PayoutStatus.fromString(json['status'] as String? ?? 'pending'),
      externalId: json['externalId'] as String?,
      momoRefId: json['momoRefId'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
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
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      ownerPhone: json['ownerPhone'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );
  }
}

/// Request model for requesting a payout
class PayoutRequest {
  final String causeId;
  final String amount;
  final String currency;

  PayoutRequest({
    required this.causeId,
    required this.amount,
    this.currency = 'XAF',
  });

  Map<String, dynamic> toJson() {
    return {
      'causeId': causeId,
      'amount': amount,
      'currency': currency,
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
      payoutId: json['payoutId'] as String,
      externalId: json['externalId'] as String,
      status: json['status'] as String,
      momoRefId: json['momoRefId'] as String?,
      transferInitiated: json['transferInitiated'] as bool,
      amount: json['amount'].toString(),
      currency: json['currency'] as String,
      availableBalanceAfter: json['availableBalanceAfter'] != null 
          ? (json['availableBalanceAfter'] as num).toDouble() 
          : null,
      transferError: json['transferError'] as String?,
    );
  }
}
