@method=POST @endpoint=/vouchers/voucher_preactivation
Feature: The VoucherPreactivation API is used to request for a pre-activated voucher to be used.

  Scenario: The user successfully receives a pre-activated voucher
    Given The user wants to receives a pre-activated voucher
    When Send POST /vouchers/voucher_preactivation request with given body
    Then Receive a response from the /vouchers/voucher_preactivation endpoint
    And The /vouchers/voucher_preactivation endpoint response should be returned in a timely manner 15000ms
    And The /vouchers/voucher_preactivation endpoint response should have status 200
    And The /vouchers/voucher_preactivation endpoint response should match json schema

  Scenario: The user is not able to receives a pre-activated voucher because of an invalid voucher amount
    Given The user wants to receives a pre-activated voucher
    When Send POST /vouchers/voucher_preactivation request with given body and invalid voucher amount
    Then Receive a response from the /vouchers/voucher_preactivation endpoint
    And The /vouchers/voucher_preactivation endpoint response should be returned in a timely manner 15000ms
    And The /vouchers/voucher_preactivation endpoint response should have status 400
    And The /vouchers/voucher_preactivation endpoint response should match json error schema
    And The /vouchers/voucher_preactivation response should contain message property

  Scenario: The user is not able to receives a pre-activated voucher because of an invalid voucher currency
    Given The user wants to receives a pre-activated voucher
    When The user triggers an action to receive a pre-activated voucher with an invalid voucher currency
    Then The result of an operation returns an error because of an invalid voucher currency

  Scenario: The user is not able to receives a pre-activated voucher because of an invalid voucher group
    Given The user wants to receives a pre-activated voucher
    When The user triggers an action to receive a pre-activated voucher with an invalid voucher group
    Then The result of an operation returns an error because of an invalid voucher group

  Scenario: The user is not able to receives a pre-activated voucher because of Gov Stack Building Block does not exist
    Given The user wants to receives a pre-activated voucher
    When The user triggers an action to receive a pre-activated voucher with an invalid Gov_Stack_BB
    Then The result of an operation returns an error because of Gov Stack Building Block does not exist

  Scenario: The user is not able to receives a pre-activated voucher because of an empty payload
    Given The user wants to receives a pre-activated voucher
    When The user triggers an action to receive a pre-activated voucher with an empty payload
    Then The result of an operation returns an error because of empty payload
