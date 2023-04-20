const chai = require('chai');
const { spec } = require('pactum');
const { Given, When, Then, Before, After } = require('@cucumber/cucumber');
const {
  localhost,
  defaultResponseTime,
  contentTypeHeader,
  prepaymentValidationEndpoint,
  g2pResponseSchema,
} = require('./helpers/helpers');

chai.use(require('chai-json-schema'));

let specPrePaymentValidation;

const baseUrl = localhost + prepaymentValidationEndpoint;
const endpointTag = { tags: `@endpoint=/${prepaymentValidationEndpoint}` };

Before(endpointTag, () => {
  specPrePaymentValidation = spec();
});

// Scenario: Succesfully retrieves eligible Functional IDs from the account mapper for credit transfers smoke type test
Given(
  'Wants to retrieves eligible Functional IDs from the account mapper for credit transfers',
  () =>
    'Wants to retrieves eligible Functional IDs from the account mapper for credit transfers'
);

When(
  'POST request with required body with given {string} as RequestID, {string} as SourceBBID, {string} as BatchID, {string} as InstructionID, {string} as PayeeFunctionalID, {string} as Amount, {string} as Currency, {string} as Narration is sent',
  (
    RequestID,
    SourceBBID,
    BatchID,
    InstructionID,
    PayeeFunctionalID,
    Amount,
    Currency,
    Narration
  ) =>
    specPrePaymentValidation
      .post(baseUrl)
      .withHeaders('Accept', 'application/json')
      .withJson({
        RequestID: RequestID,
        SourceBBID: SourceBBID,
        BatchID: BatchID,
        CreditInstructions: [
          {
            InstructionID: InstructionID,
            PayeeFunctionalID: PayeeFunctionalID,
            Amount: Number(Amount),
            Currency: Currency,
            Narration: Narration,
          },
        ],
      })
);

Then(
  'The response from the \\/prepayment-validation is received',
  async () => await specPrePaymentValidation.toss()
);

Then(
  'The \\/prepayment-validation response should be returned in a timely manner 15000ms',
  () =>
    specPrePaymentValidation
      .response()
      .to.have.responseTimeLessThan(defaultResponseTime)
);

Then('The \\/prepayment-validation response should have status 200', () =>
  specPrePaymentValidation.response().to.have.status(200)
);

Then(
  'The \\/prepayment-validation response should have content-type: application\\/json header',
  () =>
    specPrePaymentValidation
      .response()
      .to.have.headerContains(contentTypeHeader.key, contentTypeHeader.value)
);

Then('The \\/prepayment-validation response should match json schema', () =>
  chai
    .expect(specPrePaymentValidation._response.json)
    .to.be.jsonSchema(g2pResponseSchema)
);

// Scenario: Succesfully retrieves eligible Functional IDs from the account mapper for credit transfers
// Others Given, When, Then are written in the aforementioned example
Then(
  'The \\/prepayment-validation response ResponseCode field should be {string}',
  responseCode =>
    chai
      .expect(
        specPrePaymentValidation.response().to.have.response.json.ResponseCode
      )
      .to.be.equals(responseCode)
);

Then(
  'The \\/prepayment-validation response RequestID field should be {string}',
  requestID =>
    chai
      .expect(
        specPrePaymentValidation.response().to.have.response.json.RequestID
      )
      .to.be.equals(requestID)
);

// Scenario: Unable to retrieves eligible Functional IDs from the account mapper for credit transfers because of missing required SourceBBID in the payload
// Others Given, Then are written in the aforementioned example
When(
  'POST request with required body with given {string} as RequestID, {string} as BatchID, {string} as InstructionID, {string} as PayeeFunctionalID, {string} as Amount, {string} as Currency, {string} as Narration is sent',
  (
    RequestID,
    BatchID,
    InstructionID,
    PayeeFunctionalID,
    Amount,
    Currency,
    Narration
  ) =>
    specPrePaymentValidation
      .post(baseUrl)
      .withHeaders('Accept', 'application/json')
      .withJson({
        RequestID: RequestID,
        BatchID: BatchID,
        CreditInstructions: [
          {
            InstructionID: InstructionID,
            PayeeFunctionalID: PayeeFunctionalID,
            Amount: Number(Amount),
            Currency: Currency,
            Narration: Narration,
          },
        ],
      })
);

// Scenario: Unable to retrieves eligible Functional IDs from the account mapper for credit transfers because of missing required BatchID in the payload
// Others Given, Then are written in the aforementioned example
When(
  'POST request with required body with given {string} as RequestID, {string} as SourceBBID, {string} as InstructionID, {string} as PayeeFunctionalID, {string} as Amount, {string} as Currency, {string} as Narration is sent',
  (
    RequestID,
    SourceBBID,
    InstructionID,
    PayeeFunctionalID,
    Amount,
    Currency,
    Narration
  ) =>
    specPrePaymentValidation
      .post(baseUrl)
      .withHeaders('Accept', 'application/json')
      .withJson({
        RequestID: RequestID,
        SourceBBID: SourceBBID,
        CreditInstructions: [
          {
            InstructionID: InstructionID,
            PayeeFunctionalID: PayeeFunctionalID,
            Amount: Number(Amount),
            Currency: Currency,
            Narration: Narration,
          },
        ],
      })
);

