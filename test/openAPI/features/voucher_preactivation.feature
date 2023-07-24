@method=POST @endpoint=/vouchers/voucher_preactivation
Feature: The VoucherPreactivation API is used to request for a pre-activated voucher to be used.

  @smoke @positive
  Scenario: The user successfully receives a pre-activated voucher smoke type test
    Given The user wants to receives a pre-activated voucher
    When Send POST /vouchers/voucher_preactivation request with given body
    Then Receive a response from the /vouchers/voucher_preactivation endpoint
    And The /vouchers/voucher_preactivation endpoint response should be returned in a timely manner 15000ms
    And The /vouchers/voucher_preactivation endpoint response should have status 200
    And The /vouchers/voucher_preactivation endpoint response should match json schema

  @positive
  Scenario: The user successfully receives a pre-activated voucher by providing the optional X-Callback-URL header
    Given The user wants to receives a pre-activated voucher
    When Send POST /vouchers/voucher_preactivation request with given body
    And Send with optional X-Callback-URL header
    Then Receive a response from the /vouchers/voucher_preactivation endpoint
    And The /vouchers/voucher_preactivation endpoint response should be returned in a timely manner 15000ms
    And The /vouchers/voucher_preactivation endpoint response should have status 200
    And The /vouchers/voucher_preactivation endpoint response should match json schema

  @positive
  Scenario: The user successfully receives a pre-activated voucher by providing the optional X-Channel header
    Given The user wants to receives a pre-activated voucher
    When Send POST /vouchers/voucher_preactivation request with given body
    And Send with optional X-Channel header
    Then Receive a response from the /vouchers/voucher_preactivation endpoint
    And The /vouchers/voucher_preactivation endpoint response should be returned in a timely manner 15000ms
    And The /vouchers/voucher_preactivation endpoint response should have status 200
    And The /vouchers/voucher_preactivation endpoint response should match json schema

  @positive
  Scenario: The user successfully receives a pre-activated voucher by providing the optional X-Date header
    Given The user wants to receives a pre-activated voucher
    When Send POST /vouchers/voucher_preactivation request with given body
    And Send with optional X-Date header
    Then Receive a response from the /vouchers/voucher_preactivation endpoint
    And The /vouchers/voucher_preactivation endpoint response should be returned in a timely manner 15000ms
    And The /vouchers/voucher_preactivation endpoint response should have status 200
    And The /vouchers/voucher_preactivation endpoint response should match json schema

  @positive
  Scenario: The user successfully receives a pre-activated voucher by providing the optional X-CorrelationID header
    Given The user wants to receives a pre-activated voucher
    When Send POST /vouchers/voucher_preactivation request with given body
    And Send with optional X-CorrelationID header
    Then Receive a response from the /vouchers/voucher_preactivation endpoint
    And The /vouchers/voucher_preactivation endpoint response should be returned in a timely manner 15000ms
    And The /vouchers/voucher_preactivation endpoint response should have status 200
    And The /vouchers/voucher_preactivation endpoint response should match json schema

  @negative
  Scenario: The user is not able to receives a pre-activated voucher because of an invalid voucher amount
    Given The user wants to receives a pre-activated voucher
    When Send POST /vouchers/voucher_preactivation request with an invalid voucher amount
    Then Receive a response from the /vouchers/voucher_preactivation endpoint
    And The /vouchers/voucher_preactivation endpoint response should be returned in a timely manner 15000ms
    And The /vouchers/voucher_preactivation endpoint response should have status 452
    And The /vouchers/voucher_preactivation endpoint response should match json error schema

  @negative
  Scenario: The user is not able to receives a pre-activated voucher because of an invalid voucher currency
    Given The user wants to receives a pre-activated voucher
    When Send POST /vouchers/voucher_preactivation request with an invalid voucher currency
    Then Receive a response from the /vouchers/voucher_preactivation endpoint
    And The /vouchers/voucher_preactivation endpoint response should be returned in a timely manner 15000ms
    And The /vouchers/voucher_preactivation endpoint response should have status 453
    And The /vouchers/voucher_preactivation endpoint response should match json error schema

  @negative
  Scenario: The user is not able to receives a pre-activated voucher because of an invalid voucher group
    Given The user wants to receives a pre-activated voucher
    When Send POST /vouchers/voucher_preactivation request with an invalid voucher group
    Then Receive a response from the /vouchers/voucher_preactivation endpoint
    And The /vouchers/voucher_preactivation endpoint response should be returned in a timely manner 15000ms
    And The /vouchers/voucher_preactivation endpoint response should have status 454
    And The /vouchers/voucher_preactivation endpoint response should match json error schema

  @negative
  Scenario: The user is not able to receives a pre-activated voucher because of Gov Stack Building Block does not exist
    Given The user wants to receives a pre-activated voucher
    When Send POST /vouchers/voucher_preactivation request with an invalid Gov_Stack_BB
    Then Receive a response from the /vouchers/voucher_preactivation endpoint
    And The /vouchers/voucher_preactivation endpoint response should be returned in a timely manner 15000ms
    And The /vouchers/voucher_preactivation endpoint response should have status 460
    And The /vouchers/voucher_preactivation endpoint response should match json error schema

  @negative
  Scenario: The user is not able to receives a pre-activated voucher because of an empty payload
    Given The user wants to receives a pre-activated voucher
    When Send POST /vouchers/voucher_preactivation request an empty payload
    Then Receive a response from the /vouchers/voucher_preactivation endpoint
    And The /vouchers/voucher_preactivation endpoint response should be returned in a timely manner 15000ms
    And The /vouchers/voucher_preactivation endpoint response should have status 400
    And The /vouchers/voucher_preactivation endpoint response should match json error schema
