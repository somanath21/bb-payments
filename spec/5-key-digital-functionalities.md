---
description: >-
  Key Digital Functionalities describe the core (required) functions that this
  Building Block must be able to perform.
---

# 4 Key Digital Functionalities

## 4.1 General Key Functionalities of the Payments Building Block

In general, the functionalities below describe the activities/actions that are performed in the Payments Building Block.

1. Enable government programs to channel payments through a shared payments infrastructure to accounts at multiple providers, allowing citizens to choose their preferred Financial Services Provider (FSP) and switch providers if their circumstances change or they discover a better service.
2. Connect securely and interact with registry, identity, and other Building Blocks through the Information Mediation Building Block.
3. Handle payments processing and orchestration, including verification of user information, confirmation of payee details, verification of destination account for the beneficiary, fee calculation, and handling of automated bulk transactions.
4. Send receipts, notifications, and acknowledgement of receipts in a secure manner to payers and other external applications to receive confirmation of payment made and safekeeping of a record of the receipt that was sent.
5. Provides for auditability of the Payments Building Block to have its controls evaluated for effectiveness, efficiency, and security, including tracing transactions, identifying users who access the system, clearly defined system controls, and compliance with local regulations and global best practices.
6. Schedule and aggregate payments to individuals, allowing programs to stagger payments or combine with other payments to the same groups of individuals.
7. Enable payment confirmation through secure receipts, notifications, and acknowledgement of receipts to payers and other external applications.
8. Store event logs and audit trails for all transactions processed and their outcomes for monitoring and audit purposes.
9. Validate data structures and content to ensure that it is not missing key pieces of information, including verifying the destination account and triggering a different process if the account is not in good status.
10. Break down bulk payments into batches that can be handled efficiently or create a queue mechanism whereby the list is sequentially processed with throttling to reduce the flow of payment initiated.
11. Coordinate or orchestrate the validation, verification, batching, and scheduling using a set of rules, including options for kicking back to the operator for review or resubmission in certain error cases.
12. Generate reconciliation of accounts based on the successful sending of funds into accounts and reports to show the additional status of systems and payment types and timings.
13. Manage fees in a centralized way and support the use of digital channels to/from end-users, regulated account systems with payment signaling, and notifications by the FSP enablers.
14. Scale on transaction performance, transaction latency, reliability, resilience, and graceful service degradation.
15. Support digital tools for query management, including beneficiary queries and complaints about the payment services.
16. Route bulk payments through the account holding the funds, either at the government Treasury or a commercial bank.
17. Release funds by the Ministry or payroll master after appropriate approvals.
18. Handle processing and orchestration of bulk payments, including verification of user information, confirmation of payee details, verification of destination account for the beneficiary, fee calculation, and handling of automated bulk transactions.
19. Validate data structures and content to ensure that key information is not missing.
20. Break down bulk payments into batches that can be handled efficiently or create a queue mechanism whereby the list is sequentially processed.
21. Generate reconciliation of accounts based on successful sending of funds into accounts.
22. Provision, issue, activate, and redeem vouchers to support G2P beneficiary payments.
23. Ensure that adequate funds have been allocated to the voucher during provisioning.
24. Allow issuance of vouchers but make them unusable until they are in the hands of the beneficiary.
25. Activate vouchers to make them usable for predefined use cases and for a certain period of time.
26. Handle redemption of vouchers so that beneficiaries receive appropriate benefits from third parties.
27. Generate reports that show the vouchers in their different states as well as the aggregate quantity "stock", which triggers requests for "re-stocking" of vouchers.
28. Authenticate beneficiaries at the point of redemption by checking the Digital Registries Building Block to authenticate the user.

The following requirements would be implemented by the Payment Building Block:

