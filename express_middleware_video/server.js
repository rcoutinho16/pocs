//https://www.youtube.com/watch?v=lY6icfhap2o

const express = require('express');
const app = express();

app.use(auth);
app.use(logger);

app.get('/', (req, res, next) => {
    res.send('Home Page');
});

app.get('/users', (req, res) => {
    console.log(`User is admin = ${req.admin}`);
    res.send('Users Page');
});

function logger(req, res, next) {
    console.log(`Logging: ${req.originalUrl}`);
    next();
}

function auth(req, res, next) {
    if (req.query.admin === 'true') {
        req.admin = true;
        next();
        return;
    }
    res.send('No auth');
}

app.listen(3000);