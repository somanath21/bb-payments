---
description: >-
  This section provides a detailed view of how the Payments Building Block will
  interact with other Building Blocks to support payments.
---

# 9 Internal Workflows

## 9.1 G2P Bulk Payment Workflows <a href="#docs-internal-guid-dfe6b849-7fff-2b78-34c6-27cab0f78e42" id="docs-internal-guid-dfe6b849-7fff-2b78-34c6-27cab0f78e42"></a>

This section discusses the various processes involved in G2P disbursement, such as beneficiary onboarding into the Account Mapper, bulk disbursements to pre-registered financial addresses, and account pre-validation prior to bulk disbursement.

### 9.1.1 Beneficiary Onboarding in Account Mapper

The workflow represents the process of onboarding beneficiaries in the ID Mapper as a prerequisite step before any payment processing can occur. This use case is triggered when a new G2P beneficiary has been onboarded by a G2P program, assigned a Functional ID, and verified as eligible for the social benefit program.

```mermaid
sequenceDiagram

note left of RBB: Functional ID is issued to Beneficiary, Request parameters can be json array for bulk onboarding

RBB -->> IM:  Register_Beneficiary (Request ID,\nSource BB ID, Array of Beneficiaries)
IM -->> PBB:  Register_Beneficiary (Request ID,\nSource BB ID, Array of Beneficiaries)

note left of PBB: Validate parameters, Authenticate Source Building block exists

PBB -->> AM: Register_Beneficiary (Request ID,\nSource BB ID, Array of Beneficiaries)
note left of AM: For each Payee Functional ID, Duplicate Check, Register in mapper

AM -->> PBB: Register_Beneficiary_Respone(Request_ID,\nResponse Code,Array of Failed cases)
PBB -->> IM:  Register_Beneficiary_Respone(Request_ID,\nResponse Code,Array of Failed cases)
IM -->> RBB:  Register_Beneficiary_Respone(Request_ID,\nResponse Code,Array of Failed cases)
```

1. The Requesting Building Block (RBB) sends a "Register\_Beneficiary" request to the Information Mediator (IM), containing the Request ID, Source Building Block (SBB) ID, and an array of beneficiaries with their Functional ID, Payment Modality, and Financial Address (if available).
2. IM forwards the "Register\_Beneficiary" request to the Payments Building Block (PBB) with the same parameters.
3. PBB validates the API parameters and checks if the Source Building Block is configured in the Payments BB as an acceptable source of the API call.
4. If the parameters are valid, PBB sends the "Register\_Beneficiary" request to the Account Mapper (AM) with the same parameters.
5. Account Mapper checks for duplicate Functional IDs registered by the same Source Building Block and registers the beneficiaries in the mapper if they are not already registered.
6. Account Mapper sends a "Register\_Beneficiary\_Response" to PBB, which contains the Request ID, response code, and an array of failed cases (if any) with descriptions.
7. PBB forwards the "Register\_Beneficiary\_Response" to IM, with the same parameters.
8. Finally, IM sends the "Register\_Beneficiary\_Response" to RBB, providing the final response code and the list of any failed cases with descriptions.

The workflow supports the addition of beneficiaries in the mapper in bulk. The source building block can use the same APIs for individual or bulk onboarding.

### 9.1.2 Pre-validation of Accounts prior to Bulk Disbursement

This flow represents the prevalidation process of accounts in a bulk disbursement scenario. The process involves a Source BB (SBB), Payments BB (PBB), Payer Bank (PrBank), and Payee Bank (PyBank).

