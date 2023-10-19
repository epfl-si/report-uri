const express = require('express');
const app = express();
const port = 5555;

app.get('/', (req, res) => {
  res.send('Welcome on board!');
});

app.listen(port, () => {
  console.log(`Server listening at http://0.0.0.0:${port}/`);
});
