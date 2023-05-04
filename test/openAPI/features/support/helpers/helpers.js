module.exports = {
  localhost: 'http://localhost:3333/',
  defaultExpectedResponseTime: 15000,
  contentTypeHeader: {
    key: 'content-type',
    value: 'application/json; charset=utf-8',
  },
  acceptHeader: {
    key: 'Accept',
    value: 'application/json',
  },
  bulkPaymentEndpoint: 'bulk-payment',
  registerBeneficiaryEndpoint: 'register-beneficiary',
  g2pResponseSchema: {
    type: 'object',
    properties: {
      ResponseCode: {
        type: 'string',
        minLength: 2,
        maxLength: 2,
        pattern: '^00$|^01$',
      },
      ResponseDescription: {
        type: 'string',
        minLength: 1,
        maxLength: 200,
      },
      RequestID: {
        type: 'string',
        minLength: 12,
        maxLength: 12,
      },
    },
    required: ['ResponseCode', 'ResponseDescription', 'RequestID'],
  },
};