```mermaid
sequenceDiagram
title Prevalidation of Accounts

note right of SBB: Prepare Bulk Disbursement instructions containing <br>1. FunctionalID <br>2. Amount <br>3. Description/Narration <br>4. Instruction ID

SBB -> PBB:  Prepayment_Validation(Batch_ID, Payment Instructions)

note left of PBB: 1. Debulking <br>2. Check each Payee Functional ID in mapper <br>3. Record Failed Instructions

loop Send Payee Bank wise Sub-Batches
PBB -> PrBank: Bulk_ValidateAccount (Batch_ID, Destination_BIC,Payment Instructions)
PrBank -> PyBank: Account Validation Request as per Incumbent Scheme Norm

note left of PyBank: 1. Validate A/C exists <br>2. Validate it can receive Credit <br>3. Validate Credit limit won't exhaust

PyBank -> PrBank: Account Validation Response as per Incumbent Scheme Norm
PrBank -> PBB: BulkValidateAccount_Response (BatchID, Array of Failed Instructions)
end

PBB -> SBB: Prepayment_Validation_Response(BatchID, Array of Failed Instructions)


```

1. The process begins with the Source BB (SBB) preparing bulk disbursement instructions containing key information such as the Functional ID, amount, description/narration, and instruction ID.
2. SBB sends these instructions as a prepayment validation request (Prepayment\_Validation) to Payments BB (PBB).
3. Upon receiving the request, PBB performs several actions, including debulking the instructions, checking each payee's Functional ID in the mapper, and recording any failed instructions.
4. PBB then sends payee bank-wise sub-batches for validation in a loop. For each sub-batch, PBB sends a bulk validate account request (Bulk\_ValidateAccount) to the Payer Bank (PrBank), including the batch ID, destination BIC, and payment instructions.
5. PrBank forwards the account validation request to the Payee Bank (PyBank) as per the incumbent scheme norm.
6. PyBank performs several validation checks, such as confirming the account exists, verifying that it can receive credit, and ensuring that the credit limit won't be exhausted.
7. PyBank sends an account validation response back to PrBank, adhering to the incumbent scheme norm.
8. PrBank then sends a bulk validate account response (BulkValidateAccount\_Response) to PBB, containing the batch ID and an array of any failed instructions.
9. Finally, PBB sends a prepayment validation response (Prepayment\_Validation\_Response) to SBB, including the batch ID and an array of any failed instructions.

This flow ensures that the accounts involved in a bulk disbursement transaction are valid and capable of receiving the specified credits before processing payments, reducing the risk of failed transactions and improving overall efficiency.

### **9.1.3** Bulk Disbursement into a Financial Address pre-registered in the Account Mapper

The flow depicted in the sequence diagram illustrates the process of bulk disbursement into financial addresses, such as bank accounts or mobile wallets, that are pre-registered in the Account Mapper. This use case is triggered when the Source BB submits a batch for processing of payments to the Payments BB.

Pre-conditions: Functional IDs intended to be recipients of funds must be pre-registered in the Account Mapper. All the financial addresses must be validated before a payment is disbursed.

Data Inputs: Source BB provides relevant confirmation to the Payments BB to begin credit transfer for successfully pre-validated accounts.

```mermaid
sequenceDiagram
title Bulk Disbursement into an online Financial Address

SBB ->> PBB: BulkPayment(Batch_ID, Payment Instructions)
PBB ->> PrBank: getAuthorization()
PrBank ->> PBB: getAuthorization_Response()

loop Send Payee Bank wise Sub-Batches
PBB ->> PrBank: BulkPayment_ReceiverFI(Batch_ID, Destination_BIC, Payment Instructions)
end

note over PrBank: Payer Bank processes each Receiving FI Batch <br> and processes instructions as batch or single instructions, <br>depending on available transaction rails.

PrBank ->> PBB: BulkPayment_StatusPush(BatchID, Credit Instructions)


```

1. The process starts with Source Building Block (SBB) sending a BulkPayment request containing a Batch\_ID and a set of payment instructions to the Payment Building Block (PBB).
2. PBB checks if liquidity was provisioned before this batch is executed and if sufficient liquidity was provisioned. If this is the case, PBB proceeds to de-bulk crediting batches by the receiving institution.
3. PBB then requests authorization from the PrBank by sending a getAuthorization() message.
4. PrBank responds with a getAuthorization\_Response() message, granting the required authorization to PBB.
5. PBB begins sending payee bank-wise sub-batches to PrBank in a loop. For each sub-batch, PBB sends a BulkPayment\_ReceiverFI message containing the Batch\_ID, Destination\_BIC, and payment instructions.
6. The Payer Bank (PrBank) executes these batches through existing rails.

