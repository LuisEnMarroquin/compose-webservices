const express = require("express");
const router = express.Router();
const MongoClient = require("mongodb").MongoClient;

/* GET home page. */
const mongoUri = "mongodb://root:123456@db:27017";
const dbName = "test";

router.get("/", async function(req, res, next) {
  const client = await MongoClient.connect(mongoUri);
  const db = client.db(dbName);
  const dbInfo = await db.command({ buildInfo: 1 });
  const dbInfoJson = JSON.stringify(dbInfo, null, 4);

  res.render("index", { title: "Express", dbInfo: dbInfoJson });
  client.close();
});

module.exports = router;
