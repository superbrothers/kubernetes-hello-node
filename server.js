"use strict";

const express = require("express");
const morgan = require("morgan");

const PORT = 8080;
const HOST = "0.0.0.0";

const app = express();
app.use(morgan("combined"));

app.get("/", (req, res) => {
    res.send("Hello world!\n");
});

app.listen(PORT, HOST);
console.log(`Running on http://${HOST}:${PORT}`);
