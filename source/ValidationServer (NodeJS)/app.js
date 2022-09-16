// Imports
import express from 'express';

// Route Imports
import subsRoute from './routes/subs.js';
import inappsRoute from './routes/inapp.js';

const PORT = 8080;

const app = express();

app.use('/subs', subsRoute);
app.use('/inapp', inappsRoute);

app.listen(PORT, () => {
    console.log(`Server running on port: http://localhost:${PORT}`);
});

// Catch 404
app.use(function(req, res, next) {
    res.status(404).send('Page Not Found');
});