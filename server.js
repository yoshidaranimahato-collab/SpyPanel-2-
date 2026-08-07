require("dotenv").config();
const express = require("express");
const path = require("path");

const app = express();
const PORT = Number(process.env.PORT || 6767);

app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(express.static(path.join(__dirname, "public")));

app.get("/", (req, res) => res.sendFile(path.join(__dirname, "public", "index.html")));
app.get("/login", (req, res) => res.sendFile(path.join(__dirname, "public", "login.html")));
app.get("/register", (req, res) => res.sendFile(path.join(__dirname, "public", "register.html")));
app.get("/dashboard", (req, res) => res.sendFile(path.join(__dirname, "public", "dashboard.html")));
app.get("/account", (req, res) => res.sendFile(path.join(__dirname, "public", "account.html")));
app.get("/admin", (req, res) => res.sendFile(path.join(__dirname, "views", "admin.html")));

app.get("/api/health", (req, res) => res.json({ ok: true, name: "SpyPanel", port: PORT }));

app.listen(PORT, "0.0.0.0", () => {
  console.log(`\nSpyPanel running on port ${PORT}`);
});
