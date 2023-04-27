module.exports = {
  localhost: 'http://localhost:3333/',
  defaultResponseTime: 15000,
  acceptHeader: {
    key: 'Accept',
    value: 'application/json',
  },
  contentTypeHeader: {
    key: 'content-type',
    value: 'application/json; charset=utf-8',
  },
  bulkPaymentEndpoint: 'bulk-payment',
  prepaymentValidationEndpoint: 'prepayment-validation',
  prepaymentValidationResponseEndpoint: 'prepayment-validation-response',
  registerBeneficiaryEndpoint: 'register-beneficiary',
  updateBeneficiaryDetailsEndpoint: 'update-beneficiary-details',
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
  prepaymentValidationResponseSchema: {
    type: 'object',
    properties: {
      RequestID: { type: 'string' },
      Source_BatchID: { type: 'string' },
      NumberFailedCases: { type: 'number' },
      FailedAccounts: {
        type: 'array',
        items: {
          type: 'object',
          properties: {
            InstructionID: { type: 'string' },
            FailureReason: { type: 'string' },
          },
        },
      },
    },
  },
};
