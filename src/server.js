const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');
const app = express();
const port = 5050;

app.use(cors());

app.use(bodyParser.json({ type: 'application/json' }));
app.use(bodyParser.json({ type: 'application/csp-report' }));

// Endpoint to receive CSP violation reports
app.post('/csp-report', (req, res) => {
  const report = req.body['csp-report'];
  console.log('Received CSP violation report:', report);
  res.header('Cross-Origin-Resource-Policy', 'cross-origin');
  res.header('Content-Type', 'text-plain');
  res.status(200).send('Report received successfully');
});

// Return 404 to all other requests
app.use((req, res) => {
  res.status(404).send('Not Found');
});

app.listen(port, () => {
  console.log(`Server listening at http://0.0.0.0:${port}/`);
});
