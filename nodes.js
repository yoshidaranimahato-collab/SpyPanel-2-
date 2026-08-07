const express = require("express");
const router = express.Router();

// nodes.js routes will be expanded in the next module.
router.get("/", (req,res)=>res.json({ok:true, route:"nodes.js"}));

module.exports = router;
