@method=POST @endpoint=/prepayment-validation
Feature: Pre-payment validation

    @smoke @unit @positive
    Scenario: Succesfully retrieves eligible Functional IDs from the account mapper for credit transfers smoke type test

        Given Wants to retrieves eligible Functional IDs from the account mapper for credit transfers
        When POST request with required body with given "abcdef123456" as RequestID, "sourceBBID12" as SourceBBID, "batchID12345" as BatchID, "instructionID123" as InstructionID, "PayeeFunctionalID123" as PayeeFunctionalID, "100" as Amount, "USD" as Currency, "Narration" as Narration is sent
        Then The response from the /prepayment-validation is received
        And The /prepayment-validation response should be returned in a timely manner 15000ms
        And The /prepayment-validation response should have status 200
        And The /prepayment-validation response should have content-type: application/json header
        And The /prepayment-validation response should match json schema

    @unit @positive
    Scenario: Succesfully retrieves eligible Functional IDs from the account mapper for credit transfers
        Given Wants to retrieves eligible Functional IDs from the account mapper for credit transfers
        When POST request with required body with given "abcdef123456" as RequestID, "sourceBBID12" as SourceBBID, "batchID12345" as BatchID, "instructionID123" as InstructionID, "PayeeFunctionalID123" as PayeeFunctionalID, "100" as Amount, "USD" as Currency, "Narration" as Narration is sent
        Then The response from the /prepayment-validation is received
        And The /prepayment-validation response should be returned in a timely manner 15000ms
        And The /prepayment-validation response should have status 200
        And The /prepayment-validation response should have content-type: application/json header
        And The /prepayment-validation response should match json schema
        And The /prepayment-validation response ResponseCode field should be "00"
        And The /prepayment-validation response RequestID field should be "abcdef123456"

    # @unit @negative
    # Scenario: Unable to retrieves eligible Functional IDs from the account mapper for credit transfers because of missing required RequestID in the payload
    #     Given Wants to retrieves eligible Functional IDs from the account mapper for credit transfers
    #     When POST request with required body with given "sourceBBID12" as SourceBBID, "batchID12345" as BatchID, "instructionID123" as InstructionID, "PayeeFunctionalID123" as PayeeFunctionalID, "100" as Amount, "USD" as Currency, "Narration" as Narration is sent
    #     Then The response from the /prepayment-validation is received
    #     And The /prepayment-validation response should be returned in a timely manner 15000ms
    #     And The /prepayment-validation response should have status 400
    #     And The /prepayment-validation response should have content-type: application/json header
    #     And The /prepayment-validation response should match json schema
    #     And The /prepayment-validation response ResponseCode field should be "01"

    @unit @negative
    Scenario: Unable to retrieves eligible Functional IDs from the account mapper for credit transfers because of missing required SourceBBID in the payload
        Given Wants to retrieves eligible Functional IDs from the account mapper for credit transfers
        When POST request with required body with given "abcdef123456" as RequestID, "batchID12345" as BatchID, "instructionID123" as InstructionID, "PayeeFunctionalID123" as PayeeFunctionalID, "100" as Amount, "USD" as Currency, "Narration" as Narration is sent
        Then The response from the /prepayment-validation is received
        And The /prepayment-validation response should be returned in a timely manner 15000ms
        And The /prepayment-validation response should have status 400
        And The /prepayment-validation response should have content-type: application/json header
        And The /prepayment-validation response should match json schema
        And The /prepayment-validation response ResponseCode field should be "01"

    @unit @negative
    Scenario: Unable to retrieves eligible Functional IDs from the account mapper for credit transfers because of missing required BatchID in the payload
        Given Wants to retrieves eligible Functional IDs from the account mapper for credit transfers
        When POST request with required body with given "abcdef123456" as RequestID, "sourceBBID12" as SourceBBID, "instructionID123" as InstructionID, "PayeeFunctionalID123" as PayeeFunctionalID, "100" as Amount, "USD" as Currency, "Narration" as Narration is sent
        Then The response from the /prepayment-validation is received
        And The /prepayment-validation response should be returned in a timely manner 15000ms
        And The /prepayment-validation response should have status 400
        And The /prepayment-validation response should have content-type: application/json header
        And The /prepayment-validation response should match json schema
        And The /prepayment-validation response ResponseCode field should be "01"
    
    @unit @negative
    Scenario: Unable to retrieves eligible Functional IDs from the account mapper for credit transfers because of missing required InstructionID in the payload
        Given Wants to retrieves eligible Functional IDs from the account mapper for credit transfers
        When POST request with required body with given "abcdef123456" as RequestID, "sourceBBID12" as SourceBBID, "batchID12345" as BatchID, "PayeeFunctionalID123" as PayeeFunctionalID, "100" as Amount, "USD" as Currency, "Narration" as Narration is sent
        Then The response from the /prepayment-validation is received
        And The /prepayment-validation response should be returned in a timely manner 15000ms
        And The /prepayment-validation response should have status 400
        And The /prepayment-validation response should have content-type: application/json header
        And The /prepayment-validation response should match json schema
        And The /prepayment-validation response ResponseCode field should be "01"

    @unit @negative
    Scenario: Unable to retrieves eligible Functional IDs from the account mapper for credit transfers because of missing required PayeeFunctionalID in the payload
        Given Wants to retrieves eligible Functional IDs from the account mapper for credit transfers
        When POST request with required body with given "abcdef123456" as RequestID, "sourceBBID12" as SourceBBID, "batchID12345" as BatchID, "instructionID123" as InstructionID, "100" as Amount, "USD" as Currency, "Narration" as Narration is sent
        Then The response from the /prepayment-validation is received
        And The /prepayment-validation response should be returned in a timely manner 15000ms
        And The /prepayment-validation response should have status 400
        And The /prepayment-validation response should have content-type: application/json header
        And The /prepayment-validation response should match json schema
        And The /prepayment-validation response ResponseCode field should be "01"

    @unit @negative
    Scenario: Unable to retrieves eligible Functional IDs from the account mapper for credit transfers because of missing required Amount in the payload
        Given Wants to retrieves eligible Functional IDs from the account mapper for credit transfers
        When POST request with required body with given "abcdef123456" as RequestID, "sourceBBID12" as SourceBBID, "batchID12345" as BatchID, "instructionID123" as InstructionID, "PayeeFunctionalID123" as PayeeFunctionalID, "USD" as Currency, "Narration" as Narration is sent
        Then The response from the /prepayment-validation is received
        And The /prepayment-validation response should be returned in a timely manner 15000ms
        And The /prepayment-validation response should have status 400
        And The /prepayment-validation response should have content-type: application/json header
        And The /prepayment-validation response should match json schema
        And The /prepayment-validation response ResponseCode field should be "01"

    @unit @negative
    Scenario: Unable to retrieves eligible Functional IDs from the account mapper for credit transfers because of missing required Currency in the payload
        Given Wants to retrieves eligible Functional IDs from the account mapper for credit transfers
        When POST request with required body with given "abcdef123456" as RequestID, "sourceBBID12" as SourceBBID, "batchID12345" as BatchID, "instructionID123" as InstructionID, "PayeeFunctionalID123" as PayeeFunctionalID, "100" as Amount, "Narration" as Narration is sent
        Then The response from the /prepayment-validation is received
        And The /prepayment-validation response should be returned in a timely manner 15000ms
        And The /prepayment-validation response should have status 400
        And The /prepayment-validation response should have content-type: application/json header
        And The /prepayment-validation response should match json schema
        And The /prepayment-validation response ResponseCode field should be "01"

    @unit @negative
    Scenario: Unable to retrieves eligible Functional IDs from the account mapper for credit transfers because of missing required Narration in the payload
        Given Wants to retrieves eligible Functional IDs from the account mapper for credit transfers
        When POST request with required body with given "abcdef123456" as RequestID, "sourceBBID12" as SourceBBID, "batchID12345" as BatchID, "instructionID123" as InstructionID, "PayeeFunctionalID123" as PayeeFunctionalID, "100" as Amount, "USD" as Currency is sent
        Then The response from the /prepayment-validation is received
        And The /prepayment-validation response should be returned in a timely manner 15000ms
        And The /prepayment-validation response should have status 400
        And The /prepayment-validation response should have content-type: application/json header
        And The /prepayment-validation response should match json schema
        And The /prepayment-validation response ResponseCode field should be "01"
