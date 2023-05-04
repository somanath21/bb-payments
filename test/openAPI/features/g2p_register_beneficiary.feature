@method=POST @endpoint=/register-beneficiary
Feature: Register beneficiary

The Register Beneficiary API is invoked by the Information Mediator BB, 
which is triggered when the Registration BB is registering beneficiaries into the Payments BB's ID Mapper.

    @smoke @unit @positive
    Scenario: Succesfully registered a beneficiary smoke type test
        Given Information Mediator BB wants to register a beneficiary
        When POST request to register a beneficiary with given "stringstring" as RequestID, "stringstring" as SourceBBID and "stringstringstringst" as PayeeFunctionalID is sent
        Then The response from the /register-beneficiary is received
        And The /register-beneficiary response should be returned in a timely manner 15000ms
        And The /register-beneficiary response should have status 200
        And The /register-beneficiary response should have content-type: application/json header
        And The /register-beneficiary response should match json schema

    @unit @positive
    Scenario: Succesfully registered a beneficiary using not obligatory fields in the request payload
        Given Information Mediator BB wants to register a beneficiary
        When POST request to register a beneficiary with given "stringstring" as RequestID, "stringstring" as SourceBBID, "stringstringstringst" as PayeeFunctionalID, "01" as PaymentModality and "string" as FinancialAddress is sent
        Then The response from the /register-beneficiary is received
        And The /register-beneficiary response should be returned in a timely manner 15000ms
        And The /register-beneficiary response should have status 200
        And The /register-beneficiary response should have content-type: application/json header
        And The /register-beneficiary response should match json schema
        And The /register-beneficiary response ResponseCode field should be "00"
        And The /register-beneficiary response RequestID field should be "stringstring"

    @unit @negative
    Scenario: Unable to register a beneficiary because of missing required SourceBBID in the payload
        Given Information Mediator BB wants to register a beneficiary
        When POST request to register a beneficiary with given "stringstring" as RequestID and "stringstringstringst" as PayeeFunctionalID is sent
        Then The response from the /register-beneficiary is received
        And The /register-beneficiary response should be returned in a timely manner 15000ms
        And The /register-beneficiary response should have status 400
        And The /register-beneficiary response should have content-type: application/json header
        And The /register-beneficiary response should match json schema
        And The /register-beneficiary response ResponseCode field should be "01"
        And The /register-beneficiary response RequestID field should be "stringstring"

    @unit @negative
    Scenario: Unable to register a beneficiary because of missing required PayeeFunctionalID in the payload
        Given Information Mediator BB wants to register a beneficiary
        When POST request to register a beneficiary with given "stringstring" as RequestID and "stringstring" as SourceBBID is sent
        Then The response from the /register-beneficiary is received
        And The /register-beneficiary response should be returned in a timely manner 15000ms
        And The /register-beneficiary response should have status 400
        And The /register-beneficiary response should have content-type: application/json header
        And The /register-beneficiary response should match json schema
        And The /register-beneficiary response ResponseCode field should be "01"
        And The /register-beneficiary response RequestID field should be "stringstring"

    @unit @negative
    Scenario: Unable to register a beneficiary because of invalid SourceBBID value in the payload
        Given Information Mediator BB wants to register a beneficiary
        When POST request to register a beneficiary with given "stringstring" as RequestID, "invalid" as SourceBBID and "stringstringstringst" as PayeeFunctionalID is sent
        Then The response from the /register-beneficiary is received
        And The /register-beneficiary response should be returned in a timely manner 15000ms
        And The /register-beneficiary response should have status 400
        And The /register-beneficiary response should have content-type: application/json header
        And The /register-beneficiary response should match json schema
        And The /register-beneficiary response ResponseCode field should be "01"
        And The /register-beneficiary response RequestID field should be "stringstring"

    @unit @negative
    Scenario: Unable to register a beneficiary because of invalid PayeeFunctionalID value in the payload
        Given Information Mediator BB wants to register a beneficiary
        When POST request to register a beneficiary with given "stringstring" as RequestID, "stringstring" as SourceBBID and "invalid" as PayeeFunctionalID is sent
        Then The response from the /register-beneficiary is received
        And The /register-beneficiary response should be returned in a timely manner 15000ms
        And The /register-beneficiary response should have status 400
        And The /register-beneficiary response should have content-type: application/json header
        And The /register-beneficiary response should match json schema
        And The /register-beneficiary response ResponseCode field should be "01"
        And The /register-beneficiary response RequestID field should be "stringstring"
