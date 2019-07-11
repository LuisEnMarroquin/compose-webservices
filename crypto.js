const { randomBytes } = require('crypto')
console.log(`user=${randomBytes(4).toString('hex')}`)
console.log(`pass=${randomBytes(4).toString('hex')}`)
console.log(`root=${randomBytes(4).toString('hex')}`)
