---
description: This section lists the technical capabilities of this Building Block.
---

# 6 Functional Requirements

## 6.1 Payments Building Block Components

The following components are needed to achieve the technical functionalities of the Payments Building Block.

![Payments building block diagrams.drawio - diagrams.net](.gitbook/assets/image22.png)

### 6.1.1 API Management Gateway <a href="#docs-internal-guid-ccd3b00d-7fff-3413-9366-be54b42a4a46" id="docs-internal-guid-ccd3b00d-7fff-3413-9366-be54b42a4a46"></a>

Handles all the API messaging calls and API access control verification from other BBs to the Payments BB and vice versa as well as within the Payments BB. All requests from other BBs first go through the API gateway. The gateway then routes requests to the appropriate application/service. The API Management gateway will:

* Use Identity and access management for authentication.
* Perform input validation checks to prevent oversized message attacks, SQL injection attacks as well as JSON and XML threats.
* Require authentication for all API users.
* Manage access quotas and throttling.
* Log all API calls.
* Allow API providers to limit the rate of consumption for all API users.
* Transform backend error messages into standardized messages so that all error messages look similar; this also eliminates exposing the backend code structure.

### 6.1.2 Payment Orchestration

Payments orchestration provides for end-to-end workflow across different sub-subsystems, enables asynchronous processing, and covers different payment types, use cases, account systems, and channels.

The orchestration relates different sub-components or microservices whereby it:

* Explicitly defines and models workflows that span multiple microservices.
* Provides detailed visibility into how a workflow is performing and identifying where there are issues.
* Ensure that within a defined workflow, all workflow instances are completed according to plan, even when there are issues along the way.

Payments orchestration is used to configure the Payments Building Block functionalities to be exercised during a specific workflow.

### 6.1.3 Voucher Management System

The voucher management system is responsible for provisioning, storage, issuance, activation, redemption, validation, suspension, unsuspension, purging, and reporting on vouchers.

#### **6.1.3.1 Voucher Provisioning**

This process traditionally involves the generation of group vouchers against some authorized value (budget release or allotment).

* Each voucher should have a unique secret voucher number, a unique identification number (voucher serial number) indicating its position in an inventory of issued vouchers, and is linked to a fixed amount of value in a particular currency. Vouchers will also be associated with a voucher group during provisioning. Voucher serial numbers will be unique across currencies should there be vouchers of multiple currencies.
* The vouchers should be created with an expiry date and MUST be stored securely. All vouchers will be expected to have the same duration of expiry and this expiry period will be from the moment the voucher is activated.
* Alternative design options include dynamically creating a voucher at transaction time and creating variable amounts, but this increases complexity and requires tighter operational controls.

#### **6.1.3.2 Voucher Issuance**

This process involves the Registration BB (or any other BB for that matter) requesting a voucher number from the voucher management system through an API.

Once confirmation is received that the voucher has been released it flags the voucher as activated. Design decisions include making this step optional. Having an additional step increases security by ensuring that the voucher is not used until it is in the hands of the beneficiary.

Once a voucher has been issued by the calling building block (Registration BB) it will be presented to the beneficiary in a form that is determined by the calling building block (refer to voucher workflow). The format of the final voucher presentation will be determined by the function of the calling Building Block. At a minimum, this presentation should have the voucher number as well as the voucher serial number. it could also have the details of the beneficiary, which when placed on the voucher presentation, will help the merchant authenticate the beneficiary at the point of redemption.

#### **6.1.3.3 Voucher Redemption**

In the redemption process, the merchant will authenticate the beneficiary and use a predefined technology (Unstructured Supplementary Service Data, Mobile App, Web Browser) to extract the voucher number and call a redemption API through the relevant calling Building Block. The calling Building Block may also validate the beneficiary details if so required. The Building Block will also be able to validate the merchant and determine the voucher group to which the merchant belongs. Lastly, the calling Building Block will invoke the Payment Building Block Redeem API, through the Payment Building Block API Management gateway, to validate the voucher and if valid to redeem it.