// Scenario: Unable to retrieves eligible Functional IDs from the account mapper for credit transfers because of missing required InstructionID in the payload
// Others Given, Then are written in the aforementioned example
When(
  'POST request with required body with given {string} as RequestID, {string} as SourceBBID, {string} as BatchID, {string} as PayeeFunctionalID, {string} as Amount, {string} as Currency, {string} as Narration is sent',
  (
    RequestID,
    SourceBBID,
    BatchID,
    PayeeFunctionalID,
    Amount,
    Currency,
    Narration
  ) =>
    specPrePaymentValidation
      .post(baseUrl)
      .withHeaders('Accept', 'application/json')
      .withJson({
        RequestID: RequestID,
        SourceBBID: SourceBBID,
        BatchID: BatchID,
        CreditInstructions: [
          {
            PayeeFunctionalID: PayeeFunctionalID,
            Amount: Number(Amount),
            Currency: Currency,
            Narration: Narration,
          },
        ],
      })
);

// Scenario: Unable to retrieves eligible Functional IDs from the account mapper for credit transfers because of missing required PayeeFunctionalID in the payload
// Others Given, Then are written in the aforementioned example
When(
  'POST request with required body with given {string} as RequestID, {string} as SourceBBID, {string} as BatchID, {string} as InstructionID, {string} as Amount, {string} as Currency, {string} as Narration is sent',
  (
    RequestID,
    SourceBBID,
    BatchID,
    InstructionID,
    Amount,
    Currency,
    Narration
  ) =>
    specPrePaymentValidation
      .post(baseUrl)
      .withHeaders('Accept', 'application/json')
      .withJson({
        RequestID: RequestID,
        SourceBBID: SourceBBID,
        BatchID: BatchID,
        CreditInstructions: [
          {
            InstructionID: InstructionID,
            Amount: Number(Amount),
            Currency: Currency,
            Narration: Narration,
          },
        ],
      })
);

// Scenario: Unable to retrieves eligible Functional IDs from the account mapper for credit transfers because of missing required Amount in the payload
// Others Given, Then are written in the aforementioned example
When(
  'POST request with required body with given {string} as RequestID, {string} as SourceBBID, {string} as BatchID, {string} as InstructionID, {string} as PayeeFunctionalID, {string} as Currency, {string} as Narration is sent',
  (
    RequestID,
    SourceBBID,
    BatchID,
    InstructionID,
    PayeeFunctionalID,
    Currency,
    Narration
  ) =>
    specPrePaymentValidation
      .post(baseUrl)
      .withHeaders('Accept', 'application/json')
      .withJson({
        RequestID: RequestID,
        SourceBBID: SourceBBID,
        BatchID: BatchID,
        CreditInstructions: [
          {
            InstructionID: InstructionID,
            PayeeFunctionalID: PayeeFunctionalID,
            Currency: Currency,
            Narration: Narration,
          },
        ],
      })
);

// Scenario: Unable to retrieves eligible Functional IDs from the account mapper for credit transfers because of missing required Currency in the payload
// Others Given, Then are written in the aforementioned example
When(
  'POST request with required body with given {string} as RequestID, {string} as SourceBBID, {string} as BatchID, {string} as InstructionID, {string} as PayeeFunctionalID, {string} as Amount, {string} as Narration is sent',
  (
    RequestID,
    SourceBBID,
    BatchID,
    InstructionID,
    PayeeFunctionalID,
    Amount,
    Narration
  ) =>
    specPrePaymentValidation
      .post(baseUrl)
      .withHeaders('Accept', 'application/json')
      .withJson({
        RequestID: RequestID,
        SourceBBID: SourceBBID,
        BatchID: BatchID,
        CreditInstructions: [
          {
            InstructionID: InstructionID,
            PayeeFunctionalID: PayeeFunctionalID,
            Amount: Number(Amount),
            Narration: Narration,
          },
        ],
      })
);

// Scenario: Unable to retrieves eligible Functional IDs from the account mapper for credit transfers because of missing required Narration in the payload
// Others Given, Then are written in the aforementioned example
When(
  'POST request with required body with given {string} as RequestID, {string} as SourceBBID, {string} as BatchID, {string} as InstructionID, {string} as PayeeFunctionalID, {string} as Amount, {string} as Currency is sent',
  (
    RequestID,
    SourceBBID,
    BatchID,
    InstructionID,
    PayeeFunctionalID,
    Amount,
    Currency
  ) =>
    specPrePaymentValidation
      .post(baseUrl)
      .withHeaders('Accept', 'application/json')
      .withJson({
        RequestID: RequestID,
        SourceBBID: SourceBBID,
        BatchID: BatchID,
        CreditInstructions: [
          {
            InstructionID: InstructionID,
            PayeeFunctionalID: PayeeFunctionalID,
            Amount: Number(Amount),
            Currency: Currency,
          },
        ],
      })
);

