const chai = require('chai');
const { spec } = require('pactum');
const { Given, When, Then, Before, After } = require('@cucumber/cucumber');
const {
  localhost,
  defaultExpectedResponseTime,
  voucherPreactivationEndpoint,
  voucherPreactivationResponseSchema,
} = require('./helpers/helpers');

chai.use(require('chai-json-schema'));

let voucherVariables;
let specVoucherPreactivation;

const baseUrl = localhost + voucherPreactivationEndpoint;
const endpointTag = { tags: `@endpoint=/${voucherPreactivationEndpoint}` };

Before(endpointTag, () => {
  specVoucherPreactivation = spec();
});

// Scenario: The user successfully receives a pre-activated voucher
Given('The user wants to receives a pre-activated voucher',
  () => 'The user wants to receives a pre-activated voucher'
);

When(/^Send POST \/vouchers\/voucher_preactivation request with given body$/,
  async () => {
    specVoucherPreactivation
      .post(baseUrl)
      .withJson({
        voucher_amount: '15.21',
        voucher_currency: 'AED',
        voucher_group: 'string',
        Gov_Stack_BB: 'Gov_Stack_BB',
        voucher_comment: 'string',
      });
  });

Then(/^Receive a response from the \/vouchers\/voucher_preactivation endpoint$/,
  async () => await specVoucherPreactivation.toss()
);

Then(/^The \/vouchers\/voucher_preactivation endpoint response should be returned in a timely manner 15000ms$/,
  () =>
    specVoucherPreactivation
      .response()
      .to.have.responseTimeLessThan(defaultExpectedResponseTime)
);

Then(/^The \/vouchers\/voucher_preactivation endpoint response should have status (\d+)$/,
  (status) => specVoucherPreactivation.response().to.have.status(status)
);

Then(/^The \/vouchers\/voucher_preactivation endpoint response should match json schema$/,
  () => {
    voucherPreactivationResponseSchema.properties.errors = [];
    chai
      .expect(specVoucherPreactivation._response.json)
      .to.be.jsonSchema(voucherPreactivationResponseSchema);
  }
);

// Scenario: The user is not able to receives a pre-activated voucher because of an invalid voucher amount

When(/^Send POST \/vouchers\/voucher_preactivation request with given body and invalid voucher amount$/,
  async () => {
    specVoucherPreactivation
      .post(baseUrl)
      .withJson({
        voucher_amount: null,
        voucher_currency: 'AED',
        voucher_group: 'string',
        Gov_Stack_BB: 'Gov_Stack_BB',
        voucher_comment: 'string',
      });
  });

Then(/^The \/vouchers\/voucher_preactivation endpoint response should match json error schema$/,
  () => {

    chai
      .expect(specVoucherPreactivation._response.json)
      .to.be.jsonSchema(voucherPreactivationResponseErrorSchema);
  }
);


Then(/^The \/vouchers\/voucher_preactivation response should contain message property$/,
  (errorCode) =>
    chai.expect(specVoucherPreactivation._response.json.message).to.be.equal(errorCode)
);

After(() => {
  specVoucherPreactivation.end();
});
