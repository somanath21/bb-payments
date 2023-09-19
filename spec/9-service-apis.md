---
description: >-
  This section provides a reference for APIs that should be implemented by this
  Building Block.
---

# 8 Service APIs

The APIs defined here establish a blueprint for how the Building Block will interact with other Building Blocks. Additional APIs may be implemented by the Building Block, but the listed APIs define a minimal set of functionality that should be provided by any implementation of this Building Block.

The [GovStack non-functional requirements document](https://govstack.gitbook.io/specification/v/1.0/architecture-and-nonfunctional-requirements/6-onboarding) provides additional information on how 'adaptors' may be used to translate an existing API to the patterns described here. This section also provides guidance on how candidate products are tested and how GovStack validates a product's API against the API specifications defined here.

The tests for the Payments Building Block can be found in [this GitHub repository](https://github.com/GovStackWorkingGroup/bb-payments/tree/main/test/openAPI).

## 8.1 Payment Orchestration

The payments BB APIs are listed below

<table data-header-hidden><thead><tr><th width="73.33333333333331"></th><th></th><th></th></tr></thead><tbody><tr><td>1</td><td>make_G2P_payment (Payer ID, Payee ID, Amounts, Currency, [Modality], Date)</td><td>Returns success code after payment confirmation or else returns failure status with error code</td></tr><tr><td>2</td><td>Create_transaction (Payer ID, Payee ID, BillReferenceID, Amount, Currency, Date)</td><td>Returns success code after payment confirmation or else returns failure status with error code</td></tr><tr><td>3</td><td>view_transaction(PayerID, PayeeID, FromDate, ToDate, [status]).</td><td>Returns success code along with payments history or else returns failure status with error code.</td></tr><tr><td>4</td><td>register_beneficiary(payee_functionalID, Modality, fsp_id, account_info)</td><td>Returns success code after creating entry along with mapperID.</td></tr><tr><td>5</td><td>update_beneficiary(payee_functionalID, Modality, fsp_id, account_info)</td><td>Returns success code after updating entry along with new mapperID.</td></tr><tr><td>6</td><td>get_paymentaccount_info(payee_functionalID)</td><td>Returns success code along with mapperID in tokenised format.</td></tr><tr><td>7</td><td>VoucherPreactivation (InstructionID, amount, Group_Code, currency, Expiry_DTTM, FunctionalID, Description)</td><td>Returns success code with voucher number, voucher serial number and expiry date.</td></tr><tr><td>8</td><td>VoucherActivation(voucher_number)</td><td>Returns success code. After this point the voucher may be redeemed.</td></tr><tr><td>9</td><td>VoucherRedemption(voucher_number, voucher_serial_number,[OC1] )</td><td>Returns success code and payment reference from the payment gateway. After this point the voucher CANNOT be used again as the system will fail it.</td></tr><tr><td>10</td><td>VoucherStatusCheck(serial_number)</td><td>Returns success code with the status of the voucher which may be either of Pre-Activated, Activated, Suspended, Blocked or Not Existing</td></tr><tr><td>11</td><td>VoucherCancellation(voucher_serial_number)</td><td>Returns a success code if the voucher has been successfully cancelled.</td></tr><tr><td>12</td><td>billInquiryBiller(RequestID, BillID)</td><td>This is the API that is called by the Payments BB to inquire bill details from the Bill Aggregator/Govt Entity, returns the relevant bill details including biller ID, Name, Bank Institutional Code (BIC), Status, Amount with due date and after due date.</td></tr><tr><td>13</td><td>markBillPpayment(requestID, Bill InquiryRequestID, billID, PaymentReference)</td><td>This is the API that is called by the Payments BB to Bill Aggregator/Govt Entity to mark bill as paid. returns requestId, billId, responseCode, reason, status</td></tr><tr><td>14</td><td>BillerRtpReq(requestId, Request to Pay ID, BillerID, Request Type, Payer Financial Details, alias, Bill details)</td><td>The Bill Aggregator Govt Entity calls this API from PBB for “Request To Pay”</td></tr><tr><td>15</td><td>billerRtpResp</td><td>The PBB calls this API from Biller to update it on the response of the RTP</td></tr><tr><td>16</td><td>rtpStatusUpdate</td><td>This API could be called by the Biller/Aggregator from the PBB to inquire about the status of its Request To Pay</td></tr></tbody></table>

## 8.1 Person-to-Government APIs (P2G) <a href="#docs-internal-guid-83db42bd-7fff-3768-b76a-9586be4ab890" id="docs-internal-guid-83db42bd-7fff-3768-b76a-9586be4ab890"></a>

The implementation will be such that a “Request to Pay” API is exposed and the Government Ministry (entity) is treated as a type of Biller.

### 8.1.1 Government Initiated P2G payment

This API is designed for the government entity to initiate a request to the Financial Service Provider (FSP) and will be credited when the payer approves the request.

### 8.1.2 P2G Bill Payments <a href="#docs-internal-guid-bfb99f40-7fff-cdda-fef1-dd6367f348ff" id="docs-internal-guid-bfb99f40-7fff-cdda-fef1-dd6367f348ff"></a>

The Bill Payments APIs allow government entities to accept bill payments from persons on digital platforms like mobile money.

## 8.2 Government to Person payments <a href="#docs-internal-guid-f78d8d0a-7fff-33bf-2d15-aced73dc0f65" id="docs-internal-guid-f78d8d0a-7fff-33bf-2d15-aced73dc0f65"></a>

These APIs link Source BB to the Payments Building Block for bulk payment processing, identity verification, and bank/wallet mapping. Third-party providers may add extra APIs depending on the country's payment landscape.

### Collaboration with G2PConnect on G2P Payments

GovStack is collaborating with G2P Connect to make it easier for countries to understand, find, and implement the optimal tools for executing digital payments for the aim of sustainable development. For those familiar with the GovStack initiative, it is no surprise we are collaborating with G2P Connect, as we share a common mission (to provide the technological tools to facilitate sustainable development) and similar methods (developing technical specifications and guidance).

G2P Connect is an open-source effort to enable G2P digital payments, built with interoperable standards and design templates. It offers a technology blueprint with a plug-and-play architecture with built in privacy and security; a set of integration specifications to ensure interoperability across the systems supporting G2P delivery; and an integration sandbox to support the development of solutions adhering to the blueprint and specifications.

As G2PConnect is focused exclusively on G2P payments, this is a cogent area of collaboration for the GovStack Payments building block workstream. Our joint objective is to develop synergies with specific use cases for G2P digital payments so that these use cases can also be implemented using GovStack APIs and building blocks. We will share best practices and lessons learned through defining the technical specifications and architecture components for G2P payments use cases. We will also integrate and test the APIs for G2P payments use cases in an integrated sandbox adhering to the G2P Connect and GovStack Payments building block specifications.

These valuable resources will then enable any country to implement G2P payments with digital sovereignty and minimal effort. Countries can choose to use our open specifications to make existing systems compatible, procure an open-source DPG, or even a proprietary solution compliant with the specifications. This approach gives countries agency, allowing them to constantly improve their solutions according to evolving needs.

### 8.2.1 Beneficiary Onboarding API

Once a new G2P beneficiary is onboarded by a G2P Program and assigned a Functional ID, they can be added to the Account Mapper in Payments BB after their eligibility for the social benefit program has been verified.

As the number of beneficiaries can be large, the API supports the addition of beneficiaries in the mapper in bulk. This allows for efficient onboarding and management of multiple beneficiaries at once, streamlining the process and reducing the time required for handling individual beneficiary registrations.

The Register Beneficiary API is invoked by the Information Mediator BB, which is triggered when the Registration BB is registering beneficiaries into the Payments BB's ID Mapper.

{% swagger src=".gitbook/assets/Registerbeneficiary.yaml" path="/register-beneficiary" method="post" %}
[Registerbeneficiary.yaml](.gitbook/assets/Registerbeneficiary.yaml)
{% endswagger %}

### 8.2.2 Update Beneficiary Details API

This is the API that is called by the Information Mediator BB when the Registration BB in turn calls its API for registering beneficiaries into the ID Mapper of the Payments BB.

{% swagger src="../api/UpdateBeneficiary.yaml" path="/update-beneficiary-details" method="post" %}
[UpdateBeneficiary.yaml](../api/UpdateBeneficiary.yaml)
{% endswagger %}

### 8.2.2 Pre Payment Validation API

This API is to be exposed by the Payments BB; the prepayment validation API, called by Source BB, retrieves eligible Functional IDs from the account mapper for credit transfers.

{% swagger src="../api/Prepaymentvalidation.yaml" path="/prepayment-validation" method="post" %}
[Prepaymentvalidation.yaml](../api/Prepaymentvalidation.yaml)
{% endswagger %}

### 8.2.2 Bulk disbursement APIs

This API is to be exposed by the Payments BB; it will be called by the Source BB to handover a batch of credit instructions to be processed.

{% swagger src="../api/bulkpayment.yaml" path="/bulk-payment" method="post" %}
[bulkpayment.yaml](../api/bulkpayment.yaml)
{% endswagger %}

## 8.3 Voucher APIs/Voucher Management <a href="#docs-internal-guid-9cf2815f-7fff-7e39-e7ed-207134468ff3" id="docs-internal-guid-9cf2815f-7fff-7e39-e7ed-207134468ff3"></a>

The first API in the section below is used to request for a voucher with a specific value, currency, and purpose. The server responds with a voucher number, serial number, and expiry date. The second call activates the pre-activated voucher. The third call processes voucher redemption, crediting the merchant if valid. A fourth API enables batch voucher activation through encrypted files. Additional APIs allow for voucher status checks and cancellations.

### 8.3.1 VoucherPreActivation API

The VoucherPreActivation API is used by non-Payment Building Blocks in the GovStack Framework to request for a voucher to be used. This call reserves the voucher (for a period, which is to be implemented). This API requests a single voucher from the voucher server that can be used for a future redemption process. The caller sends an amount, a voucher group (depending on the use case), the currency, and the name of the calling GovStack Building Block. If the API call is successful, the Payment Building Block will respond with a voucher number, a voucher serial number, and an expiry date.

{% swagger src="../api/VMS-API2-VMS-API2-GS_P_VMS_API-1.0.2-1.0.3-resolved_asynch (1) (1).json" path="/vouchers/voucher_preactivation" method="post" %}
[VMS-API2-VMS-API2-GS_P_VMS_API-1.0.2-1.0.3-resolved_asynch (1) (1).json](<../api/VMS-API2-VMS-API2-GS_P_VMS_API-1.0.2-1.0.3-resolved_asynch (1) (1).json>)
{% endswagger %}

### 8.3.2 VoucherActivation API <a href="#docs-internal-guid-53943e9f-7fff-ee8a-93a6-10bc57857bd7" id="docs-internal-guid-53943e9f-7fff-ee8a-93a6-10bc57857bd7"></a>

The VoucherActivation API is used by non-Payments Building Blocks in the GovStack Framework to activate a pre-activated voucher. This second function call is intended to ensure that the voucher is only activated when it is disbursed. This API requests for the activation of a voucher when the caller sends the voucher number to be activated. If the API call is successful, the activation is confirmed, and the voucher can now be used by the beneficiary.

{% swagger src="../api/VMS-API2-VMS-API2-GS_P_VMS_API-1.0.2-1.0.3-resolved_asynch (1) (1).json" path="/vouchers/voucher_activation" method="patch" %}
[VMS-API2-VMS-API2-GS_P_VMS_API-1.0.2-1.0.3-resolved_asynch (1) (1).json](<../api/VMS-API2-VMS-API2-GS_P_VMS_API-1.0.2-1.0.3-resolved_asynch (1) (1).json>)
{% endswagger %}

### 8.3.3 BatchVoucherActivation API <a href="#docs-internal-guid-97c3ee48-7fff-63bc-1eda-a2af444b93bb" id="docs-internal-guid-97c3ee48-7fff-63bc-1eda-a2af444b93bb"></a>

The BatchVoucherActivation API is used by a calling Building Block to activate vouchers in bulk. This may be used for bulk social cash transfers where the recipients receive benefits by vouchers. The calling Building Block is responsible for generating the beneficiary file as well as dispensing the vouchers. The Payments Building Block is responsible for generating and redeeming the voucher codes. Both BBs will have had to have exchanged encryption keys during the implementation phase.

The file provided by the calling Building Block (typically the Scheduler Building Block) will typically contain a unique identifier, the amount of the voucher required, the currency of the voucher, and the voucher group. While the file format may vary, the recommended file format is an encrypted JSON file.

If the file is properly formatted, the Payments Building Block will respond with a file that contains the unique ID that was sent, the status, the voucher number, the voucher serial number, and the expiry date of the voucher. The response file will also be an encrypted file to ensure the appropriate security of the voucher number.

The calling building block will dispense the vouchers as needed using an appropriate delivery mechanism. The calling Building Block will also be responsible for any verification of the beneficiary during the redemption process. The description of the dispensing of the vouchers once the calling block has received it is outside the scope of the Payments Building Block.

### 8.3.4 VoucherRedemption <a href="#docs-internal-guid-df8c2024-7fff-e374-7456-23db45c11b57" id="docs-internal-guid-df8c2024-7fff-e374-7456-23db45c11b57"></a>

The VoucherRedemption API is used by non-Payment Building Blocks in the GovStack Framework to redeem a voucher. The calling Building Block will capture the voucher number and the voucher serial number from the merchant point. The external Building Block will also acquire the merchant name and payment details from the merchant registry. The calling Building Block will then send the voucher number, the voucher serial number, the merchant’s name, and payment details. The Payment Building Block will verify that the voucher has been activated and has not been used or blocked or canceled. If so, the Payment Building Block will then send a payment request to the funding agency/Financial Services Provider. The Payment Gateway of the Payments Building Block will facilitate the debit of the funding account, and the credit of the merchant as well as handle any intermediary fees. Once the payment has been successfully done the Payment Building Block will mark the voucher as consumed and notify the merchant (and beneficiary if possible).

{% swagger src="../api/VMS-API2-VMS-API2-GS_P_VMS_API-1.0.2-1.0.3-resolved_asynch (1) (1).json" path="/vouchers/voucher_redeemption" method="post" %}
[VMS-API2-VMS-API2-GS_P_VMS_API-1.0.2-1.0.3-resolved_asynch (1) (1).json](<../api/VMS-API2-VMS-API2-GS_P_VMS_API-1.0.2-1.0.3-resolved_asynch (1) (1).json>)
{% endswagger %}

### 8.3.5 VoucherStatus API <a href="#docs-internal-guid-14288f23-7fff-3b24-f10e-6fb6e3200147" id="docs-internal-guid-14288f23-7fff-3b24-f10e-6fb6e3200147"></a>

The VoucherStatus API is used by non-Payment Building Blocks in the GovStack Framework to check the status of a voucher. The calling Building Block will capture the voucher number and send it to the Payments Building Block to determine the status of a voucher. The Payments Building Block will respond with one of the statuses of Pre-Activated, Activated, Suspended, Blocked, or Not Existing.

{% swagger src="../api/VMS-API2-VMS-API2-GS_P_VMS_API-1.0.2-1.0.3-resolved_asynch (1) (1).json" path="/vouchers/voucherstatuscheck/{voucherserialnumber}" method="get" %}
[VMS-API2-VMS-API2-GS_P_VMS_API-1.0.2-1.0.3-resolved_asynch (1) (1).json](<../api/VMS-API2-VMS-API2-GS_P_VMS_API-1.0.2-1.0.3-resolved_asynch (1) (1).json>)
{% endswagger %}

### 8.3.6 VoucherCancellation API <a href="#docs-internal-guid-ceb6fd44-7fff-a34f-207b-6fc5be1638fa" id="docs-internal-guid-ceb6fd44-7fff-a34f-207b-6fc5be1638fa"></a>

The VoucherCancellation API is used by non-Payments Building Blocks in the GovStack Framework to cancel a voucher. The calling Building Block will capture the voucher number and send it to the Payments Building Block to cancel the voucher. The Payments Building Block will respond with a status of Cancelled, Already Cancelled, or Not existing. The Voucher Cancellation will override the Blocked status and render the voucher permanently unusable.

### 8.4 P2G APIs

**8.4.1 billInquiryBiller**

This API is called to inquire about bill details from a Bill Aggregator or Govt Entity.

* Method: GET
* Parameters: requestId, billID
* Response: requestId, code, reason, billID, and billDetails.

**8.4.2 markBillPayment**

This API marks a bill as paid.

* Method: POST
* Parameters: requestID, billInquiryRequestId, billId, PaymentReferenceID
* Response: requestId, billId, responseCode, reason, status, and (if rejected) rejectReason.

**8.4.3 billerRtpReq**

The Bill Aggregator or Govt Entity initiates a “Request to Pay” (RTP) through this API.

* Method: POST
* Parameters: requestId, rtpId, billID, requestType, payerFiDetails/alias, billDetails
* Response: ResponseCode, ResponseDescription, and requestId.

**8.4.4 billerRtpResp**

The Payment system updates the Bill Aggregator or Govt Entity on the status of the RTP.

* Method: POST
* Parameters: requestId, rtpId, billId, rtpStatus, and rejectReason (if any).
* Response: ResponseCode, ResponseDescription, and requestId.

**8.4.5 rtpStatusUpdate**

This API allows the Biller or Aggregator to inquire about the status of its RTP.

* Method: GET
* Parameters: requestId, rtpId
* Response: ResponseCode, ResponseDescription, rtpId, requestId, requestStatus, PaymentReferenceID (if completed), voucherNumber (if completed by voucher), lastUpdateDate (of payment status change).
