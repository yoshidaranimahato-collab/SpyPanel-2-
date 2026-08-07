const express = require("express");
const router = express.Router();

// servers.js routes will be expanded in the next module.
router.get("/", (req,res)=>res.json({ok:true, route:"servers.js"}));

module.exports = router;
