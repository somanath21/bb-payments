# 5 Key Digital Functionalities

The payments building block provides functionalities to cater for the following payment types:&#x20;

* Government to person (G2P) payments such as:&#x20;
  * periodic bulk payments such as salary payments,&#x20;
  * unconditional social cash transfer: Cash payments provided to financially disadvantaged or vulnerable people or households without requiring anything in return. The unconditional cash transfer should support different modes/channels for payments: bank payments, voucher payments, mobile money payments and other electronic channels.&#x20;
  * conditional cash transfer: Cash payments provided to financially disadvantaged or vulnerable people or households aimed at changing behaviors. The payments are conditional depending upon the recipient's actions.
* Person to Government (P2G) payments: support payments for government services e.g payment of government fees, driving licenses, utility payments.

The following requirements below would be implemented by the payments BB:

* Cater for the distribution of social service transfers electronically and cash safely to end users (in the case where the user does not want to use electronic payments, it is recommended that vouchers are used).
* Creates eVouchers to disburse financial subsidies in a controlled and safe manner.
* Responds to payers to provide information about the status of the payments (e.g  confirmation of payment, insufficient balance or a mismatch in credentials, transfer failure, etc,). based on status in the backend applications.
* Posts status of transactions with traceability information into transaction logs.
* Tracks due payment and sent payment notifications through alerting mechanisms, along with associated information.
* Receives triggers for payment collection, posts the amount with relevant disclaimers to payer and obtains payer approval.
* Securely posts the approval, user ID and associated payment information to appropriate backend (eg mobile, debit/credit card, Internet banking entities) of relevant financial applications from banks, employers, insurance; awaits transfer confirmation from those applications.
* Searches and provides a logged information-based query of other applications.
* Able to handle  operations  in remote and inaccessible locations

## 5.1 Government to Person Payment Principles <a href="#docs-internal-guid-c38a9447-7fff-fcb5-e6eb-c6419072f004" id="docs-internal-guid-c38a9447-7fff-fcb5-e6eb-c6419072f004"></a>

G2P payments architecture should strive to achieve the following principles:

### 5.1.1 Beneficiary/Recipient-related Principles      &#x20;

* Beneficiaries can receive their payment through a fully functional account that allows them to save and make payments using an associated payment instrument with general acceptance.
* They can choose the payment service provider and payment instrument through which they receive their payments based on their informed choice; they can use the same account for multiple G2P payments, make P2G payments and easily switch if desired.
* Onboarding to their payment method is low cost and easy with account opening requirements that are available to recipients and with no opening fees; a payment instrument is provided to the recipient at no cost.
* The integrated Financial Management Information System (IFMIS) is used to process government payments against the budgetary allocations. It supports  (1) the Treasury Single Account (TSA) that aggregates all incoming government receipts and disburses all government payments and (2) budget management to ensure budget compliance, tracking, and reporting. The Integrated Financial Management Information System (IFMIS) provides the Ministry of Finance with a unified view of the government’s budget execution.
* The payment instrument is easy-to-use and generally accepted and the overall costs for using it do not result in increased costs for the beneficiary in comparison to other forms of payment.
* Beneficiaries are well informed, their accounts/data is protected and have access to redress. They know when, where, and how much payments will be made and understand how their payment method works, its costs, how to use their payment instrument and how to access their payment. They can access and know how to access effective grievance redressal mechanisms, their funds are secured, and their data privacy is ensured.
* Beneficiaries can easily access their funds. They are able to cash-out their funds at any time at a wide range of conveniently close financial access points. at a reasonable and clearly communicated withdrawal fee or at no cost.
* Beneficiaries are included regardless of gender, race or other immutable characteristic, through at least one of the payment methods used; Gender gaps are considered in the design.

### 5.1.2 Infrastructure and Systems-related Principles

* The leveraged infrastructures and systems are shared across G2P programs and payment streams, as well as other use cases, avoiding the implementation of systems to exclusively deliver G2P payments. They are scalable and have cyber security arrangements in place.
* Common ID provides access to multiple programs; the national ID system has high coverage and quality; it allows government agencies and payment service providers to validate recipients’ identities; it enables data sharing across government agencies.
* Payment processing systems unlike social protection management information systems, pension and payroll systems will not include gender disaggregated data.
* The payments systems are interoperable to maximize the potential of the available infrastructure to recipients; interoperability arrangements exist for Integrated Financial Management Information System (IFMIS), Treasury Single Account (TSA), banks and non-banks covering most channels and instruments. &#x20;
* There is no manual intervention on the disbursement process and the entire payments flow is Straight-Through-Processing, including reconciliation of payments. Payments are made without delays.

### 5.1.3 Payment Services Provider- related Principles

* Payment service providers have a strong and long-term, predictable business case or incentives to deliver payments and provide choice.
* Large variety of bank and non-bank financial institutions operating in a competitive market are used to deliver G2P payments.
* Agents of bank and non-bank financial institutions are accessible to G2P payment recipients.

### 5.2 General Key Functionalities of the Payments Building Block&#x20;

In general the functions below describe the activities/actions that are performed in the payments building block:

The payment BB architecture should:

* Allow any government program to channel payments through a shared payments infrastructure to accounts at multiple providers. This enables citizens to choose their preferred financial services provider. It enables citizens to switch providers if their circumstances change or they discover a better service.
* Connect securely and interact with registry, identity, and other important building blocks through the information mediator building block.
* Payments processing and orchestration: Handle the processing of the transactions before moving to the payment. This would include the following:
  * Check that the information provided by the user is correct and meets the requirements for the service being requested.
  * Get the confirmation of the payee on the details submitted or looked up via external id-account mapping.&#x20;
  * Verify the destination account for the beneficiary to be in good standing - e.g. the bank has not noted a suspicious account, or suspended the account for another reason.&#x20;
