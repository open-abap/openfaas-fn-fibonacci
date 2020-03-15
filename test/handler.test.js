require('should')
const abap = require('@abaplint/runtime')
const fs = require('fs')

describe('End-to-End: Handler', () => {

    let handler

    before(async () => {
        /* create a transpile version of the handler */
        const transpiler = require("@abaplint/transpiler");
        const t = new transpiler.Transpiler();
        const transpiled = await t.run([{
            filename: './function/zcl_handler.clas.abap',
            contents: fs.readFileSync('./function/zcl_handler.clas.abap').toString()
        }])
        const zcl_handler = eval('(' + transpiled.js[0].contents + ')')
        handler = new zcl_handler
    })

    it.skip('fib(0) === 0', async () => {
        const response = await handler.run({ body: '0' })
        response.get().body.get().should.equal(0)
    })

    it.skip('fib(-1) should throw an exception', (done) => {
        const message = 'An expected exception was not raised'
        handler.run({ body: '-1' })
            .catch(() => done())
            .then(() => done(new Error(message)))
    })
    it('fib(7) === 21', async () => {
        const response = await handler.run({ body: '7' })
        response.get().body.get().should.equal(21)
    })
})
