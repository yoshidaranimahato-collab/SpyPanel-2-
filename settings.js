const express = require("express");
const router = express.Router();

// settings.js routes will be expanded in the next module.
router.get("/", (req,res)=>res.json({ok:true, route:"settings.js"}));

module.exports = router;