Once the voucher is validated, the Voucher Management System should invoke an API on the Payment Gateway to effect the payment in the merchant or agent wallet or bank account (depending on what was set up at merchant/agent registration. The payment gateway/switch will debit a pre-funded account/wallet and credit the merchant/agent account/wallet. The successful execution will result in the voucher being flagged as consumed/used.

#### 6.1.4 VMS API interface

The details of the VMS APIs are described in the Service API section.

The VMS functionality can be accessed by four external APIs:

* **Voucher preactivate**: An API call to pre-activate the voucher and get a voucher number, a voucher serial number, and an expiry date.
* **Voucher activate**: An API call to activate the vouchers by serial number.
* **Voucher validity**: An API call to check the validity of a voucher by serial number.
* **Voucher redeem**: An API to redeem the voucher by voucher number.

The API interface should provide a minimum of five internal API calls.

* Voucher preactivation: An API to pre-activate the voucher and get a voucher number, a voucher serial number, and an expiry date.
* Voucher activation: A call to activate the voucher, by serial number.
* Voucher validity:
  * A call to check the validity of the voucher by serial number.
  * A call to check the validity of the voucher by voucher number and group.
* Voucher consumption: A call to consume the voucher by voucher number.

#### 6.1.5 Voucher Storage

The voucher management server shall have a storage subsystem to store the vouchers.

* Vouchers must be stored in secure but high-performance data storage (READ access will marginally exceed WRITE access).
* The storage of the voucher number will require encryption of data at rest and in motion (unless the channel is encrypted).
* Logs generated should NEVER contain the voucher numbers.
* All access to the voucher database MUST be logged.
* Segregation of duty must be done with respect to privileged access to the database and key management of the encryption of the voucher (the level of key management may need to be determined).

#### 6.1.6 Account Lookup Directory Service (Account Mapper)

The account lookup directory service identifies the Financial Service Providers (FSP) where the merchant/agent/payee’s account is located.

The account lookup directory service or mapper simplifies payment routing and is an important component to avoid storing the payment information of the user in the social registry system and preserve the privacy and confidentiality of sensitive information pertaining to the beneficiary.

The account lookup directory service provides a directory that maps the beneficiary's unique identifier (which matches the record in the social registry system) to the transaction account where the beneficiary wishes to receive their G2P payment, allowing the government to address payments to a specific individual. The identifier can be a national ID, phone number, or other number or alias that can uniquely identify individuals across social protection and financial sector databases. The information will be kept in a tokenised form in the account lookup directory service.

In the case where there is a national payment switch, the account lookup directory service will be maintained by the FSPs, In the scenario, where there is no payment switch, the government would need to manage the account lookup directory service and provide a mechanism for linking it to the FSPs.

### 6.1.7 Payment Request Initiation

This request could come from two sources: external or internal. An external source could be another GovStack Building Block (e.g. the Registration BB or Social Benefits Registry BB or Payroll). Either source must be appropriately authenticated and authorized to initiate the request. The initiation could be synchronous (typically for a single payment) or asynchronous (typically for batch payments). The request should contain at a minimum: the payer identifier, the payee identifier, the amount, the currency, the policy, and the initiating source’s unique transaction ID. In the case of the internal payment request, it should also contain an ID provided by the payment orchestration module.

Certain processes in the transaction flow might require proof of intent from the user, for example, entering the PIN/Password or pressing an ’accept‘ key to initiate the payment process. Such events and their outcomes should be recorded for audit trail purposes. However, the PINs and passwords should not be stored in logs or if they have to, PINs and passwords should be hashed out.

#### 6.1.8 Payment Gateway

A payment gateway allows different (digital) financial service providers (FSPs) to:

* Interconnect and exchange information.
* Initiate and receive transactions.
* Accept or reject transactions and debit or credit end-user accounts.

#### 6.1.9 Payment Portal

The payment portal will:

* Enable government payers (departments/ministries/public sector bodies) to make G2P payments through one or multiple FSP/payment service providers.
* Focus on managing, sending, and reconciling payments.
* Connect government agencies to sending and recipient institutions.
* Coordinates sending/receiving of payment requests, and approvals.
* Provide reports across G2P programs, FSPs, and beneficiaries.
* Track payment status and payment history.
* Register FSPs who are entitled to process payments for G2P payments.
* Provide restricted access to authorized FSPs to connect to the portal, to process the payments for beneficiaries who are their customers.
* Automate reconciliation.
* Provide data analytics on payments processed and their status, whether successful or not.

### 6.1.10 Notifications Service

Support different events related to triggering specific actions on payment outcomes such as issuing receipts upon successful payment, automating payments in case of bulk transactions, passing information to other building blocks as necessary, and handling exceptional cases for instance user/system errors amongst others.

All notification events shall have a timestamp associated with them and be kept as part of the audit log.

### 6.1.11 Reconciliation

This should happen at two levels: internally and externally.

* The internal reconciliation will occur between the different sub-blocks within the Payments BB. In order to achieve internal reconciliation the internal payment request initiator should issue a unique ID that will be referenced by subsequent Payments BB sub-blocks in all future calls related to the particular payment. This will allow end-to-end tracing of the transaction within the Payments BB.
* The external reconciliation is more complex as it involves a calling BB which is outside the Payments BB (such as the Registration BB) and a third party (e.g. DFS). Ideally, there needs to be a sequence of IDs that can identify a transaction from start to finish.
* Cross-cutting Prerequisites for reconciliation:
  * The nodes that are under the control of the GovStack should be time synched.
  * IDs should be unique, if possible contain the timestamp, and should not roll over across short ranges.
* Transactions are expected to be irrevocable. Transaction reversals are subject to local regulations. In some countries, a transaction is revoked/clawed back if the beneficiary has not withdrawn the payment within a certain time period. Good practice, from a financial inclusion perspective, is to not claw back. The beneficiary could use this money as savings when needed. The system should allow both configurations.

### 6.1.12 Validation and Verification

Batch files go through a final check to be clean of defects and inconsistencies, to check with external systems as necessary:

* Low-level validation of data types and data completeness.
* Verification of lookup of accounts to ensure that the account information matches the destination system expectation.
* Check for inconsistencies.
* Auto-correct items as possible - consistency logic can be applied to fill in missing formatting if required by recipient banks and telecoms.
* Errors are kicked back to program level or to an internal data review process.

### 6.1.13 Batch Logic and Queuing

* Prepares the batch breakdown on the basis of rulesets governing: which FSPs shall receive, which payments, and other considerations.
* Combines payments with other payments to the same beneficiary.
* At high volumes, batches are queued for processing.
* Detects batch failure rates.

### 6.1.14 Workflow and Scheduling

* In relation to batch logic, payments are scheduled against the availability of systems, throughput limitations, and rules set by programs.
* Regular and repeat payments are scheduled.
* Batches may be given prioritization in the queue.
* Essential control logic may be included here, specific to the individual batch sending and resending.
* Availability of funds in different budget accounts may be incorporated into this process.
* Additional workflow checks as required, including the resending of failed transactions.

### 6.1.15 Event Log

Each component of the Payments block should be capable of producing both application and transaction logs. This is important to ensure that the system can be adequately monitored and troubleshooting can be performed efficiently and effectively.

* Application or event logs will capture events that each component performs and should contain at least the following information:
  * application/user ID
  * event date and time
  * terminal identity (name and/or IP address)
  * event-related information (message or code)
  * event success or failure
* The components should also generate transaction logs that capture at least the following information:
  * transaction date and time
  * transaction source
  * transaction destination
  * supplementary data
  * transaction status (success, failed, in progress)
* The event logs and the transaction logs should NOT capture any sensitive data such as voucher numbers, passwords, etc.
* There should be an individual transaction record for every payment transaction. For example, if a batch payment process is executed there should be a transaction record for each individual transaction and a separate event log for the entire batch.

### 6.1.16 Audit Logging

Audit trails are required to provide assurance on the integrity of the requests received and actions taken on these requests. An audit trail is a chronological record of system activities that is sufficient to enable the reconstruction and examination of the sequence of environments and activities surrounding or leading to an operation, procedure, or event in a transaction from inception to final results. The audit trail shall comply with the following requirements:

* Must be automatically captured by the computer system whenever a payment request is created, modified, or deleted.
* Must be stored in a secure manner and must not be editable by any user, including privileged users. A common approach is to copy/redirect logging to a separate logging server.
* Each audit trail entry must be time-stamped according to a controlled clock which cannot be altered. The time should either be based on central server time or a local time, so long as it is clear in which time zone the entry was performed.
* Each audit trail entry must be traceable, i.e. attributable to the individual responsible for the direct data input. Updates made to data records must not obscure previous values and where required by regulation the reason for changing the data must also be recorded.
* The audit trail must be retained as long as the electronic record is legally required to be stored.
* The audit trail must be available for internal review/audit.
* The auditing system must be self-sufficient, i.e. for auditing/regulatory purposes the information stored by a BC must be enough.
* Audit entries cannot be changed, i.e. the audit BC persisted store should be immutable, and should only support append and not changes or deletes.
* Audit entries should have a pair of fields to store encrypted data and the encryption key id - these are provided by the submitting BCs.
* Querying capabilities:
  * Auditor wants to see all activity in the last X days.
  * Auditor wants to see all activity of action type Y, or from a certain BC.
  * Auditor should be able to request the decryption of encrypted data to an operator.
* Access to the audit store must be securable, so whatever tech is chosen must implement access control mechanisms (ideally that can connect to our Identity and Access Management provider/connector).

### 6.1.17 Reporting

* The data store will be write-only from the core service and should be read-only by external components.
* The data model on the reporting data store can be different from the internal operational data models that the switch uses.
* The component provided by the switch will be translating internal events and internal data models to the external data store models. This component can be replaced.

### 6.1.18 Security layer

Protects the system at the transport and application levels. It provides the necessary APIs for encrypting the data in transit and when stored as well as the digital signatures used for API authentication. The digital signatures are based on public key cryptography using X.509 digital certificates.

At the transport layer:

* All communication between building blocks must use Transport Layer Security (TLS) for client authentication.TLS protocol 1.2 and above should be used to protect the confidentiality and integrity of the data in transit.
* Strong authentication for parties involved in the transactions should be supported.
* Confidentiality of personal information related to the transaction – Information on account data, transaction data, payment credentials, and users’/payee’ personal profiles must never be disclosed to any unauthorized party.
* Non-repudiation of transactions by parties involved.
* Acknowledgement receipt: this will result in creating a trusted communication path for all transactions between each party, by the end users, telecommunication companies, merchants, or banks.
* The messages concerning the payment transaction shall be authenticated.

### 6.1.19 Data Protection

Use of a hardware security module (HSM) or equivalent to provide cryptographic keys for critical functions such as encryption, decryption, and authentication for the use of applications, identities, and databases.

## 6.2 Payments Building Block Technical Requirements

| **Requirement**                                                                                                                                                                                                                                                                                                                               | **Type (Must/Should/May)** |
| --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------- |
| Secure API exposure: All APIs exposed via secure socket connections (HTTPS).                                                                                                                                                                                                                                                                  | MUST                       |
| Client application authorization tokens: Client applications must send authorization tokens in the authorization header of the request to authenticate users and the API Management Gateway will verify whether the token is valid.                                                                                                           | MUST                       |
| Transaction receipting: For each disbursement made by the system, a receipt should be issued to the recipient of the funds containing information about the transaction id, transaction date and time, reason for the payment, details of the payor, and the system should store all receipts issued for easy reference and reconciliation.   | MUST                       |
| Transaction status querying capability                                                                                                                                                                                                                                                                                                        | MUST                       |
| Display details of the transaction to the payer                                                                                                                                                                                                                                                                                               | MUST                       |
| Transaction pre approval: Prior to processing bulk payment and batch payment transactions, the transaction must be authorized and approved in the system.                                                                                                                                                                                     | MUST                       |
| Pre-processing validation of data (well formed data and completeness checks) prior to disbursement.                                                                                                                                                                                                                                           | MUST                       |
| Ability to schedule bulk payments                                                                                                                                                                                                                                                                                                             | MUST                       |
| Support for batch payments                                                                                                                                                                                                                                                                                                                    | MUST                       |
| Ability to lookup payment addresses                                                                                                                                                                                                                                                                                                           | SHOULD                     |
| Error handling and reconciliation                                                                                                                                                                                                                                                                                                             | MUST                       |
| Transaction status logging                                                                                                                                                                                                                                                                                                                    | MUST                       |
| Triggering of payments                                                                                                                                                                                                                                                                                                                        | MUST                       |
| Voucher Management                                                                                                                                                                                                                                                                                                                            |                            |
| Batch generation of vouchers                                                                                                                                                                                                                                                                                                                  | MUST                       |
| Voucher uniqueness and randomness: Voucher pin must be unique and unpredictable.                                                                                                                                                                                                                                                              | MUST                       |
| Secure voucher data storage                                                                                                                                                                                                                                                                                                                   | MUST                       |
| High availability of storage                                                                                                                                                                                                                                                                                                                  | MUST                       |
| Expose APIs that can be invoked by voucher serial number for purposes of querying a voucher, suspending, or unsuspending a voucher.                                                                                                                                                                                                           | MUST                       |
| Support an API that can be invoked to redeem a voucher using the voucher number.                                                                                                                                                                                                                                                              | MUST                       |
| Support an API that can invoke payment gateway                                                                                                                                                                                                                                                                                                | MUST                       |
| Mobile Payments                                                                                                                                                                                                                                                                                                                               |                            |
| Real time debiting/crediting of mobile money accounts                                                                                                                                                                                                                                                                                         | SHOULD                     |
| Regular balance reconciliation with disbursement Agency                                                                                                                                                                                                                                                                                       | MUST                       |
| Documented process for partners to dispute transaction records                                                                                                                                                                                                                                                                                | MUST                       |
| Target account identifier or lookup of payment address                                                                                                                                                                                                                                                                                        | MUST                       |
| Ability to retrieve details of completed transactions in the batch                                                                                                                                                                                                                                                                            | MUST                       |
| Bulk Payments                                                                                                                                                                                                                                                                                                                                 |                            |
| Ability to securely receive bulk payment requests as a single HTTPS request containing data for multiple transactions. The transaction data (with payment instructions data) is passed format and will be compatible with ISO 20022.                                                                                                          | MUST                       |
| The number of transactions that can be included in a single batch is limited by the size of the file upload and the processing time. If the number of transactions in the file exceeds the file size and could impact the performance of the system, the batch should be split into multiple batch requests.                                  | MUST                       |
| Batch files should be verified for any errors and validated as per business rules and regulations before it is accepted as a valid bulk payment file.                                                                                                                                                                                         | MUST                       |
| Batch files containing duplicate payments will not be processed and an error will be generated.                                                                                                                                                                                                                                               | MUST                       |
| The bulk payment process has to be explicitly triggered by an authorized user. All requests to the Bulk Payment Application API must be authorized and digitally signed by the person initiating the bulk payment request.                                                                                                                    | MUST                       |
| The batch file for bulk payments should contain the beneficiary ID token, and the amount to be paid. The payment information is not included in the batch file for security and privacy but is resolved by the verification and validation component of the bulk payment service by invoking the Account Lookup Directory Service (ALDS/ALS). | MUST                       |
| The Bulk Payment Application API shall inspect the batch disbursement file and split transactions into bank payments and non-bank payments (e.g. Mobile money) in separate payment files before initiating the call to the Payment Gateway.                                                                                                   | MUST                       |
| The status of the bulk payment transaction can be obtained from the event log. The payment status code indicates the status of a single payment transaction and will be according to ISO 20022 Payment status codes table.                                                                                                                    | MUST                       |
