@method=POST @endpoint=/update-beneficiary-details
Feature: Update beneficiary details

This is the API that is called by the Information Mediator BB when the Registration BB
in turn calls its API for registering beneficiaries into the ID Mapper of the Payments BB.

    @smoke @unit @positive
    Scenario: Succesfully updated beneficiary details smoke type test
        Given Information Mediator BB wants to update beneficiary details
        When POST request to update beneficiary details with given "stringstring" as RequestID, "stringstring" as SourceBBID and "stringstringstringst" as PayeeFunctionalID is sent
        Then The response from the /update-beneficiary-details is received
        And The /update-beneficiary-details response should be returned in a timely manner 15000ms
        And The /update-beneficiary-details response should have status 200
        And The /update-beneficiary-details response should have content-type: application/json header
        And The /update-beneficiary-details response should match json schema

    @unit @positive
    Scenario: Succesfully updated beneficiary details using not obligatory fields in the request payload
        Given Information Mediator BB wants to update beneficiary details
        When POST request to update beneficiary details with given "stringstring" as RequestID, "stringstring" as SourceBBID, "stringstringstringst" as PayeeFunctionalID, "01" as PaymentModality and "string" as FinancialAddress is sent
        Then The response from the /update-beneficiary-details is received
        And The /update-beneficiary-details response should be returned in a timely manner 15000ms
        And The /update-beneficiary-details response should have status 200
        And The /update-beneficiary-details response should have content-type: application/json header
        And The /update-beneficiary-details response should match json schema
        And The /update-beneficiary-details response ResponseCode field should be "00"
        And The /update-beneficiary-details response RequestID field should be "stringstring"

    @unit @negative
    Scenario: Unable to update beneficiary details because of missing required SourceBBID in the payload
        Given Information Mediator BB wants to update beneficiary details
        When POST request to update beneficiary details with given "stringstring" as RequestID and "stringstringstringst" as PayeeFunctionalID is sent
        Then The response from the /update-beneficiary-details is received
        And The /update-beneficiary-details response should be returned in a timely manner 15000ms
        And The /update-beneficiary-details response should have status 400
        And The /update-beneficiary-details response should have content-type: application/json header
        And The /update-beneficiary-details response should match json schema
        And The /update-beneficiary-details response ResponseCode field should be "01"
        And The /update-beneficiary-details response RequestID field should be "stringstring"

    @unit @negative
    Scenario: Unable to update beneficiary details because of missing required PayeeFunctionalID in the payload
        Given Information Mediator BB wants to update beneficiary details
        When POST request to update beneficiary details with given "stringstring" as RequestID and "stringstring" as SourceBBID is sent
        Then The response from the /update-beneficiary-details is received
        And The /update-beneficiary-details response should be returned in a timely manner 15000ms
        And The /update-beneficiary-details response should have status 400
        And The /update-beneficiary-details response should have content-type: application/json header
        And The /update-beneficiary-details response should match json schema
        And The /update-beneficiary-details response ResponseCode field should be "01"
        And The /update-beneficiary-details response RequestID field should be "stringstring"

    @unit @negative
    Scenario: Unable to update beneficiary details because of invalid SourceBBID value in the payload
        Given Information Mediator BB wants to update beneficiary details
        When POST request to update beneficiary details with given "stringstring" as RequestID, "invalid" as SourceBBID and "stringstringstringst" as PayeeFunctionalID is sent
        Then The response from the /update-beneficiary-details is received
        And The /update-beneficiary-details response should be returned in a timely manner 15000ms
        And The /update-beneficiary-details response should have status 400
        And The /update-beneficiary-details response should have content-type: application/json header
        And The /update-beneficiary-details response should match json schema
        And The /update-beneficiary-details response ResponseCode field should be "01"
        And The /update-beneficiary-details response RequestID field should be "stringstring"

    @unit @negative
    Scenario: Unable to update beneficiary details because of invalid PayeeFunctionalID value in the payload
        Given Information Mediator BB wants to update beneficiary details
        When POST request to update beneficiary details with given "stringstring" as RequestID, "stringstring" as SourceBBID and "invalid" as PayeeFunctionalID is sent
        Then The response from the /update-beneficiary-details is received
        And The /update-beneficiary-details response should be returned in a timely manner 15000ms
        And The /update-beneficiary-details response should have status 400
        And The /update-beneficiary-details response should have content-type: application/json header
        And The /update-beneficiary-details response should match json schema
        And The /update-beneficiary-details response ResponseCode field should be "01"
        And The /update-beneficiary-details response RequestID field should be "stringstring"
