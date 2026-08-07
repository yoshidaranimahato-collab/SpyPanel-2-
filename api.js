const express = require("express");
const router = express.Router();

// api.js routes will be expanded in the next module.
router.get("/", (req,res)=>res.json({ok:true, route:"api.js"}));

module.exports = router;
