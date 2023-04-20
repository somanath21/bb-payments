---
description: >-
  Key Digital Functionalities describe the core (required) functions that this
  Building Block must be able to perform.
---

# 4 Key Digital Functionalities

The Payment Building Block will handle payments processing and orchestration, including verification of user information, confirmation of payee details, verification of destination account for the beneficiary, fee calculation, and handling of automated bulk transactions.

The Building Block will enable government programs to channel payments through a shared payments infrastructure to accounts at multiple providers, allowing citizens to choose their preferred Financial Services Provider and switch providers if their circumstances change or they discover a better service.

### 4.1 Payment Orchestration

Payments orchestration provides for end-to-end workflow across different sub-subsystems, enables asynchronous processing, and covers different payment types, use cases, account systems, and channels.

### 4.2 Voucher Management

The Payment Building Block will provide a voucher management system which is responsible for provisioning, storage, issuance, activation, redemption, validation, suspension, unsuspension, purging, and reporting on vouchers.

### 4.3 Account Lookup Services (Account Mapper)

The account lookup directory service identifies the Financial Service Providers (FSP) where the merchant/agent/payee’s account is located.

The account lookup directory service or mapper simplifies payment routing and is an important component to avoid storing the payment information of the user in the social registry system and preserve the privacy and confidentiality of sensitive information pertaining to the beneficiary.

### 4.4 Payment Request Initiation

The Payment Building Block must allow systems to initiate a payment request. This request could come from two sources: external or internal. An external source could be another GovStack Building Block (e.g. the Registration Building Block or Social Benefits Registry Building Block or Payroll).&#x20;

### 4.5 Payment Gateway

The Payments Building Block should provide a payment gateway which allows different (digital) Financial Service Providers (FSPs) to interoperate.

### 4.6 Payment Portal

The Payments Building Block should provide a Payment Portal which allows users to manage thje full lifecycle of sending and receiving payments

### 4.7 Event Management

The Payment Building block must support different events related to triggering specific actions on payment outcomes such as issuing receipts upon successful payment, automating payments in case of bulk transactions, passing information to other Building Blocks as necessary, and handling exceptional cases for instance user/system errors amongst others.

### 4.8 Reconciliation

The Payments Building block must implement functionality that provides both internal and external reconciliation services.&#x20;

### 4.9 Batch Processing

The Payments Building Block should provide batch processing services&#x20;

### 4.10 Scheduling Services

The Payments Building Block should provide scheduling services to perform tasks on a regular or repeated basis

### 4.11 Event Logging

Each component of the Payments Building Block should be capable of producing both application and transaction logs. This is important to ensure that the system can be adequately monitored and troubleshooting can be performed efficiently and effectively.

### 4.12 Audit Logging

Audit trails are required to provide assurance of the integrity of the requests received and actions taken on these requests. An audit trail is a chronological record of system activities that is sufficient to enable the reconstruction and examination of the sequence of environments and activities surrounding or leading to an operation, procedure, or event in a transaction from inception to final results. The audit trail shall comply with the following requirements:

### 4.13 Reporting Services

The Building Block should provide reporting services, which may consist of dashboards or analytics reports. These reports should be configurable based on user needs.

### 4.14 Security layer

The Payments Building Block must provide a security layer which protects the system at the transport and application levels. It provides the necessary APIs for encrypting the data in transit and when stored as well as the digital signatures used for API authentication.

### 4.15 Bulk payment service

The Payments Building Block must provide a bulk payment services. This bulk payment service is invoked in the case of G2P bulk disbursement.



## 4.2 Out of Scope Assumptions\*\*WIP <a href="#docs-internal-guid-39459612-7fff-54dd-0f25-ddf61408bb48" id="docs-internal-guid-39459612-7fff-54dd-0f25-ddf61408bb48"></a>

* Payment scheme creation is outside of the scope of the current Payments Building Block
* Government to Business and Government to Government Payments are out of scope for the first phase and will be considered in the second phase.
* Identity systems are separate and outside the Payments Building Block, with key implications for KYC(Know Your Customer)/CDD(Customer Due Diligence) in the banking system.
* Consent of people eligible as beneficiaries of G2P programs for their personal details (i.e. National ID and payments details) to be stored in the tokenized form in the centralized mapper (where the government has to implement the mapper).
* Delegation of authority - Consent of the recipient for payment of G2P to be made to a third party (next of kin) is outside the scope of the Payments Building Block. It should be handled by the consent management building block at the time of beneficiary registration for the G2P program.
* For social benefits G2P payments, social registries are an essential Building Block that will implement the registration and determination of potential eligibility of citizens for one or more social programs. As such, they are a separate Building Block and are outside the Payments Building Block.
* An Integrated Financial Management Information System (IFMIS) and a Treasury Single Account (TSA) are essential components in improving the safety and efficiency of government payment programs. The TSA, in particular, ensures effective aggregate control over government cash balances and facilitates the reconciliation between banking and account data. It is assumed that these components exist at the level of the government as they are outside the scope of the Payments Building Block.
* Settlement systems are outside of the scope, Settlement allows the flow of money between participants and can be done on a Pre-funding basis which allows incoming transactions if the sending Digital Financial Service Provider (DFSP) has already deposited sufficient liquidity with them. Alternatively, settlement can be on a Clearing-base where FSPs allow incoming transactions before receiving the funds.
* Pricing. This generally revolves around processing fees (for each transaction a fixed fee is paid to the entity processing the transaction) and interchange (where one participant agrees to pay the other).
* Dispute resolution mechanisms allow FSPs to reach a consensus on a transaction’s status and financial liabilities in the case of a dispute. There are two main dispute resolution mechanisms: the consensus option where parties must agree on a transaction’s status; and the arbitration option where one party has authority over a transaction’s status.
* Governance defines sets of rules on how participants make decisions.
* Development of the voucher management ecosystem that is outside the technical specification of the Payments Building Block, including but not restricted to recruitment and registration of merchants/agents for the redemption of vouchers, etc.