Exceptions: Some accounts might have been pre-validated or part of the crediting batch but cannot be credited by the payee bank for some reason. For such accounts, funds must be returned to the payer bank and credited back into the Source BB's Settlement Account through a separate process.

In order to facilitate the transfer of funds from the disbursement organisation (the payer) to the mobile money provider, the mobile money provider would need to be connected to the payment gateway/switch. Should this connection not be in place, the disbursement could be facilitated by a third-party aggregator or there would need to be a bilateral connection between the payer’s Financial Service Provider and the Mobile Money Provider.

## 9.2 G2P Beneficiary Payments Using Vouchers

The Voucher Management System supports three workflows for voucher payments:

1. administration (voucher provisioning and merchant registration),
2. voucher issuing (pre-activation and activation),
3. redemption use cases as shown in the diagram below.

These use cases and the relationship between each one of them are shown and further described below.

The use cases are described in the diagram below:

![Payments building block diagrams.drawio - diagrams.net](.gitbook/assets/image15.png)

### **9.2.1 Voucher administration**

These processes are usually done prior to the issuance of the voucher to ensure a smooth flow at the point of issuance.

The Admin processes for the Voucher Management Server cover the lifecycle of the vouchers and are typically performed by a privileged user (this may be done through User Interface or an API). These processes include but are not limited to creating voucher groups, provisioning vouchers, suspending vouchers, unsuspending vouchers, validating vouchers, key management, and purging of used vouchers.

* Voucher Provisioning\
  This function will be done by an administrator (privileged user). It will typically be triggered by the deposit of funds in a funding account, thus the source account. Voucher provisioning creates a conditional right to funds and an inventory of issued vouchers. Other processes related to this are voucher inventory management, voucher suspension, and voucher purging.
* Merchant Registration\
  In order for efficient redemption of vouchers merchants MUST be registered in advance to create a network of trusted providers. This registration is assumed to be managed by the Registration Building Block, The account verification of the merchant can be done at registration or during redemption subject to a configuration.\
  \
  During the registration process, merchants MAY also be assigned to different voucher groups depending on the required function that has been implemented. For example, there may be a voucher group for schools. This implies that vouchers of this type can only be redeemed at schools. This also requires that the user flow system at which the voucher is issued is aware of these voucher groups and is able to send the appropriate request to the Voucher Management System.
* Agent Registration\
  In markets where cashouts are being used, it is expected that the Registration Building Block will register agents in a similar way.
* Voucher Groups\
  Depending on the requirement it should also be possible to set up multiple voucher groups. Vouchers in the same voucher group will have similar characteristics and are labeled with a specific voucher group name. During voucher provisioning, a voucher can be created and attached to a single voucher group. When a voucher is requested (using the pre-activation API) it is expected that the voucher group will be one of the parameters set.
* Voucher Issuing\
  Voucher issuing is triggered by the Registration Building Block which will determine whether the conditions of issuance have been met. The calling Block will determine the denomination and voucher group of the voucher to be issued. The voucher number and the voucher serial number that is issued can be presented to the beneficiary in multiple ways including but not restricted to encoding in the form of QR codes, bar codes, printed vouchers, or even SMS. This is outside the scope of the Payments Building Block. It is expected that Building Blocks through which the voucher is redeemed will also be able to decode the voucher.

### **9.2.2 Voucher Activation sequence diagram**

The voucher activation flow is shown in the diagram below.

