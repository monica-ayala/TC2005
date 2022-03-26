const express = require('express');

const router = express.Router();
const controller = require('../controllers/function_controller');



router.get('/', controller.listar);

router.get('/nuevo', controller.get_nuevo);

router.post('/nuevo', controller.post_nuevo);

module.exports = router;