* Return information from external systems on fees to be charged by providers.&#x20;
* Handle automated bulk transactions (e.g. payroll, social benefits disbursement)
* Send automated requests to the FSP/bank to effect payment to the person in the case of unconditional social cash transfers.
* Keep records of transactions history for audit purposes
* Auditability refers to the ability of the Payment’s Building Block to have its controls evaluated for effectiveness, efficiency and security. Looking at auditability from an effectiveness standpoint, transactions must be capable of being traced to ensure that all transactions (100%) initiated within the systems have been completed, irrespective of whether the transaction was successful or not. This also requires the Payment Building Block to degrade gracefully under conditions of high traffic or node failure so that such conditions are captured in the audit trail. From an effectiveness point of view, auditors must be able to trace the flow of transactions through the system in a logical flow and be able to determine the duration of each part of a transaction to determine if the optimal route is being followed or if there are bottlenecks that need to be addressed.  From a security standpoint, external auditors should be able identify users who access the system and what actions they may perform in the system. In addition, the auditability function will also require the system controls to be clearly defined and access to evidence of their effectiveness either through prevention or escalation and an appreciation of the residual risk.  Lastly, the system will need to be able to show compliance to local regulations and standards which will depend on the country in which it is implemented. If at some point PII or payment data is stored the system should show compliance to global best practices such as PCI-DSS v3 (or the prevailing standard at the time).
* Schedule and aggregate payments to individuals (scheduling, tracking and triggering will be done in scheduling BB if it receives a schedule of payment via an API request, any specific attributes accessible by the scheduler in addition to date/time to access and verify before triggering).
* Payment confirmation: Send receipts, notifications and acknowledgement of receipts in a secure manner such that payers and other external applications (e.g other building blocks) receive confirmation of payment made . It should also include the safekeeping of a record of the receipt that was sent.
* Event logs and audit trails: All transactions processed and their outcomes should be logged and stored securely for monitoring and audit purposes.
* Validation/Verification - The system shall validate data structures and content (i.e the list information) to ensure that it is not missing key pieces of information.  Verification of the destination account is a best practice, whereby the system shall dynamically confirm that the beneficiary's account exists, is in good status, and if not, triggers a different process. &#x20;
* Batch logic/ Queue - The system shall break down the bulk payment into “batches” that can be handled efficiently, or creates a queue mechanism whereby the list is sequentially processed. The logic to reduce the flow of payment initiated (called “throttling”) is contemplated here.&#x20;
* Scheduling - The timing of when such batches are sent is important for many reasons, including programmatic ones.   Programs may seek to stagger payments or to combine with other payments to the same groups of individuals. &#x20;
* Control logic - The system shall coordinate or orchestrate the validation, verification, batching, scheduling using a set of rules.  Such rules also include options for kicking back to the operator for review or resubmission in certain error cases.
* Reconciliation  and Reports Dashboard -  The system shall be capable of generating reconciliation of accounts, based on the successful sending of funds into accounts.  Reports shall show this information and additional status of systems and payment types and timings.
* Fees Calculation - Fees to be paid by the Government should be quoted back to the system and managed in a centralized way.  Fee schedules can also be managed in this component - i.e. pre-negotiated amounts that shall also leave the government source of funds to the various providers involved.&#x20;
* Should support use of digital channels to/from end-users, and all regulated  account systems with payment signaling (e.g. QR codes) and notifications by the FSP enablers.&#x20;
* The system should have the ability to scale on transaction performance (transaction latency, reliability, resilience, graceful service degradation).
* MUST support digital tools for queries management, including beneficiary  queries including complaints about the payment services.&#x20;

## 5.3 Key Functionalities for Bulk Payment&#x20;

Bulk payments are used to accomplish G2P beneficiary payments (eg, payroll, pension plans, and other social protection programs).  Bulk payments have to be routed through the account holding the funds. (This could be either at the government Treasury or a commercial bank). &#x20;

The funds should be released by the Ministry or payroll master and go through appropriate approvals.&#x20;

## 5.4 Key Functionalities for Voucher Disbursement

The voucher component of the Payment Building block should support the provisioning, issuance, activation and redemption of vouchers.

* The **provisioning** process will involve ensuring that adequate funds have been allocated to the voucher.
* The **issuance** process will allow vouchers to be issued but not usable until they are in the hands of the beneficiary.&#x20;
* The **activation** process will make the voucher active and hence usable for certain predefined use cases and for a certain period of time.
* **Redemption**: When the vouchers are appropriately used, the beneficiary receives the appropriate benefit (cash, product or service) from a third party (either an agent or a merchant - e.g. a school).

In terms of the reporting, this is expected to be a standard part of the voucher management system which would be capable of showing the vouchers in their different states as well as the aggregate quantity "stock". Such reports would trigger, either automatically or manually, requests for "re-stocking" of vouchers. Detailed reporting requirements are out of the scope.

The authentication of the beneficiary at the point of redemption, will lie with the calling block which would likely check the Registry building block to authenticate the user. Other flows could involve the voucher management server storing the beneficiary details but this would appear to go against the principle of avoiding duplication. This may also need consideration of consent in cases where delegation applies.
