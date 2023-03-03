# 2 Description

The Payments Building Block enables digital financial payments to be tracked, evaluated, initiated, validated, processed, logged, compared and verified against budget. This ICT Building Blocks also provides interoperability with connections to the various external applications that need payment services in order to trigger transitions in their own WorkFlow. Payment services generally interface through gateways to regulated financial entities such as banks, credit facilities and insurance companies. To help users easily complete payment transactions and learn if their transaction succeeded or failed, it converts heterogeneous interface protocols, formats and user interfaces to a standard set of common interfaces and formats. It can also help in tracking costs of commodity and equipment purchases to optimize budgets.

The Payments Building Block consists of components that enable multiple use cases in a generic manner. The use cases, including Government to Person(G2P), Person to Government (P2G), Government to business (G2B) and Business to Government (B2G), The existing commercial Payments schemes are heterogenous across regions and countries, the Payments BB assumes that some components are optional when considering implementation. The payments BB covers components that can be used to deliver the key functionalities and the connections to existing systems in the market, but does not contemplate building a new payments scheme

![](.gitbook/assets/image21.png)

## 2.1 Financial Inclusion, Banks and Mobile Money Accounts <a href="#docs-internal-guid-40250f7c-7fff-0e7b-4de3-b9ba0376cbfc" id="docs-internal-guid-40250f7c-7fff-0e7b-4de3-b9ba0376cbfc"></a>

Financial inclusion strategies have largely been based on growing access to regulated accounts. This was traditionally understood to be bank accounts, in recent years mobile money (MoMo) accounts have greatly increased transactional account access. These MoMo accounts are often, but not always, treated as secondary to the banking system and lack interoperability.

That said, today, with over 1.2 billion global accounts, transacting an average of over $2 billion per day, mobile money has grown to become the leading payment platform in a growing number of emerging markets. Today, there are more mobile money accounts in Sub-Saharan Africa than bank accounts. Indeed, during the pandemic, demand for mobile money services increased among businesses, governments and new services that previously relied on cash or other payment channels.

There are currently active discussions in many markets which need integration of mobile money into existing national infrastructure. While the integration of mobile money into existing schemes and infrastructure has the potential to create value for all stakeholders in the ecosystem, many legacy payments systems may not be suitable for mobile money integration in their current state. As an example, many existing interbank switches do not support mobile money as a core feature because of legacy technical architecture. What is often missing is the essential capability of the switch to handle high-volume, low-value ﬂows with the mobile number (Mobile Station Integrated Services Digital Network) as identiﬁer for routing and address resolution hence the need for integration.

Recent industry developments offer solutions designed to solve many of the issues around the switching of mobile money.

Mobile money providers, regulators, infrastructure providers, and other financial system players should seek to engage on any potential interoperability initiatives from an early stage to ensure optimal payments system design for all parties. Should existing infrastructure be used, a thorough assessment should be conducted, with input from all parties, to ensure appropriate governance, commercial, and technical standards are incorporated.

Mandating interoperability within a short time frame, removes opportunities for a thoughtful and holistic analysis of commercial sustainability. Requiring immediate interoperability can also delay or hamper the uptake of interoperable transactions, and mobile money services altogether. This is a particular risk in contexts where regulators or governments impose immediate connections to a centralized hub. Mobile money providers should be encouraged to connect when their service is ready. However alternative modalities of payment such as cash-vouchers can also be considered in scenarios of low-resource regions that lack modern infrastructure and volume of mobile phone users.

Also, in countries where mobile money providers are not connected to a payment switch, aggregators can enable the flow of funds between multiple financial service providers including banks and non-banks. While aggregators may not be as efficient and scalable as switches, they can help solve interoperability issues in the short and medium term.

## 2.2 Payments Building Block Capabilities <a href="#docs-internal-guid-4991f911-7fff-c25a-2bb0-29f7dbf71bcb" id="docs-internal-guid-4991f911-7fff-c25a-2bb0-29f7dbf71bcb"></a>

