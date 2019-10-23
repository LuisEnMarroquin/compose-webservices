const compression = require('compression')
const mongoose = require('mongoose')
const { existsSync } = require('fs')
const express = require('express')
const helmet = require('helmet')
const { join } = require('path')
const cors = require('cors')
const app = express()

app.use(helmet()) // Security for browser
app.disable('etag') // Disable 304 not modified http status
app.use(compression()) // Compress responses
app.set('json spaces', 0) // # of spaces to indent json
app.disable('x-powered-by') // Avoid 0-day exploits for express
app.set('trust proxy', true) // sets req.ip
app.use(cors({ origin: '*' })) // CORS everywhere allowed
app.set('strict routing', false) // makes /foo and /foo/ the same
app.set('case sensitive routing', false) // makes /foo and /Foo the same

var PORT = 3000
var DB_NAME = 'nginx'
var DATABASE = `mongodb://localhost:27017/${DB_NAME}`
if (process.env.PRODUCTION) DATABASE = `mongodb://mongo/${DB_NAME}`

try {
  if (existsSync('./build')) { // If build folder exists
    app.use(express.static(join(__dirname, 'build'))) // Serve static files
    app.get('/*', function (req, res) { // Serving app with Client-Side Routing
      res.sendFile(join(__dirname, 'build', 'index.html')) // Serve file index.html
    })
  } else {
    app.get('/*', (req, res) => {
      res.status(404).json({ message: 'The front has not been build' })
    })
  }
} catch (error) {
  console.error(error)
}

// https://mongoosejs.com/docs/deprecations.html
mongoose.set('useUnifiedTopology', true)
mongoose.set('useFindAndModify', false)
mongoose.set('useNewUrlParser', true)
mongoose.set('useCreateIndex', true)

mongoose.connect(DATABASE)
  .then(() => {
    console.log(`Database connected to ${DATABASE}`)
  })
  .then(() => app.listen(PORT, function () {
    console.log(`App connected on port ${PORT}`)
    app.timeout = 1000 * 10 // 10 secs
    app.emit('app.started')
  }))
  .catch(error => {
    console.error('Error at server startup', error)
  })
