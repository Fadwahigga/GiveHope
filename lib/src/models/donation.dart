import 'cause.dart';

/// Represents the status of a donation
enum DonationStatus {
  pending,
  success,
  failed;

  static DonationStatus fromString(String status) {
    switch (status.toLowerCase()) {
      case 'success':
      case 'successful':
        return DonationStatus.success;
      case 'failed':
        return DonationStatus.failed;
      case 'pending':
      default:
        return DonationStatus.pending;
    }
  }

  String toJson() => name;
}

/// Represents a donation made to a cause
class Donation {
  final String id;
  final String causeId;
  final String donorPhone;
  final String amount;
  final String currency;
  final DonationStatus status;
  final String? externalId;
  final String? momoRefId;
  final String? payerMessage;
  final String? payeeNote;
  final DateTime createdAt;
  final DateTime updatedAt;
  final Cause? cause;

  Donation({
    required this.id,
    required this.causeId,
    required this.donorPhone,
    required this.amount,
    required this.currency,
    this.status = DonationStatus.pending,
    this.externalId,
    this.momoRefId,
    this.payerMessage,
    this.payeeNote,
    required this.createdAt,
    required this.updatedAt,
    this.cause,
  });

  /// Get amount as double
  double get amountValue => double.tryParse(amount) ?? 0.0;

  /// Creates a Donation from JSON map
  factory Donation.fromJson(Map<String, dynamic> json) {
    return Donation(
      id: json['id']?.toString() ?? '',
      causeId: json['causeId']?.toString() ?? '',
      donorPhone: json['donorPhone']?.toString() ?? '',
      amount: json['amount']?.toString() ?? '0',
      currency: json['currency']?.toString() ?? 'XAF',
      status: DonationStatus.fromString(json['status']?.toString() ?? 'pending'),
      externalId: json['externalId']?.toString(),
      momoRefId: json['momoRefId']?.toString(),
      payerMessage: json['payerMessage']?.toString(),
      payeeNote: json['payeeNote']?.toString(),
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'].toString())
          : DateTime.now(),
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'].toString())
          : DateTime.now(),
      cause: json['cause'] != null 
          ? Cause.fromJson(json['cause'] as Map<String, dynamic>) 
          : null,
    );
  }

  /// Converts the Donation to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'causeId': causeId,
      'donorPhone': donorPhone,
      'amount': amount,
      'currency': currency,
      'status': status.toJson(),
      'externalId': externalId,
      'momoRefId': momoRefId,
      'payerMessage': payerMessage,
      'payeeNote': payeeNote,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  /// Creates a copy of this Donation with the given fields replaced
  Donation copyWith({
    String? id,
    String? causeId,
    String? donorPhone,
    String? amount,
    String? currency,
    DonationStatus? status,
    String? externalId,
    String? momoRefId,
    String? payerMessage,
    String? payeeNote,
    DateTime? createdAt,
    DateTime? updatedAt,
    Cause? cause,
  }) {
    return Donation(
      id: id ?? this.id,
      causeId: causeId ?? this.causeId,
      donorPhone: donorPhone ?? this.donorPhone,
      amount: amount ?? this.amount,
      currency: currency ?? this.currency,
      status: status ?? this.status,
      externalId: externalId ?? this.externalId,
      momoRefId: momoRefId ?? this.momoRefId,
      payerMessage: payerMessage ?? this.payerMessage,
      payeeNote: payeeNote ?? this.payeeNote,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      cause: cause ?? this.cause,
    );
  }

  @override
  String toString() {
    return 'Donation(id: $id, amount: $amount $currency, status: ${status.name})';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Donation && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}

/// Request model for making a donation
class DonationRequest {
  final String causeId;
  final String amount;
  final String currency;
  final String donorPhone;
  final String? payerMessage;

  DonationRequest({
    required this.causeId,
    required this.amount,
    this.currency = 'XAF',
    required this.donorPhone,
    this.payerMessage,
  });

  Map<String, dynamic> toJson() {
    return {
      'causeId': causeId,
      'amount': amount,
      'currency': currency,
      'donorPhone': donorPhone,
      'payerMessage': payerMessage,
    };
  }
}

/// Response from creating a donation
class DonationResponse {
  final String donationId;
  final String externalId;
  final String status;
  final String? momoRefId;
  final bool paymentInitiated;
  final String amount;
  final String currency;
  final String? paymentError;

  DonationResponse({
    required this.donationId,
    required this.externalId,
    required this.status,
    this.momoRefId,
    required this.paymentInitiated,
    required this.amount,
    required this.currency,
    this.paymentError,
  });

  factory DonationResponse.fromJson(Map<String, dynamic> json) {
    return DonationResponse(
      donationId: json['donationId']?.toString() ?? '',
      externalId: json['externalId']?.toString() ?? '',
      status: json['status']?.toString() ?? 'pending',
      momoRefId: json['momoRefId']?.toString(),
      paymentInitiated: json['paymentInitiated'] == true,
      amount: json['amount']?.toString() ?? '0',
      currency: json['currency']?.toString() ?? 'XAF',
      paymentError: json['paymentError']?.toString(),
    );
  }
}
