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

![](<.gitbook/assets/image13 (1).png>)

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