```mermaid
sequenceDiagram
title Voucher Activation v3

Source BB->Payment BB: Activate voucher
Payment BB-->Source BB: Voucher successfully Activated

alt Error 400
    Payment BB-->Source BB: Invalid request
end

alt Error 456
    Payment BB-->>Source BB: Invalid voucher serial number
end

alt Error 460
    Payment BB-->Source BB: Gov Stack Building Block does not exist
end

alt Error 455
    Payment BB-->Source BB: Voucher group exhausted
end

alt Error 500
    Payment BB-->Source BB: Internal Server error
end

alt Error 503
    Payment BB-->Source BB: Service Unavailable
end

alt Error 599
    Payment BB-->Source BB: Network connection timeout error
end



```

Flow Description:

* An external Building Block may invoke the Payments Building Block API gateway to pre-activate API on the Voucher Management Server with the amount of the voucher, the voucher currency, and the voucher group. The calling Building Block may optionally send a comment. The comment will be stored by the voucher server. The voucher group will indicate that it is looking for a voucher from a specific voucher group. This API call will be made through the Payments orchestrator.
* The voucher group is typically used for conditional social transfer (e.g. for school fee payment). If any voucher can be used for any purpose, then all vouchers should be created with a generic voucher group (e.g. “GENERAL-PURPOSE”).
* The API returns to get a voucher number, the voucher serial number, and its expiry date. At this point, the voucher will be flagged as Pre-Activated.
* The calling Building Block may render the voucher as a QR code, as a barcode, or even as an SMS text. It is recommended that the voucher should include supplementary data of the recipient. It is also recommended that this data should also be printed in human-readable form so that the recipient can verify the data on the voucher. This data can also be verified at the point of redemption.
* Once the calling API successfully prints/issues the QR code, the voucher can then be activated using the activation API. It is assumed that there will not be a substantial delay between pre-activation and activation to necessitate the need for multiple expiry periods.

Alternative: the voucher could be activated immediately on being requested. This could be controlled at the Payments Orchestrator.

* Preconditions
  * The calling registration block will determine that all the necessary preconditions are met.
  * The most critical precondition is the prefunding which will be done manually at the voucher provisioning stage. Other options that could be prefunding triggered by activation or at redemption are not considered because they are considerably more complex and create additional failure points in the activation of the vouchers.
* Assumptions/Queries
  * It is assumed that only one currency will be used.
  * A zero-trust architecture.
  * The transaction is not reversible.
* Post-Condition\
  The calling Building Block may invoke another payment Building Block API, e.g. initiating an incentive payment for the agent.

### **9.2.3 Voucher Redemption sequence diagram**

The voucher redemption process is shown in the diagram below.

```mermaid
sequenceDiagram
title Voucher Redemption

Source BB (Merchant Interface) ->> Merchant registry: Submit voucher details
Merchant registry -->> Source BB (Merchant Interface): Merchant name and payment details
Source BB (Merchant Interface) ->> Payment BB: Submit voucher and merchant details

alt Error 400
    Payment BB-->>Source BB (Merchant Interface): Invalid request
end

Payment BB ->> Payment BB: Check Voucher

alt Error 458
    Payment BB-->>Source BB (Merchant Interface): Voucher number already used
end

alt Error 461
    Payment BB-->>Source BB (Merchant Interface): Invalid voucher number
end

Payment BB->>FSP: Debit request

alt Error 599
    Payment BB-->>Source BB (Merchant Interface): Network connection error
end

FSP->Funding A/c: Debit request
Funding A/c -->> FSP: Debit successful

alt Error 462
    FSP -->> Payment BB: Insufficient funds
    Payment BB -->> Source BB (Merchant Interface): Insufficient funds
end

FSP->Merchant A/c: Credit Request
Merchant A/c -->> FSP: Credit Request successful

alt Error 463
    FSP -->> Payment BB: Cannot credit merchant
    Payment BB -->> Source BB (Merchant Interface): Cannot credit merchant
end

Payment BB ->> Payment BB: Consume Voucher
Payment BB ->> Source BB (Merchant Interface): Amount credited to merchant account and voucher is consumed

```

Flow Description:

