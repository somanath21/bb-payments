---
description: >-
  This section provides information on the core data structures/data models that
  are used by this Building Block.
---

# 7 Data Structures

### 7.1 Voucher Resource Model <a href="#docs-internal-guid-2e7883c1-7fff-2230-02ab-f41e68a34a31" id="docs-internal-guid-2e7883c1-7fff-2230-02ab-f41e68a34a31"></a>

The voucher resource model is shown below.

![](.gitbook/assets/image10.png)

### 7.1.1 Minimum Required Data

| **Data element**    | **Description**                                                   | **Type** | **Required** |
| ------------------- | ----------------------------------------------------------------- | -------- | ------------ |
| Vouchers ID         | Unique voucher identifier                                         | Int64    | yes          |
| Voucher\_Number     | Secret voucher number                                             | Varchar  | Yes          |
| Voucher\_serial\_no | Unique voucher identifier for external parties                    | Varchar  | Yes          |
| Currency            | Voucher currency                                                  | Varchar  | Yes          |
| Create\_date        | Date when the voucher was created                                 | Date     | Yes          |
| Activate\_date      | Date when the voucher was activated                               | Date     | Yes          |
| Expiry\_date        | Date when voucher will expire                                     | Date     | Yes          |
| Voucher\_group      | Voucher group                                                     | Varchar  | Yes          |
| Status              | Status of the voucher (e.g. ACTIVATED, SUSPENDED, CONSUMED, etc.) | Varchar  | Yes          |
| Value               | Value of the Voucher                                              | Double   | Yes          |

### 7.1.2 Voucher Groups

| **Data element**     | **Description**                 | **Type** | **Required** |
| -------------------- | ------------------------------- | -------- | ------------ |
| Vouchers ID          | Unique voucher group identifier | Int64    | Yes          |
| Voucher\_group       | Voucher group short code        | Varchar  | Yes          |
| Voucher\_group\_desc | Voucher description             | Varchar  | Yes          |

## 7.2 Incoming Government Payments Resource

| **Name**                                       | **Description**                                                                                                                                                                                                      | **Type**  | Required           |
| ---------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------- | ------------------ |
| **transactionReference**                       | Unique reference for the transaction. This is returned in the response by FSP.                                                                                                                                       | string    | <p>→ NA<br>← M</p> |
| **requestingOrganisationTransactionReference** | A reference provided by the requesting organisation that is to be associated with the transaction.                                                                                                                   | string    | <p>→ O<br>← O</p>  |
| **originalTransactionReference**               | For reversals and refunds, this field indicates the transaction which is the subject of the reversal.                                                                                                                | string    | <p>→ O<br>← O</p>  |
| **creditParty**                                | A series of key/value pairs that enable the credit party to be identified. Keys include MSISDN and Wallet Identifier.                                                                                                | array     | <p>→ C<br>← C</p>  |
| **debitParty**                                 | A collection of key/value pairs that enable the debit party to be identified. Keys include MSISDN and Wallet Identifier.                                                                                             | array     | <p>→ C<br>← C</p>  |
| **type**                                       | The harmonised Transaction Type (not required if passed in the URL)                                                                                                                                                  | string    | <p>→ M<br>← M</p>  |
| **subType**                                    | A non-harmonised sub-classification of the type of transaction. Values are not fixed, and usage will vary according to Provider.                                                                                     | string    | <p>→ O<br>← O</p>  |
| **transactionStatus**                          | Indicates the status of the transaction as stored by the API provider.                                                                                                                                               | string    | <p>→ NA<br>← M</p> |
| **amount**                                     | The transaction amount.                                                                                                                                                                                              | string    | <p>→ M<br>← M</p>  |
| **currency**                                   | Currency of the transaction amount.                                                                                                                                                                                  | string    | <p>→ M<br>← M</p>  |
| **descriptionText**                            | Free format text description of the transaction provided by the client. This can be provided as a reference for the receiver on a notification SMS and on an account statement.                                      | string    | <p>→ O<br>← O</p>  |
| **fees**                                       | Allows the passing and/or returning of all fees pertaining to the transaction.                                                                                                                                       | array     | <p>→ O<br>← O</p>  |
| **geoCode**                                    | Indicates the geographic location from where the transaction was initiated.                                                                                                                                          | string    | <p>→ O<br>← O</p>  |
| **oneTimeCode**                                | A one-time code that can be supplied in the request or can be generated in the response depending upon the use case. An authorisation code can be supplied in this field for requests that have been pre-authorised. | string    | <p>→ O<br>← O</p>  |
| **requestingOrganisation**                     | The originating organisation of the request.                                                                                                                                                                         | object    | <p>→ O<br>← O</p>  |
| **servicingIdentity**                          | The field is used to identify the servicing identity for transactions, e.g. till, POS ID, assistant ID.                                                                                                              | string    | <p>→ O<br>← O</p>  |
| **transactionReceipt**                         | Transaction receipt number as notified to the parties. This may differ from the Transaction Reference.                                                                                                               | string    | <p>→ NA<br>← O</p> |
| **creationDate**                               | Date and time when the transaction was created by the API Provider                                                                                                                                                   | date-time | <p>→ NA<br>← O</p> |
| **modificationDate**                           | Date and time when the transaction was modified by the API Provider                                                                                                                                                  | date-time | <p>→ NA<br>← O</p> |
| **requestDate**                                | The creation date and time of the transaction as supplied by the client.                                                                                                                                             | date-time | <p>→ O<br>← O</p>  |
| **customData**                                 | A collection of key/value pairs that can be used for provider specific fields.                                                                                                                                       | string    | <p>→ O<br>← O</p>  |
| **metadata**                                   | A collection of key/value pairs. These can be used to populate additional transaction fields.                                                                                                                        | array     | <p>→ O<br>← O</p>  |

