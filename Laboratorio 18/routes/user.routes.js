const express = require('express');
const isAuth = require('../util/is-auth.js');
const router = express.Router();

const userController = require('../controllers/user_controller');

router.get('/login', userController.get_login);
router.post('/login', userController.login);
router.get('/math/', isAuth,userController.math);
router.get('/', isAuth, userController.root);

module.exports = router;