'use strict'

module.exports = async (event, context) => {
  const result = {
     statusCode: 200,
     body: "Hello from OpenFaaS 🚀"
  }

  return context
    .status(200)
    .succeed(result)
}