#### [#](https://developer.mobilemoneyapi.io/use-cases/merchant-payments/api-service-definition.html#reversals-api) <a href="#reversals-api" id="reversals-api"></a>

\




## 7.3 Data Elements <a href="#docs-internal-guid-8d4f18ff-7fff-2f74-3bc3-2f4c2a3f0a1b" id="docs-internal-guid-8d4f18ff-7fff-2f74-3bc3-2f4c2a3f0a1b"></a>

### 7.3.1 API Name: Voucher provisioning

| **Name**                | **Description**                                                     | **Type**          | **Required** | Standard | Notes  |
| ----------------------- | ------------------------------------------------------------------- | ----------------- | ------------ | -------- | ------ |
| voucher\_amount         | Denomination of the voucher required                                | Integer           | Y            |          | Input  |
| voucher\_currency       | The currency of the voucher                                         | String            | Y            | ISO 4217 | Input  |
| voucher\_group          | The group of the voucher                                            | String            | Y            |          | Input  |
| voucher\_number         | The voucher number (PIN). This is the secret number of the voucher. | Integer: 64-bit   | Y            |          | Output |
| voucher\_serial\_number | The voucher serial number                                           | Integer: 64-bit   | Y            |          | Output |
| expiry\_date            | The expiry date of the voucher                                      | String: date-time | Y            |          | Output |
| status                  | The status of the process: SUCCESSFUL or FAILED                     | String            | Y            |          | Output |
| Merchant\_group         | The group of the merchant is captured in the registry               | String            | Y            |          | Input  |
| Gov\_Stack\_BB          | Calling GOV Stack Building Block                                    | String            | Y            |          | Input  |
| merchant\_bank\_details | Merchant/agent payment details                                      | String            | Y            |          | Input  |
| merchant\_name          | Merchant name                                                       | String            | Y            |          | Input  |
| Override                | Override                                                            | Boolean           | Y            |          | Input  |
| Result\_Status          | Result of the process                                               | String            | Y            |          | Output |

### 7.3.2 API Name: Register Beneficiary

| **Field**         | **Description**                                                                                                                                                               | **Type** | **Required** |
| ----------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- | ------------ |
| RequestID         | Globally unique ID                                                                                                                                                            | String   | Y            |
| SourceBBID        | To identify the origination of the request.                                                                                                                                   | String   | Y            |
| Beneficiaries     | JSON Array                                                                                                                                                                    | Object   | Y            |
| PayeeFunctionalID | The functional Id of the beneficiary.                                                                                                                                         | String   | Y            |
| PaymentModality   | <p>00 for Bank Account</p><p>01 for Mobile Money</p><p>02 for Voucher</p><p>03 for Digital Wallet</p><p>04 for Proxy</p>                                                      | String   |              |
| FinancialAddress  | Destination Account Number, ideally an IBAN if available otherwise wallet destination accounts could be phone numbers as well, other Financial Addresses such as Aliases etc. | String   |              |

### 7.3.2 API name: Update Beneficiary details

| Field             | Description                                                                                                                                                                   | Type    | Required |
| ----------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------- | -------- |
| RequestID         | Globally unique ID                                                                                                                                                            | String  | Y        |
| SourceBBID        | To identify the origination of the request.                                                                                                                                   | String  | Y        |
| Beneficiaries     | JSON Array                                                                                                                                                                    | Object  |          |
| PayeeFunctionalID | The functional Id of the beneficiary.                                                                                                                                         | String  | Y        |
| PaymentModality   | <p>00 for Bank Account</p><p>01 for Mobile Money</p><p>02 for Voucher</p><p>03 for Digital Wallet</p><p>04 for Proxy</p>                                                      | String  |          |
| FinancialAddress  | Destination Account Number, ideally an IBAN if available otherwise wallet destination accounts could be phone numbers as well, other Financial Addresses such as Aliases etc. | String  |          |

### **7.3.3  API Name: Prepayment validation**

| Field              | Description                                            | Type    | Required |
| ------------------ | ------------------------------------------------------ | ------- | -------- |
| RequestID          | Globally unique ID                                     | String  | Y        |
| SourceBBID         | To identify the origination of the request.            | String  | Y        |
| BatchID            | BatchID for batch that is submitted by the Source BB.  | String  | Y        |
| CreditInstructions | JSON Array                                             | Object  |          |
|     InstructionID  | Individual ID for each instruction in the Credit Batch | String  | Y        |
| PayeeFunctionalID  | The functional Id of the beneficiary.                  | String  | Y        |
| Amount             | Amount to be Credited                                  | Float   | Y        |
| Currency           | Transaction Currency Code                              | String  | Y        |
| Narration          | Description of Payment                                 | String  |          |

### 7.3.4 API name: Bulk payment

| Field              | Description                                            | Type    | Required |
| ------------------ | ------------------------------------------------------ | ------- | -------- |
| RequestID          | Globally unique ID                                     | String  | Y        |
| SourceBBID         | To identify the origination of the request.            | String  | Y        |
| BatchID            | BatchID for batch that is submitted by the Source BB.  | String  | Y        |
| CreditInstructions | JSON Array                                             | Object  |          |
| InstructionID      | Individual ID for each instruction in the Credit Batch | String  | Y        |
| PayeeFunctionalID  | The functional Id of the beneficiary.                  | String  | Y        |
| Amount             | Amount to be Credited                                  | Float   | Y        |
| Currency           | Transaction Currency Code                              | String  | Y        |
| Narration          | Description of Payment                                 | String  |          |