* Cater for the distribution of social service transfers electronically and cash safely to end users (in the case where the user does not want to use electronic payments it is recommended that vouchers are used).
* Creates eVouchers to disburse financial subsidies in a controlled and safe manner.
* Responds to payers to provide information about the status of the payments (e.g. confirmation of payment, insufficient balance or a mismatch in credentials, transfer failure, etc.), based on the status in the backend applications.
* Posts status of transactions with traceability information into transaction logs.
* Tracks due payment and sent payment notifications through alerting mechanisms, along with associated information.
* Receives triggers for payment collection, posts the amount with relevant disclaimers to the payer, and obtains payer approval.
* Securely posts the approval, user ID, and associated payment information to the appropriate backend (e.g. mobile, debit/credit card, internet banking entities) of relevant financial applications from banks, employers, and insurance; awaits transfer confirmation from those applications.
* Searches and provides a logged information-based query of other applications.
* Able to handle operations in remote and inaccessible locations.

The implementation of the key digital functionalities mentioned above should adhere to the following principles.

## 4.2 Government to Person Payment Principles <a href="#docs-internal-guid-c38a9447-7fff-fcb5-e6eb-c6419072f004" id="docs-internal-guid-c38a9447-7fff-fcb5-e6eb-c6419072f004"></a>

G2P payments architecture should strive to achieve the following principles:

### 4.2.1 Beneficiary/Recipient-related Principles

* Beneficiaries can receive their payment through a fully functional account that allows them to save and make payments using an associated payment instrument with general acceptance.
* They can choose the payment service provider and payment instrument through which they receive their payments based on their informed choice; they can use the same account for multiple G2P payments, make P2G payments and easily switch if desired.
* Onboarding to their payment method is low cost and easy with account opening requirements that are available to recipients and with no opening fees; a payment instrument is provided to the recipient at no cost.
* The Integrated Financial Management Information System (IFMIS) is used to process government payments against budgetary allocations. It supports
  * the Treasury Single Account (TSA) that aggregates all incoming government receipts and disburses all government payments&#x20;
  * budget management to ensure budget compliance, tracking, and reporting. The IFMIS provides the Ministry of Finance with a unified view of the government’s budget execution.
* The payment instrument is easy-to-use and generally accepted, and the overall costs for using it do not result in increased costs for the beneficiary in comparison to other forms of payment.
* Beneficiaries are well informed, their account/data is protected, and have access to redress. They know when, where, and how many payments will be made and understand how their payment method works, its costs, how to use their payment instrument, and how to access their payment. They can access and know how to access effective grievance redressal mechanisms, their funds are secured, and their data privacy is ensured.
* Beneficiaries can easily access their funds. They are able to cash out their funds at any time at a wide range of conveniently close financial access points. At a reasonable and clearly communicated withdrawal fee or at no cost.
* Beneficiaries are included regardless of gender, race, or other immutable characteristics, through at least one of the payment methods used; gender gaps are considered in the design.

### 4.2.2 Infrastructure and Systems-related Principles

* The leveraged infrastructures and systems are shared across G2P programs and payment streams, as well as other use cases, avoiding the implementation of systems to exclusively deliver G2P payments. They are scalable and have cyber security arrangements in place.
* Common ID provides access to multiple programs; the national ID system has high coverage and quality; it allows government agencies and payment service providers to validate recipients’ identities; it enables data sharing across government agencies.
* Payment processing systems unlike social protection management information systems, pension, and payroll systems will not include gender-disaggregated data.
* The payment systems are interoperable to maximize the potential of the available infrastructure to recipients; interoperability arrangements exist for Integrated Financial Management Information System (IFMIS), Treasury Single Account (TSA), banks, and non-banks covering most channels and instruments.
* There is no manual intervention in the disbursement process and the entire payments flow is Straight-Through-Processing, including the reconciliation of payments. Payments are made without delays.

### 4.2.3 Payment Services Provider-related Principles

* Payment service providers have a strong and long-term, predictable business case or incentives to deliver payments and provide choice.
* A large variety of bank and non-bank financial institutions operating in a competitive market are used to deliver G2P payments.
* Agents of bank and non-bank financial institutions are accessible to G2P payment recipients.
