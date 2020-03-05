require('should')
const handler = require('../build/handler')

describe('End-to-End: Handler', ()=>{
    it.skip('fib(0) === 0', async () => {
        const response = await handler(0)
        response.result.should.equal(0)
    })
    it.skip('fib(-1) should throw an exception', (done) => {
        const message = 'An expected exception was not raised'
        handler(-1)
            .catch(() => done())
            .then(() => done( new Error(message) ) )
    })
    it('fib(7) === 21', async () => {
        const response = await handler(7)
        response.result.should.equal(21)
    })
})
