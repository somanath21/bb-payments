---
description: >-
  This section provides a reference for APIs that should be implemented by this
  Building Block.
---

# 8 Service APIs

The APIs defined here establish a blueprint for how the Building Block will interact with other Building Blocks. Additional APIs may be implemented by the Building Block, but the listed APIs define a minimal set of functionality that should be provided by any implementation of this Building Block.

The [GovStack non-functional requirements document](https://govstack.gitbook.io/specification/v/1.0/architecture-and-nonfunctional-requirements/6-onboarding) provides additional information on how 'adaptors' may be used to translate an existing API to the patterns described here.

## 4.1 Payment Orchestration

## 8.1 Person-to-Government APIs (P2G) <a href="#docs-internal-guid-83db42bd-7fff-3768-b76a-9586be4ab890" id="docs-internal-guid-83db42bd-7fff-3768-b76a-9586be4ab890"></a>

The implementation will be such that a “Request to Pay” API is exposed and the Government Ministry (entity) is treated as a type of Biller.

### 8.1.1 Government Initiated P2G payment

This API is designed for the government entity to initiate a request to the Financial Service Provider (FSP) and will be credited when the payer approves the request.

{% swagger src=".gitbook/assets/Mobile_Money_API_v1.1.2-Specification_Definition (1) (1).yaml" path="/transactions" method="post" %}
[Mobile_Money_API_v1.1.2-Specification_Definition (1) (1).yaml](<.gitbook/assets/Mobile_Money_API_v1.1.2-Specification_Definition (1) (1).yaml>)
{% endswagger %}

{% swagger src=".gitbook/assets/Mobile_Money_API_v1.1.2-Specification_Definition (1) (1).yaml" path="/transactions/{transactionReference}" method="get" %}
[Mobile_Money_API_v1.1.2-Specification_Definition (1) (1).yaml](<.gitbook/assets/Mobile_Money_API_v1.1.2-Specification_Definition (1) (1).yaml>)
{% endswagger %}

### 8.1.2 P2G Bill Payments <a href="#docs-internal-guid-bfb99f40-7fff-cdda-fef1-dd6367f348ff" id="docs-internal-guid-bfb99f40-7fff-cdda-fef1-dd6367f348ff"></a>

The Bill Payments APIs allow government entities to accept bill payments from persons on digital platforms like mobile money.

{% swagger src=".gitbook/assets/Mobile_Money_API_v1.1.2-Specification_Definition (1) (1).yaml" path="/accounts/{accountId}/bills/{billReference}/payments" method="post" %}
[Mobile_Money_API_v1.1.2-Specification_Definition (1) (1).yaml](<.gitbook/assets/Mobile_Money_API_v1.1.2-Specification_Definition (1) (1).yaml>)
{% endswagger %}

## 8.2 Government to Person payments <a href="#docs-internal-guid-f78d8d0a-7fff-33bf-2d15-aced73dc0f65" id="docs-internal-guid-f78d8d0a-7fff-33bf-2d15-aced73dc0f65"></a>

These APIs link Source BB to the Payments Building Block for bulk payment processing, identity verification, and bank/wallet mapping. Third-party providers may add extra APIs depending on the country's payment landscape.

## 8.2.1 Beneficiary Onboarding API

Once a new G2P beneficiary is onboarded by a G2P Program and assigned a Functional ID, they can be added to the Account Mapper in Payments BB after their eligibility for the social benefit program has been verified.

As the number of beneficiaries can be large, the API supports the addition of beneficiaries in the mapper in bulk. This allows for efficient onboarding and management of multiple beneficiaries at once, streamlining the process and reducing the time required for handling individual beneficiary registrations.

The Register Beneficiary API is invoked by the Information Mediator BB, which is triggered when the Registration BB is registering beneficiaries into the Payments BB's ID Mapper.

#### Request Parameters

| Field             | Type        | Required | Description                                                                                                                                                                    |
| ----------------- | ----------- | -------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| RequestID         | String (12) | Yes      | Globally unique ID                                                                                                                                                             |
| SourceBBID        | String (12) | Yes      | To identify the origination of the request.                                                                                                                                    |
| Beneficiaries     | Object      | Yes      | JSON Array                                                                                                                                                                     |
| PayeeFunctionalID | String (20) | Yes      | The functional ID of the beneficiary.                                                                                                                                          |
| PaymentModality   | String (2)  | No       | 00 for Bank Account, 01 for Mobile Money, 02 for Voucher, 03 for Digital Wallet, 04 for Proxy                                                                                  |
| FinancialAddress  | String (30) | No       | Destination Account Number, ideally an IBAN if available, otherwise wallet destination accounts could be phone numbers as well, other Financial Addresses such as Aliases etc. |

{% swagger src=".gitbook/assets/Registerbeneficiary.yaml" path="/register-beneficiary" method="post" %}
[Registerbeneficiary.yaml](.gitbook/assets/Registerbeneficiary.yaml)
{% endswagger %}

#### Response Parameters

| Field               | Type         | Required | Description                |
| ------------------- | ------------ | -------- | -------------------------- |
| ResponseCode        | String (2)   | Yes      | 00 – Success, 01 – Failure |
| ResponseDescription | String (200) | Yes      |                            |
| RequestID           | String (12)  | Yes      | Echoed from Request        |

## 8.2.2 Update Beneficiary Details API

This is the API that is called by the Information Mediator BB when the Registration BB in turn calls its API for registering beneficiaries into the ID Mapper of the Payments BB.

#### Request Parameters

| Field             | Type        | Required | Description                                                                                                                                                                    |
| ----------------- | ----------- | -------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| RequestID         | String (12) | Yes      | Globally unique ID                                                                                                                                                             |
| SourceBBID        | String (12) | Yes      | To identify the origination of the request.                                                                                                                                    |
| Beneficiaries     | Object      | Yes      | JSON Array                                                                                                                                                                     |
| PayeeFunctionalID | String (20) | Yes      | The functional ID of the beneficiary.                                                                                                                                          |
| PaymentModality   | String (2)  | No       | 00 for Bank Account, 01 for Mobile Money, 02 for Voucher, 03 for Digital Wallet, 04 for Proxy                                                                                  |
| FinancialAddress  | String (30) | No       | Destination Account Number, ideally an IBAN if available, otherwise wallet destination accounts could be phone numbers as well, other Financial Addresses such as Aliases etc. |

{% swagger src=".gitbook/assets/UpdateBeneficiary.yaml" path="/update-beneficiary-details" method="post" %}
[UpdateBeneficiary.yaml](.gitbook/assets/UpdateBeneficiary.yaml)
{% endswagger %}

#### Response Parameters

| Field               | Type         | Required | Description                |
| ------------------- | ------------ | -------- | -------------------------- |
| ResponseCode        | String (2)   | Yes      | 00 – Success, 01 – Failure |
| ResponseDescription | String (200) | Yes      |                            |
| RequestID           | String (12)  | Yes      | Echoed from Request        |

## 8.2.2 Pre Payment Validation API

This API is to be exposed by the Payments BB; the prepayment validation API, called by Source BB, retrieves eligible Functional IDs from the account mapper for credit transfers.

#### Request Parameters

| Field              | Type        | Required | Description                                            |
| ------------------ | ----------- | -------- | ------------------------------------------------------ |
| RequestID          | String (12) | Yes      | Globally unique ID                                     |
| SourceBBID         | String (12) | Yes      | To identify the origination of the request.            |
| BatchID            | String (12) | Yes      | BatchID for batch submitted by the Source BB.          |
| CreditInstructions | Object      | Yes      | JSON Array                                             |
| InstructionID      | String (16) | Yes      | Individual ID for each instruction in the Credit Batch |
| PayeeFunctionalID  | String (20) | Yes      | The functional ID of the beneficiary.                  |
| Amount             | Float       | Yes      | Amount to be Credited                                  |
| Currency           | String (3)  | Yes      | Transaction Currency Code                              |
| Narration          | String (50) | No       | Description of Payment                                 |

{% swagger src=".gitbook/assets/Prepaymentvalidation.yaml" path="/prepayment-validation" method="post" %}
[Prepaymentvalidation.yaml](.gitbook/assets/Prepaymentvalidation.yaml)
{% endswagger %}

| Field               | Type         | Required | Description                |
| ------------------- | ------------ | -------- | -------------------------- |
| ResponseCode        | String (2)   | Yes      | 00 – Success, 01 – Failure |
| ResponseDescription | String (200) | Yes      |                            |
| RequestID           | String (12)  | Yes      | Echoed from Request        |

## 8.2.2 Bulk disbursement APIs

This API is to be exposed by the Payments BB; it will be called by the Source BB to handover a batch of credit instructions to be processed.

#### Request Parameters

| Field              | Type        | Required | Description                                            |
| ------------------ | ----------- | -------- | ------------------------------------------------------ |
| RequestID          | String (12) | Yes      | Globally unique ID                                     |
| SourceBBID         | String (12) | Yes      | To identify the origination of the request.            |
| BatchID            | String (12) | Yes      | BatchID for batch submitted by the Source BB.          |
| CreditInstructions | Object      | Yes      | JSON Array                                             |
| InstructionID      | String (16) | Yes      | Individual ID for each instruction in the Credit Batch |
| PayeeFunctionalID  | String (20) | Yes      | The functional ID of the beneficiary.                  |
| Amount             | Float       | Yes      | Amount to be Credited                                  |
| Currency           | String (3)  | Yes      | Transaction Currency Code                              |
| Narration          | String (50) | No       | Description of Payment                                 |

{% swagger src=".gitbook/assets/bulkpayment.yaml" path="/bulk-payment" method="post" %}
[bulkpayment.yaml](.gitbook/assets/bulkpayment.yaml)
{% endswagger %}

#### Response Parameters

| Field               | Type         | Required | Description                |
| ------------------- | ------------ | -------- | -------------------------- |
| ResponseCode        | String (2)   | Yes      | 00 – Success, 01 – Failure |
| ResponseDescription | String (200) | Yes      |                            |
| RequestID           | String (12)  | Yes      | Echoed from Request        |

## 8.6 Voucher APIs <a href="#docs-internal-guid-9cf2815f-7fff-7e39-e7ed-207134468ff3" id="docs-internal-guid-9cf2815f-7fff-7e39-e7ed-207134468ff3"></a>

The first API in the section below is used to request for a voucher with a specific value, currency, and purpose. The server responds with a voucher number, serial number, and expiry date. The second call activates the pre-activated voucher. The third call processes voucher redemption, crediting the merchant if valid. A fourth API enables batch voucher activation through encrypted files. Additional APIs allow for voucher status checks and cancellations.

### 8.6.1 VoucherPreActivation API

The VoucherPreActivation API is used by non-Payment Building Blocks in the GovStack Framework to request for a voucher to be used. This call reserves the voucher (for a period, which is to be implemented). This API requests a single voucher from the voucher server that can be used for a future redemption process. The caller sends an amount, a voucher group (depending on the use case), the currency, and the name of the calling GovStack Building Block. If the API call is successful, the Payment Building Block will respond with a voucher number, a voucher serial number, and an expiry date.

{% swagger src=".gitbook/assets/VoucherAPIS.json" path="/vouchers/voucher_preactivation" method="post" %}
[VoucherAPIS.json](.gitbook/assets/VoucherAPIS.json)
{% endswagger %}

### 8.6.2 VoucherActivation API <a href="#docs-internal-guid-53943e9f-7fff-ee8a-93a6-10bc57857bd7" id="docs-internal-guid-53943e9f-7fff-ee8a-93a6-10bc57857bd7"></a>

The VoucherActivation API is used by non-Payments Building Blocks in the GovStack Framework to activate a pre-activated voucher. This second function call is intended to ensure that the voucher is only activated when it is disbursed. This API requests for the activation of a voucher when the caller sends the voucher number to be activated. If the API call is successful, the activation is confirmed, and the voucher can now be used by the beneficiary.

{% swagger src=".gitbook/assets/VoucherAPIS.json" path="/vouchers/voucher_activation" method="patch" %}
[VoucherAPIS.json](.gitbook/assets/VoucherAPIS.json)
{% endswagger %}

### 8.6.3 BatchVoucherActivation API <a href="#docs-internal-guid-97c3ee48-7fff-63bc-1eda-a2af444b93bb" id="docs-internal-guid-97c3ee48-7fff-63bc-1eda-a2af444b93bb"></a>

The BatchVoucherActivation API is used by a calling Building Block to activate vouchers in bulk. This may be used for bulk social cash transfers where the recipients receive benefits by vouchers. The calling Building Block is responsible for generating the beneficiary file as well as dispensing the vouchers. The Payments Building Block is responsible for generating and redeeming the voucher codes. Both BBs will have had to have exchanged encryption keys during the implementation phase.

The file provided by the calling Building Block (typically the Scheduler Building Block) will typically contain a unique identifier, the amount of the voucher required, the currency of the voucher, and the voucher group. While the file format may vary, the recommended file format is an encrypted JSON file.

If the file is properly formatted, the Payments Building Block will respond with a file that contains the unique ID that was sent, the status, the voucher number, the voucher serial number, and the expiry date of the voucher. The response file will also be an encrypted file to ensure the appropriate security of the voucher number.

The calling building block will dispense the vouchers as needed using an appropriate delivery mechanism. The calling Building Block will also be responsible for any verification of the beneficiary during the redemption process. The description of the dispensing of the vouchers once the calling block has received it is outside the scope of the Payments Building Block.

### 8.6.4 VoucherRedemption <a href="#docs-internal-guid-df8c2024-7fff-e374-7456-23db45c11b57" id="docs-internal-guid-df8c2024-7fff-e374-7456-23db45c11b57"></a>

The VoucherRedemption API is used by non-Payment Building Blocks in the GovStack Framework to redeem a voucher. The calling Building Block will capture the voucher number and the voucher serial number from the merchant point. The external Building Block will also acquire the merchant name and payment details from the merchant registry. The calling Building Block will then send the voucher number, the voucher serial number, the merchant’s name, and payment details. The Payment Building Block will verify that the voucher has been activated and has not been used or blocked or canceled. If so, the Payment Building Block will then send a payment request to the funding agency/Financial Services Provider. The Payment Gateway of the Payments Building Block will facilitate the debit of the funding account, and the credit of the merchant as well as handle any intermediary fees. Once the payment has been successfully done the Payment Building Block will mark the voucher as consumed and notify the merchant (and beneficiary if possible).

{% swagger src=".gitbook/assets/VoucherAPIS.json" path="/vouchers/voucher_redeemption" method="post" %}
[VoucherAPIS.json](.gitbook/assets/VoucherAPIS.json)
{% endswagger %}

### 8.6.5 VoucherStatus API <a href="#docs-internal-guid-14288f23-7fff-3b24-f10e-6fb6e3200147" id="docs-internal-guid-14288f23-7fff-3b24-f10e-6fb6e3200147"></a>

The VoucherStatus API is used by non-Payment Building Blocks in the GovStack Framework to check the status of a voucher. The calling Building Block will capture the voucher number and send it to the Payments Building Block to determine the status of a voucher. The Payments Building Block will respond with one of the statuses of Pre-Activated, Activated, Suspended, Blocked, or Not Existing.

{% swagger src=".gitbook/assets/VoucherAPIS.json" path="/vouchers/voucherstatuscheck/{voucherserialnumber}" method="get" %}
[VoucherAPIS.json](.gitbook/assets/VoucherAPIS.json)
{% endswagger %}

### 8.6.6 VoucherCancellation API <a href="#docs-internal-guid-ceb6fd44-7fff-a34f-207b-6fc5be1638fa" id="docs-internal-guid-ceb6fd44-7fff-a34f-207b-6fc5be1638fa"></a>

The VoucherCancellation API is used by non-Payments Building Blocks in the GovStack Framework to cancel a voucher. The calling Building Block will capture the voucher number and send it to the Payments Building Block to cancel the voucher. The Payments Building Block will respond with a status of Cancelled, Already Cancelled, or Not existing. The Voucher Cancellation will override the Blocked status and render the voucher permanently unusable.

***
