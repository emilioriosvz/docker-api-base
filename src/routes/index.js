var express = require('express')
var router = express.Router()

router.get('/', (req, res, next) => {
	res.json({ sevilla: 'Tiene un color especial' })
})

module.exports = router