// Scenario: Unable to retrieves eligible Functional IDs from the account mapper for credit transfers because of invalid SourceBBID paramater in payload
// Others Given, Then are written in the aforementioned example
When(
  'POST request with required body with given {string} as invalid SourceBBID parameter is sent',
  sourceBBID =>
    specPrePaymentValidation
      .post(baseUrl)
      .withHeaders('Accept', 'application/json')
      .withJson({
        RequestID: 'abcdef123456',
        SourceBBID: sourceBBID,
        BatchID: 'batchID12345',
        CreditInstructions: [
          {
            InstructionID: 'instructionID123',
            PayeeFunctionalID: 'PayeeFunctionalID123',
            Amount: Number('100'),
            Currency: 'USD',
            Narration: 'Narration',
          },
        ],
      })
);

// Scenario: Unable to retrieves eligible Functional IDs from the account mapper for credit transfers because of invalid BatchID paramater in payload
// Others Given, Then are written in the aforementioned example
When(
  'POST request with required body with given {string} as invalid BatchID parameter is sent',
  batchID =>
    specPrePaymentValidation
      .post(baseUrl)
      .withHeaders('Accept', 'application/json')
      .withJson({
        RequestID: 'abcdef123456',
        SourceBBID: 'sourceBBID12',
        BatchID: batchID,
        CreditInstructions: [
          {
            InstructionID: 'instructionID123',
            PayeeFunctionalID: 'PayeeFunctionalID123',
            Amount: Number('100'),
            Currency: 'USD',
            Narration: 'Narration',
          },
        ],
      })
);

// Scenario: Unable to retrieves eligible Functional IDs from the account mapper for credit transfers because of invalid instructionID paramater in payload
// Others Given, Then are written in the aforementioned example
When(
  'POST request with required body with given {string} as invalid InstructionID parameter is sent',
  instructionID =>
    specPrePaymentValidation
      .post(baseUrl)
      .withHeaders('Accept', 'application/json')
      .withJson({
        RequestID: 'abcdef123456',
        SourceBBID: 'sourceBBID12',
        BatchID: 'batchID12345',
        CreditInstructions: [
          {
            InstructionID: instructionID,
            PayeeFunctionalID: 'PayeeFunctionalID123',
            Amount: Number('100'),
            Currency: 'USD',
            Narration: 'Narration',
          },
        ],
      })
);

// Scenario: Unable to retrieves eligible Functional IDs from the account mapper for credit transfers because of invalid PayeeFunctionalID paramater in payload
// Others Given, Then are written in the aforementioned example
When(
  'POST request with required body with given {string} as invalid PayeeFunctionalID parameter is sent',
  payeeFunctionalID =>
    specPrePaymentValidation
      .post(baseUrl)
      .withHeaders('Accept', 'application/json')
      .withJson({
        RequestID: 'abcdef123456',
        SourceBBID: 'sourceBBID12',
        BatchID: 'batchID12345',
        CreditInstructions: [
          {
            InstructionID: 'instructionID123',
            PayeeFunctionalID: payeeFunctionalID,
            Amount: Number('100'),
            Currency: 'USD',
            Narration: 'Narration',
          },
        ],
      })
);

// Scenario: Unable to retrieves eligible Functional IDs from the account mapper for credit transfers because of invalid Amount paramater in payload
// Others Given, Then are written in the aforementioned example
When(
  'POST request with required body with given {string} as invalid Amount parameter is sent',
  amount =>
    specPrePaymentValidation
      .post(baseUrl)
      .withHeaders('Accept', 'application/json')
      .withJson({
        RequestID: 'abcdef123456',
        SourceBBID: 'sourceBBID12',
        BatchID: 'batchID12345',
        CreditInstructions: [
          {
            InstructionID: 'instructionID123',
            PayeeFunctionalID: 'PayeeFunctionalID123',
            Amount: Number(amount),
            Currency: 'USD',
            Narration: 'Narration',
          },
        ],
      })
);

// Scenario: Unable to retrieves eligible Functional IDs from the account mapper for credit transfers because of invalid Currency paramater in payload
// Others Given, Then are written in the aforementioned example
When(
  'POST request with required body with given {string} as invalid Currency parameter is sent',
  currency =>
    specPrePaymentValidation
      .post(baseUrl)
      .withHeaders('Accept', 'application/json')
      .withJson({
        RequestID: 'abcdef123456',
        SourceBBID: 'sourceBBID12',
        BatchID: 'batchID12345',
        CreditInstructions: [
          {
            InstructionID: 'instructionID123',
            PayeeFunctionalID: 'PayeeFunctionalID123',
            Amount: Number('100'),
            Currency: currency,
            Narration: 'Narration',
          },
        ],
      })
);

After(endpointTag, () => {
  specPrePaymentValidation.end();
});
