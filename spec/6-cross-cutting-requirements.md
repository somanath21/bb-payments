---
description: >-
  This section will highlight important requirements or describe any additional
  cross-cutting requirements that apply to this Building Block.
---

# 5 Cross-Cutting Requirements

## 5.1 External Identification, Registration, and Enrollment Logic (REQUIRED)

The Payments Building Block assumes that all identification, registration, and enrollment logic is done externally and are compliant with regulated payments and banking systems within a jurisdiction.

## 5.2 Registration Requirements (RECOMMENDED)

The Payment System or Scheme in a country may require that participating payor or payee entities, whether health clinics, ministries, or individuals must have been registered with a regulated banking or non-banking entity prior to the use of the Payments Building Block.

## 5.3 Compliance Verification (OPTIONAL)

In the context of Central Bank Digital Currency or Central Bank Accounts for individuals, the payment system block would assume that the regulatory conditions must have been verified for compliance and that payor and payee entities must have been properly registered according to the rules in that scheme.

## 5.4 Statutory and Operational Requirements (REQUIRED)

The Payments Building Block assumes that the statutory and operational requirements around accounts (i.e. know your customer/anti-money laundering/counter-terrorist financing) must have been completed by an outside system, which is capable of communicating that status in appropriate timeframes.

## 5.5 Real-time Response (RECOMMENDED)

The Payments Building Block assumes that the capabilities of the underlying infrastructure must enable transactions to meet a predefined limit to turn-around-time in real-time response.

## 5.6 Validation (REQUIRED)

The Payments Building Block should have the ability to validate against a set of external systems for the status of an account, account address and routing information, confirmation of payment, and various error conditions of accounts and specific payments.

## 5.7 Authorization (RECOMMENDED)

During operation in certain modes, the Payments Block would be validating against authorizations/releases or allotments provided by the treasury systems for the source of funds.

## 5.8 Eligibility Verification (RECOMMENDED)

Normally, verification of eligibility of beneficiaries for the service should be done in another Block.

## 5.9 Budget Availability (REQUIRED)

Budget availability must be checked before voucher creation is requested.

## 5.10 Calculation of Payments (OPTIONAL)

Calculations of payments may depend on several attributes laid down by a specific program.

## 5.11 Payment Systems (REQUIRED)

Payment systems in the market, either provided by a public entity, a quasi-public entity, or a purely commercial player, are required for the functioning of this Building Block.

## 5.12 Settlement (REQUIRED)

Settlement (gross or net) must be handled externally to this Building Block.

## 5.13 Security (REQUIRED)

The Payments Building Block must meet the security requirements described in the Security Building Block.

## 5.14 API Mechanisms (REQUIRED)

The Payments Building Block should meet the mechanisms for consuming and publishing APIs as described in the Information Mediator Building Block.

## 5.15 Architecture (REQUIRED)

The Payments Building Block must meet the requirements described in the Architecture Building Block.

### Infrastructure Requirements <a href="#docs-internal-guid-c5cf6da5-7fff-ad96-4712-4d822a57777d" id="docs-internal-guid-c5cf6da5-7fff-ad96-4712-4d822a57777d"></a>

#### 5.16 Mobile Money

Infrastructure Components:

* Account lookup - directory service.
* Payment portal.
* Payment gateway (only in selected scenarios).
* Payment request initiation.
* Notification service.

Mobile money is a destination account to distribute funds to end users (in the case of G2P) or an initiation account to enable users to initiate a payment for government services (P2G) which is facilitated by private commercial entities, typically Mobile Network Operators.

There are three ways that facilitate interoperability between a mobile money provider and a financial service institution (which could be the initiator of a payment - G2P or the receive - P2G): Through a Switch, through a third-party aggregator or through a bilateral integration. We expect one or multiple of these components to be in place to facilitate the use cases discussed in this document but these will remain out of the Payment Building Block.

#### 5.17 Vouchers

Infrastructure Components:&#x20;

* Voucher Management System.&#x20;
* Merchant Ecosystem.
* Merchant Registry.

The Merchant Ecosystem and the Merchant Registry are both outside the scope of the Payments Building Block. The development of the Merchant Ecosystem will be driven by the relevant government institution. The Merchant Registry will be managed by another Building Block.
