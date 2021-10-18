const express = require('express');
const router = express.Router();

const users = [{name: 'John'}, {name: 'Jane'}];

router.get('/', (req, res) => {
    console.log(req.query.name);
    res.send('Users list');
    users.forEach((user) => {
        console.log(user.name);
    });
});

router.get('/new', (req, res) => {
    res.render('users/new');
});

router.post('/', (req, res) => {
    const isValid = true;
    if (isValid) {
        users.push({ name: req.body.firstName });
        res.redirect(`/users/${users.length - 1}`);
    } else {
        console.log('Error');
        res.render('users/new', { firstName: req.body.firstName });
    }
    console.log(req.body.firstName);

});

router.route('/:id')
    .get((req, res) => {
        console.log(req.user);
        let id = req.params.id;
        res.send(`Get user with id: ${id}`);
    })
    .put((req, res) => {
        let id = req.params.id;
        res.send(`Get user with id: ${id}`);
    })
    .delete((req, res) => {
        let id = req.params.id;
        res.send(`Get user with id: ${id}`);
    });

router.param('id', (req, res, next, id) => {
    console.log(id);
    req.user = users[id];
    next();
});

module.exports = router;