* At redemption, the beneficiary shows the voucher to the merchant or agent.
* The merchant/agent will scan and interpret the medium in which the voucher is presented (this could be a QR code or a barcode or an SMS or even a printed number).
* Voucher redemption Validation: The details presented MAY allow the merchant/agent to authenticate/validate the owner of the voucher.
* The agent will then initiate the redemption process which will call the Payment Building Block API Management Gateway.
* The API Management Gateway will validate the voucher and initiate the payment through the payment gateway.
* If specific voucher groups have been set up, voucher usage may be restricted to specific merchants. An override parameter should also be provided that will allow a Voucher of any voucher group to be redeemed at any merchant.
* Once the payment to the merchant/agent is successful the Payment gateway will inform the API Management Gateway.
* The API Management Gateway will then instruct the VMS API to flag the voucher as consumed.

Alternatives:

* Payments could be made through a switch in which case there would be no need for prefunding accounts in each financial institution.

Preconditions:

* The merchant must have been registered possibly by the Registration Building Block with their preferred payment method.
* The merchant must have a mechanism (e.g. a mobile APP, USSD app, or SMS option) to verify the beneficiary prior to redemption.

Assumptions:

* The app for reading the QR code and redemption is not part of the scope of the Payment Building Block.
* The entire voucher amount is consumed. Partial redemption will not be allowed.
* The amount that is paid to the merchant or agent is debited from a prefunded account.

**Sample Redemption**

![Source: Kenya Government and WFP Disburse Relief Cash to Drought Stricken Families accessed 05-Sep-21](<.gitbook/assets/image12 (1).png>)

Note:

In the case of a physical voucher, the voucher number or the secret number is hidden behind some material that must be scratched away to see the number. The voucher number is also commonly known as the PIN.

### **9.2.4 Voucher Cancellation sequence diagram**

The voucher cancellation flow is shown in the diagram below.

```mermaid
sequenceDiagram
title Voucher Cancellation

Source BB -> Payment BB: Cancel Voucher
Payment BB-->Source BB: Voucher Cancelled

alt Error 499
    Payment BB-->Source BB: Invalid Request
end

alt Error 463
    Payment BB-->Source BB: Invalid Voucher
end

alt Error 464
    Payment BB-->Source BB: Voucher is already cancelled
end

alt Error 599
    Payment BB-->Source BB: Network connection timeout error
end
 
```

Flow Description:

* The calling Building Block will request the API Management Gateway to cancel a Voucher.
* The API Management Gateway will invoke the VMS API to cancel the Voucher.
* The Vaucher Management System (VMS) API interface will check if the Voucher is valid and then cancel the Voucher.
* The VMS API interface will confirm that the Voucher has been canceled.

Alternatives:

* If the Voucher does not exist, the VMS API will respond that the Voucher does not exist.
* If the Voucher is already consumed, the VMS API will respond that the Voucher is already consumed.
* If the Voucher is already canceled the VMS API will respond that the Voucher is already canceled.
* If the Voucher is suspended the VMS API will respond that the Voucher is suspended.
* All calls from external parties (e.g. Registration Building Block) to the voucher management system will be initiated through the API management gateway.
* The payment orchestration module may direct transitions between the various functions.
* The discovery service could be called by other building blocks to determine where bank accounts/wallets sit.
* The only function that speaks to the DFS is the payment gateway. Any function that needs to speak to the DFS goes through the Payment gateway.
* The Payment gateway may need to speak to a Number Portability provider.
* Audit trails (transaction logs) capture each event as it happens and are to be used for queries, analysis, and reconciliation.
* Event logs will capture specific events that happen at each node.

## 9.3 P2G Payments

The following types of P2G payments are considered.

* Bill payments
* Payments for government services (application for a birth certificate)
* Payment for registrations. (In the case of the [Registration for Postpartum and Infant Care](https://github.com/GovStackWorkingGroup/BuildingBlockAPI/issues/1) use case)

There are two possible scenarios that can be supported:

a) P2G payment is initiated by the Payer

b) P2G payment is initiated by the Payee (USSD push payment for example)

Scenario a) can also be implemented using QR code.

### 9.3.1 P2G Payment initiated by the payer

