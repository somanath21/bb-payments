@method=POST @endpoint=/bulk-payment
Feature: Handover a batch of credit instructions to be processed

This API is to be exposed by the Payments BB.
It will be called by the Source BB to handover a batch of credit instructions to be processed.

    @smoke
    Scenario: Succesfully handovered a batch of credit instructions to be processed smoke type test
        Given Source BB wants to handover a batch of credit instructions to be processed
        When POST request to bulk-payments with given "stringstring" as RequestID, "stringstring" as SourceBBID, "stringstring" as BatchID, "stringstringstri" as InstructionID, "stringstringstringst" as PayeeFunctionalID, 100 as Amount and "USD" as Currency is sent
        Then The response from the /bulk-payment is received
        And The /bulk-payment response should be returned in a timely manner 15000ms
        And The /bulk-payment response should have status 200
        And The /bulk-payment response should have content-type: application/json header
        And The /bulk-payment response should match json schema

    @unit @positive
    Scenario: Succesfully handovered a batch of credit instructions to be processed using not obligatory fields in the request payload
        Given Source BB wants to handover a batch of credit instructions to be processed
        When POST request to bulk-payments with given "stringstring" as RequestID, "stringstring" as SourceBBID, "stringstring" as BatchID, "stringstringstri" as InstructionID, "stringstringstringst" as PayeeFunctionalID, 100 as Amount, "USD" as Currency and "string" as Narration is sent
        Then The response from the /bulk-payment is received
        And The /bulk-payment response should be returned in a timely manner 15000ms
        And The /bulk-payment response should have status 200
        And The /bulk-payment response should have content-type: application/json header
        And The /bulk-payment response should match json schema
        And The /bulk-payment response ResponseCode field should be "00"
        And The /bulk-payment response RequestID field should be "stringstring"

    @unit @negative
    Scenario: Unable to handover a batch of credit instructions to be processed because of missing required SourceBBID in the payload
        Given Source BB wants to handover a batch of credit instructions to be processed
        When POST request to bulk-payments with given "stringstring" as RequestID, "stringstring" as BatchID, "stringstringstri" as InstructionID, "stringstringstringst" as PayeeFunctionalID, 100 as Amount and "USD" as Currency is sent
        Then The response from the /bulk-payment is received
        And The /bulk-payment response should be returned in a timely manner 15000ms
        And The /bulk-payment response should have status 400

    @unit @negative
    Scenario: Unable to handover a batch of credit instructions to be processed because of missing required BatchID in the payload
        Given Source BB wants to handover a batch of credit instructions to be processed
        When POST request to bulk-payments with given "stringstring" as RequestID, "stringstring" as SourceBBID, "stringstringstri" as InstructionID, "stringstringstringst" as PayeeFunctionalID, 100 as Amount and "USD" as Currency is sent
        Then The response from the /bulk-payment is received
        And The /bulk-payment response should be returned in a timely manner 15000ms
        And The /bulk-payment response should have status 400

    @unit @negative
    Scenario: Unable to handover a batch of credit instructions to be processed because of empty CreditInstructions array in the payload
        Given Source BB wants to handover a batch of credit instructions to be processed
        When POST request to bulk-payments with given "stringstring" as RequestID, "stringstring" as SourceBBID, "stringstring" as BatchID and an empty array as CreditInstructions is sent
        Then The response from the /bulk-payment is received
        And The /bulk-payment response should be returned in a timely manner 15000ms
        And The /bulk-payment response should have status 400

    @unit @negative
    Scenario: Unable to handover a batch of credit instructions to be processed because of invalid SourceBBID value in the payload
        Given Source BB wants to handover a batch of credit instructions to be processed
        When POST request to bulk-payments with given "stringstring" as RequestID, "invalid" as SourceBBID, "stringstring" as BatchID, "stringstringstri" as InstructionID, "stringstringstringst" as PayeeFunctionalID, 100 as Amount and "USD" as Currency is sent
        Then The response from the /bulk-payment is received
        And The /bulk-payment response should be returned in a timely manner 15000ms
        And The /bulk-payment response should have status 400

    @unit @negative
    Scenario: Unable to handover a batch of credit instructions to be processed because of invalid BatchID value in the payload
        Given Source BB wants to handover a batch of credit instructions to be processed
        When POST request to bulk-payments with given "stringstring" as RequestID, "stringstring" as SourceBBID, "invalid" as BatchID, "stringstringstri" as InstructionID, "stringstringstringst" as PayeeFunctionalID, 100 as Amount and "USD" as Currency is sent
        Then The response from the /bulk-payment is received
        And The /bulk-payment response should be returned in a timely manner 15000ms
        And The /bulk-payment response should have status 400
