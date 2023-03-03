# 5 Cross-Cutting Requirements

This section will highlight important requirements or describe any additional cross-cutting requirements that apply to this building block.



The table below summarizes the cross cutting requirements.

| **Requirement**                                           | **Relevant Building Block** | **Type (Must/Should/May)** |
| --------------------------------------------------------- | --------------------------- | -------------------------- |
| Reporting                                                 | Requesting building block   | Must                       |
| Compliance with applicable regulations and laws           | All                         | Must                       |
| Merchant and beneficiary registration                     | Registry                    | Must                       |
| Account lookup and directory services to resolve accounts | All                         | Must                       |

* The Payments Building Block assumes that all identification, registration, and enrollment logic by GovStack components are done externally before using this building block and those elements are presentable if required for compliance with regulated payments and banking systems within a jurisdiction.
* Further, the Payment System or Scheme in a country may require that participating payor or payee entities, whether health clinics, ministries, or individuals must have been registered with a regulated banking or non-banking entity - i.e. for accounts - as understood in that context prior to use of the payments BB.
* In the context of CBDC or Central Bank Accounts for individuals, the payment system block would assume that the regulatory conditions must have been verified for compliance and that payor and payee entities must have been properly registered according to the rules in that scheme.
* The Payments Building Block assumes the conditions of statutory and operational requirements around accounts (i.e. KYC/AML/CFT) must have been completed by an outside system, which are themselves capable of communicating that status in appropriate timeframes.
* The Payments Building Block assumes that capabilities of underlying infrastructure must enable transactions to meet a predefined limit to turn-around-time in real time response\
  (e.g. < 500ms response times) when called for in immediate or instant payment systems and for queuing systems when required for management of high throughput and/or asynchronous systems.
* During operation, the Payment Block should have the ability to validate against a set of external systems for status of account, account address and routing information, confirmation of payment, and various error conditions of accounts and specific payments.
* During operation in certain modes, the Payment Block would be validating against authorizations/releases or allotments provided by the treasury systems for source of funds, and designated third party providers would perform net debit cap management prior to processing the payments. These validations SHOULD be done within the system against the available allotments/funds.
* Normally, verification of eligibility of beneficiaries for the service should be done in another block. If eligibility for a standing instruction is part of the design within this BB, then the responsibility lies with the Enrollment or Payroll system to send such standing instructions and to cancel or revoke such standing instructions.
* Budget availability must be checked before voucher creation is requested. This could be done on a bulk or individual voucher basis. For efficiency, it would be recommended to create vouchers in bulk and then only activate/preactivate them as needed.
* Calculations of payments may depend on several attributes laid down by a specific program such as Unconditional Social Cash Transfer (USCT) or Postpartum Healthcare benefits. Based on these attributes and rules the statement of payments to be disbursed must be generated in respective applications and issued to the payments BB.
*   It is understood that payment systems in the market, either provided by a public entity, a quasi public entity, or a purely commercial player, are required for the functioning of this building block. That is, systemically significant systems play an important role in both origination of payments and termination of payments as well as payment clearing and settlement. To be explicit, settlement (gross or net) must be handled externally to this BB. In the absence of appropriate payment rails, this building block would require additional features and functionality. Such systems MUST provide the following functionality to this use case:

    * Rules by which transactions are initiated, halted, reversed, examined.
    * Destination system for funds and related channels by which the Recipient accesses the funds.
    * Source system for funds and related channels for the individual or institution.

    The payment building block must meet the security requirements described in the [Security building block](../security-requirements/).
* The payments BB should meet the mechanisms for consuming and publishing APIs as described in the [Information mediator BB](../information-mediation/).
* The payment building block must meet the requirements described in the [Architecture building block](../architecture-and-nonfunctional-requirements/).