```mermaid
sequenceDiagram
title Payer initiated P2G payments 

Registration BB ->> Payments BB: Send Transaction details
Payments BB-->>Registration BB: Payment reference
Registration BB ->> Payer: payment reference
Payer ->> FSP: Invoke Bill payment service
FSP -->>FSP: Debit payer, credit payee
FSP -->> Payments BB: Payment notification
Payments BB -->> Registration BB: Payment success notification
Registration BB -->> Messaging BB: Payment success notification
Messaging BB -->> Payer: Payment success notification

```

Flow Description:

* Upon registration for a government service, the Registration Building Block sends transaction details to the Payments Building Block which creates and returns a unique payment reference for the payer of the service.
* The Registration Building Block sends the unique reference number to the payer.
* After entering their account the payer would invoke a bill payment to a selected service (in this case paying for the registration service). The payer would need to enter the payment reference which would prompt the retrieval of the payment details from the Registration Building Block in real time. If the payment details are correct, the payer is prompted to enter their mobile money pin to authorize the payment.
* Upon authorisation, the payer’s account is debited and the government’s connected account is credited in real time. The Financial Service Provider, in this case, the mobile money provider would then notify the success status of the Payments Building Block.
* For this type of payment, as the payment reference is needed to validate the payment, this can be done by any mobile money account holder.

Notes:

The above model requires that the payer must provide two pieces of information through their USSD, STK, or mobile app:

* A merchant ID. Typically the government would be given a special merchant ID. The payer should be able to select which government service they would be paying for through the mobile money interface.
* A reference ID: this is unique and time bound for each transaction.
* As the bill payment is invoked by inputting the reference number which prompts the retrieval of the payment details in real-time from the registration building block, a failed transaction could be triggered by a session time-out or a wrong PIN. In both cases, the payer would have to re-initiate the transaction.
* In the P2G payment in the flow above, the government holds an account with the Financial Services Provider which would collect the payments on the government's behalf and transfer them to the single treasury account on a defined timeline (i.e. daily) in an aggregated way. For reconciliation purposes, the Registration Building Block would need to notify the government of a successful/unsuccessful payment.

### 9.3.2 P2G Payment Initiated by Payee (e.g USSD push payment) sequence diagram

```mermaid
sequenceDiagram
title Payer initiated P2G payments 

Registration BB ->> Payments BB: Send Transaction details
Payments BB->>FSP: Request USSD Push
alt Error 402: Account restrictions
FSP -->>Payments BB: Payment Failure notification
Payment BB -->> Registration BB: Payment Failure notification
end
FSP ->>Payer: Push USSD notification
Payer -->>Payer: Enter Pin to confirm the transition
Payer ->>FSP: transaction athorisation
FSP -->FSP: Debit payer, credit payee
FSP ->> Payments BB: Payment notification
Payments BB ->> Registration BB: Payment success notification
Registration BB -->> Messaging BB: Payment success notification
Messaging BB -->> Payer: Payment success notification
```

Flow Description:

* Upon registration for a government service, the registration building sends transaction details to the Payments Building Block which sends a payment request to the payer through their mobile money provider (Unstructured Supplementary Service Data prompt).
* The payer will see a request coming for the specific service requested with payment details, prompting them to authorize the payment by entering the pin code.
* Upon authorisation, the payer’s account is debited and the government’s connected account is credited in real time.
* The Financial Services Provider, in this case, the mobile money provider would then notify the success status to the Payments Building Block.
* This payment differs from the previous P2G mobile money payment as the payment is not initiated by the payer by invoking a bill payment but is initiated by a merchant (in this case the government agency providing the service). Therefore the payer is requested to pay for the service immediately.

Notes:

* There can be no error in the above as both the merchant number and the payment reference are pushed to the phone.
* The only risk here is a timeout on the Unstructured Supplementary Service Data or the user keying in the wrong PIN which may require the transaction to be reinitiated.

### 9.3.3 P2G Payment implementation using QR Code sequence diagram