Generally the Building Block is supportive of multiple types of payment use cases where the Government is one of the parties:

* **Government to people (G2P)**
  * Payment where the payer is a government and the payee is an individual e.g. Social benefits disbursement, government salary payments, Conditional and [Unconditional Social Cash Transfer](https://registry.dial.community/use\_cases/unconditional\_social\_cash\_transf/use\_case\_steps/outreach\_communications)s).
* **People to Government (P2G).**
  * Payment where the payer is an individual and the payee is a government (e.g. payment of taxes, payment [Registration for Postpartum and Infant Care](https://solutions.dial.community/use\_cases/unconditional\_social\_cash\_transf/use\_case\_steps/registration), payment of school fees, driving license, utility payments).
* **Government to Business (G2B)**
  * G2B payments include tax refunds, goods and services purchases and subsidies. Contracts payments, benefits, loans
* **Business to Government (B2G)**
  * B2G payments include paying taxes and fees.
* **Government to Government (G2G)**
  * Payments between two government entities (ie between Ministries/Departments and public sector institutions).

Government to Business payments (G2B) and Government to Government (G2G) are not covered in this specification and will be covered in the second phase..

## 2.3 Mapping Based on Level of Maturity <a href="#docs-internal-guid-03083e3a-7fff-0a23-35b3-cf8f18b3f1a2" id="docs-internal-guid-03083e3a-7fff-0a23-35b3-cf8f18b3f1a2"></a>

The [DIAL use cases](https://drive.google.com/drive/folders/1JYdcmeUhJrwl7TfSuVtBJ9a0C335VbRg) can be mapped to the payments building block capabilities as follows.

| **Capabilities** | **Payment Infrastructure Scenario** | **DIAL User journey**                                                                                                                                                                                                                                                                                                                                                  | **Use Cases**                                                                                                                                              | Destination Channel                                 |
| ---------------- | ----------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------- |
| G2P              | Scenario 1-4 & 6                    | <p>Payment - Unconditional Social Cash Transfer (direct payment based on family relationship)</p><p><br></p><p><a href="https://solutions.dial.community/use_cases/unconditional_social_cash_transf">Payment - Unconditional Social Cash Transfer (bank payments)</a></p><p><br></p><p>Payment - Unconditional Social Cash Transfer (non-electronic/cash payments)</p> | <p>a). Beneficiary payment, Incentive payment to mother.</p><p><br></p><p>b) Government Salary payment</p><p><br></p><p>c) Unconditional cash transfer</p> | Voucher payment, Mobile Money, direct bank transfer |
| P2G              | Scenario 1-4 & 6                    | [Postpartum care](https://solutions.dial.community/use\_cases/postpartum\_and\_infant\_care)                                                                                                                                                                                                                                                                           | Payment - registration of birth (Postpartum and Infant Care)                                                                                               | Mobile Money.                                       |

### 2.4 Infrastructure Requirements <a href="#docs-internal-guid-c5cf6da5-7fff-ad96-4712-4d822a57777d" id="docs-internal-guid-c5cf6da5-7fff-ad96-4712-4d822a57777d"></a>

| Modality     | Infrastructure Components                                                                                                                                                                                   | Comments                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
| ------------ | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Mobile Money | <ul><li>Account lookup - directory service</li><li>Payment portal</li><li>Payment gateway (only in selected scenarios)</li><li>Payment request initiation</li><li>Notification service</li></ul><p><br></p> | <p>Mobile money is a destination account to distribute funds to end users (in the case of G2P) or an initiation account to enable users to initiate a payment for government services (P2G) which is facilitated by private commercial entities,  typically Mobile Network Operators.</p><p><br></p><p>There are three ways that facilitate interoperability between a mobile money provider and a financial service institution (which could be the initiator of a payment - G2P or the receive - P2G): Through a Switch, through a third-party aggregator or through a bilateral integration. We expect one or multiple of these components to be in place to facilitate the use cases discussed in this document but these will remain out of the payment building block.</p> |
| Vouchers     | Voucher Management System, Merchant Ecosystem, Merchant Registry                                                                                                                                            | The Merchant Ecosystem and the Merchant Registry are both outside the scope of the Payments Building Block. The development of the Merchant Ecosystem will be driven by the relevant government institution. The Merchant Registry will be managed by another building block.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |

## 2.5 Payment Infrastructure Deployment Scenarios

## &#x20;2.5. 1 Regional Switch vs Country Switch <a href="#docs-internal-guid-cd102025-7fff-69cb-65c6-c81f89b706c2" id="docs-internal-guid-cd102025-7fff-69cb-65c6-c81f89b706c2"></a>

Domestic payment switches have specific economic characteristics and may not reach adequate economies of scale. Whilst costs can be passed onto customers, without sufficiently low charges, volumes may remain perennially low. Domestic switches facing this scenario thus remain under-utilized, costly, and under-capitalized. In recent years, the concept of Regional payment switches has gained some traction with new efforts realized or underway across Southern African Development Community (SADC), West African Monetary and Economic Union (UEMOA), East African Community (EAC), and Economic and Monetary Community of Central Africa (CEMAC).

Regional switches (which may serve as a common resource for multiple countries) often rely on pre-existing arrangements between Central Banks, regional Commercial Banks, or a combination thereof. When multiple currencies are in play, a reference currency or a basket of currencies must be chosen for regional settlement accounts to be viable. Settlement arrangements are vital to the viability of a regional switch. A Regional switch may also integrate financial transactions from countries that already have domestic payment switches (like a switch of switches).

Regional switches may take on any and all use cases, or may be restricted to specific use cases, for example Large Value Transfer or B2B trade. Because regional trade drives economic activity, regional switches often go hand in hand with portability of business and consumer credentials (i.e. relating to Customer Due Diligence), trade policy, and movement of labor.

## 2.5.2 Payment infrastructure scenarios

The Payments building block (BB) sits between the government account systems (i.e. at the Ministry of FInance or Central Bank) and the public or private switching available in the market. As such the PaymentsBB is assumed in each, but not shown. The primary focus in describing these scenarios is on the relationship between payment schemes, banking institutions, and government institutions. This section describes what is available in-country.

| **Infrastructure Scenarios**                                                                                                                                                                                       | **Suggested Approach**                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |
| ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| <p><strong>Payment Infrastructure Scenario 1</strong><br>Regional Switch (or a switch of switches) connects financial service providers including banks and non-banks in different countries in a region.</p>      | Government should leverage the regional payments switch (scheme) to enable all use-cases. This may also imply important developments of a standardized Customer Due Diligence (CDD). Note that while a State owned bank is shown in the diagram below, the option exists for the Government to designate a specific Commercial bank, or to have the funds flow directly from the Ministry of Finance (Treasury) assuming such Treasury payment functionality can be supported by the Regional Switch. |
| <p><strong>Payment Infrastructure Scenario 2</strong><br>A payment switch connecting financial service providers such as banks to non-banks including mobile money providers is in place and actively working.</p> | Government should leverage the existing switch to enable payments use-cases to reach mobile money providers. There may be a State Owned Bank (2-A) or not (2-B).                                                                                                                                                                                                                                                                                                                                      |
| <p><strong>Payment Infrastructure Scenario 3</strong><br>A payment switch is in place in the country or is in the process to be deployed but non-banks, including mobile providers are not connected to it.</p>    | <p>Government should leverage third-party aggregators or bilateral integrations to enable payment use-cases to reach mobile money providers.</p><p><br></p>                                                                                                                                                                                                                                                                                                                                           |
| <p><strong>Payment Infrastructure Scenario 4</strong><br>A payment switch is not place or in the process of being deployed</p>                                                                                     | Government should leverage third-party aggregators or bilateral connections to enable payment use-cases to reach mobile money providers                                                                                                                                                                                                                                                                                                                                                               |
| <p><strong>Payment Infrastructure Scenario 5</strong><br>Government makes G2P payments using Central Bank Digital Currency (CBDC) .</p>                                                                            | The Central Bank distributes the funds for the CBDC accounts via regulated entities (e.g. Payment Service Providers).                                                                                                                                                                                                                                                                                                                                                                                 |
| <p><strong>Payment Infrastructure Scenario 6</strong><br>Citizens have CBDC accounts directly with the Central Bank or other accounts with other payment service providers</p>                                     | The Central Bank sets up limited accounts for each person, providing a base level of access and functionality. Such accounts may be denominated in country currency (fiat) or CBDCs. This scenario places more responsibility on government structures and is not often considered (outside of Postal Banks and the like).                                                                                                                                                                            |

Under each of these scenarios, there are different setups possible that relate the key roles played by the Programmatic Ministries (e.g. Ministry of Education or Pension Program), the Ministry of Finance, the Central Bank and the existing Payment Switch.

The flow of funds and the flow of data are separate but equally important and they have a number of interactions.

### 2.5.2.1 Payment Infrastructure Scenario 1 <a href="#docs-internal-guid-63a4041d-7fff-d235-eb9b-1b216215b6e9" id="docs-internal-guid-63a4041d-7fff-d235-eb9b-1b216215b6e9"></a>

Regional Switch (or a switch of switches) connects financial service providers including banks and non-banks.

![Payments building block diagrams.drawio - diagrams.net](.gitbook/assets/image19.png)

### 2.5.2.2 Payment Infrastructure Scenario 2-A <a href="#docs-internal-guid-d25fd375-7fff-8960-0f04-e0264cd1ef40" id="docs-internal-guid-d25fd375-7fff-8960-0f04-e0264cd1ef40"></a>

Scenario 2-A and Scenario 2-B cover the concept of separating flows of data from accounting flows.

The Central Bank receives the funds transfer advice from the Treasury and the data from the Ministry of Health and does the steps of breaking it into bulk, based on rules of capacity of source and destination systems. Payments are then routed “on-us” or to the external financial providers “off-us” via a payment switch or similar mechanism.

![Payments building block diagrams.drawio - diagrams.net](.gitbook/assets/image18.png)

### 2.5.2.3 Payment Infrastructure Scenario 2-B <a href="#docs-internal-guid-17ea0a05-7fff-b78a-f66d-b1db5a50b0ac" id="docs-internal-guid-17ea0a05-7fff-b78a-f66d-b1db5a50b0ac"></a>

The Central Bank plays a key role as a participant in the Payment scheme and routes the payment details and funds via a shared service of the payment switch. Same logic of break-bulk applies and with all transactions effectively “off-us”.

![Payments building block diagrams.drawio - diagrams.net](.gitbook/assets/image31.png)

### 2.5.2.4 Payment infrastructure scenario 3 <a href="#docs-internal-guid-f20210d1-7fff-6f46-031b-a7efd42f0e27" id="docs-internal-guid-f20210d1-7fff-6f46-031b-a7efd42f0e27"></a>

Government should leverage third-party aggregators to enable payment use-cases to reach mobile money providers

![Payments building block diagrams.drawio - diagrams.net](.gitbook/assets/image5.png)

### 2.5.2.5 Payment Infrastructure Scenario 4 <a href="#docs-internal-guid-f33d82c3-7fff-6366-eea9-62a6308c58de" id="docs-internal-guid-f33d82c3-7fff-6366-eea9-62a6308c58de"></a>

A payment switch is not in place or in the process of being deployed. Government should leverage third-party aggregators or bilateral connections to enable payment use-cases to reach mobile money providers. In the bilateral connection scenario, each mobile money provider in the country would connect to the government portal through APIs, enabling a seamless transfer of funds to end users (in the case of G2P payments) or the receiving of funds from end users (in the case of P2G payments) and facilitate reporting, reconciliation and settlement processes.

![Payments building block diagrams.drawio - diagrams.net](<.gitbook/assets/image17 (1) (1) (2).png>)

### 2.5.2.6 Payment Infrastructure Scenario 5 <a href="#docs-internal-guid-69c7a646-7fff-5eeb-a45c-645b0d3ee524" id="docs-internal-guid-69c7a646-7fff-5eeb-a45c-645b0d3ee524"></a>

The Central Bank mints digital currency and distributes funds via regulated entities (e.g. Payment Service Providers), and in the case of G2P sends funds to destination accounts known to the Ministry of Finance. Account information is unitary and unique for all beneficiaries (e.g. citizens) but the Central Bank does not “hold” account balances on an individual basis.

![Payments building block diagrams.drawio - diagrams.net](.gitbook/assets/image14.png)

### 2.5.2.7 Payment Infrastructure Scenario 6 <a href="#docs-internal-guid-4df537db-7fff-1474-df07-653ff0c8025e" id="docs-internal-guid-4df537db-7fff-1474-df07-653ff0c8025e"></a>

The Central Bank directly provides Digital Accounts for all people (Citizens) and Treasury routes funds to the relevant accounts (uniquely and unitarily held by people).

![Payments building block diagrams.drawio - diagrams.net](.gitbook/assets/Picture1.jpg)

* For this payment use case the most common scenarios currently in place are 1 to 4, scenario 5 and 6 could be envisaged later.
* In Scenario 2B it is assumed that the Payment Switch is run by the Central Bank.
* In Scenario 2A and 3 it is assumed that the Payment Switch is an independent part outside the Central Bank.

## &#x20;2.6 Out of Scope Assumptions <a href="#docs-internal-guid-39459612-7fff-54dd-0f25-ddf61408bb48" id="docs-internal-guid-39459612-7fff-54dd-0f25-ddf61408bb48"></a>

## 2.5 Out of Scope Assumptions <a href="#docs-internal-guid-39459612-7fff-54dd-0f25-ddf61408bb48" id="docs-internal-guid-39459612-7fff-54dd-0f25-ddf61408bb48"></a>

* Payment scheme creation is outside of the scope.
* Government to Business and Government to Government Payments are out of scope for the first phase and will be considered in the second phase.
* Identity systems are separate and outside the payments BB, with key implications for KYC/CDD in the banking system.
* Consent of people eligible as beneficiaries of G2P programmes for their personal details (ie National ID and payments details) to be stored in tokenised form in the centralised mapper (where the government has to implement the mapper).
* Delegation of authority - Consent of the recipient for payment of G2P to be made to a third party (next of kin) is outside the scope of the payments building block and should be handled by consent management building block at the time of beneficiary registration for the G2P program.
* For social benefits G2P payments, social registries are an important building block which will implement the registration, and determination of potential eligibility of citizens for one or more social programs. As such, they are a separate building block and are outside the payments BB.
* An Integrated Financial Management Information System ( IFMIS ) and a Treasury Single Account (TSA) are essential components in improving the safety and efficiency of government payment programs. The TSA, in particular, ensures effective aggregate control over government cash balances and facilitates the reconciliation between banking and account data. It is assumed that these components exist at the level of the government as they are outside the scope of the payments BB.
* Settlement systems are outside of the scope, Settlement allows the flow of money between participants and can be done on a Pre-funding basis which allows incoming transactions if the sending DFSP has already deposited sufficient liquidity with them. Alternatively settlement can be on a Clearing-base where FSPs allow incoming transactions before receiving the funds.
* Pricing. This generally revolves around processing fees (for each transaction a fixed fee is paid to the entity processing the transaction) and interchange (where one participant agrees to pay the other).
* Dispute resolution mechanisms which allow FSPs to reach consensus on a transaction’s status and financial liabilities in the case of a dispute. There are two main types of dispute resolution mechanisms: the consensus option where parties must agree on a transaction’s status; and the arbitration option where one party has authority over a transaction’s status.
* Governance defining sets of rules on how participants make decisions.
* Development of the voucher management ecosystem that is outside the technical specification of the Payment Building Block, including but not restricted to recruitment and registration of merchants / agents for the redemption of vouchers, etc.