```mermaid
sequenceDiagram
title P2G Mobile Money Payment with QR code

Registration BB->>Payments BB: Send Transaction details
Payments BB -->> Registration BB: Generates payment reference

Registration BB ->> Registration BB: Generate QR code

Registration BB ->> Payer: QR code is reads Payment reference
Payer -->> FSP: Invoke Bill Payment service

FSP ->> FSP: Debit Payer

FSP ->> FSP: Credit Gov

FSP ->> Payments BB: Payment notification
Payments BB -->> FSP: Confirm payment

Payments BB -->> Registration BB: Payment success notification
Registration BB -->> Payer: Payment success notification

alt Error 401: Incorrect Payment Reference
    FSP ->> FSP: Rollback Payer Debit
    FSP ->> FSP: Rollback Gov Credit
    FSP -->> Payments BB: Rollback successful
    Payments BB -->> Registration BB: Payment failure notification
    Registration BB -->> Payer: Payment failure notification    
end

```

Notes:

* There is small room for error in reading a QR code (unless the payer scans the wrong code).
* All mobile operators and banking apps need to be able to read the reference in the same way for this to work meaning that a standardised/interoperable QR code needs to be in place at a country level. While this is in place in some Asian countries (i.e. Indonesia, Sri Lanka) where there is widespread adoption of QR codes, In Africa the uptake of QR codes is significantly lower and standardisation is typically not in place at a country level.
* During registration, the Registration Building Block will generate transaction details including the amount to be paid by the payer and transaction ID, and send them to the Payments Building Block.
* The Payments Building Block will use the transaction details to initiate a request to pay to the Financial Service Provider.
* The QR payment widget displayed to the payer will have the following different attributes: payment\_entity\_id, amount, currency, transaction\_id
* The payer scans the QR code to approve/reject the payment.
* The Financial Service Provider sends a notification of the status of the transaction to the Payments Building Block and the payer.
* Transaction status is sent to the Registration Building Block on completion of payments.
* The Messaging Building Block sends a transaction confirmation message to the payer.

### 9.3.4 P2G Bill Payments

The P2G Bill Payments flow diagram illustrates the steps involved in processing bill payments between individuals and government agencies

```mermaid
sequenceDiagram

title: P2G Bill Payments

Government agency -->>Payer: Send Invoice to payer
Government agency -->>Bill Aggregator: Send Invoice
Bill Aggregator -->> Payments BB: Send Invoice reference
Payer-->>Collection FSP: Invoice reference
Collection FSP -->> Payment BB: Request transaction details (Amount)
Payment BB -->>Bill Aggregator: Request transaction details
Bill Aggregator -->> Payment BB: transaction details
Payment BB -->>Collection FSP: transactions details
Note left of Collection FSP: Executes payment
Collection FSP -->> Payment BB: Sends payment reference
Payments BB -->> Bill Aggregator: Sends payment reference
Bill Aggregator -->> Government agency: Send payment reference






```

1. The Government Agency sends an invoice to the payer, detailing the amount owed.
2. The Government Agency also sends a copy of the invoice to the designated Bill Aggregator.
3. The Bill Aggregator then sends the invoice reference number to the Payments Building Block (Payments Building Block).
4. The payer, upon receiving the invoice, provides the invoice reference number to their preferred Collection Financial Service Provider (Collection Financial Services Provider).
5. The Collection Financial Services Provider (FSP) requests transaction details, including the amount to be paid, from the Payments Building Block using the invoice reference number.
6. The Payments Building Block, in turn, requests the transaction details from the Bill Aggregator.
7. The Bill Aggregator provides the requested transaction details to the Payments Building Block.
8. The Payments Building Block forwards the transaction details to the Collection FSP.
9. The Collection FSP executes the payment based on the transaction details provided.
10. After completing the payment, the Collection FSP sends the payment reference to the Payments Building Block.
11. The Payments Building Block forwards the payment reference to the Bill Aggregator.
12. Finally, the Bill Aggregator sends the payment reference to the Government Agency, confirming the completion of the payment.
