const express = require("express");
const app = express();

app.use(express.json());

let keys = {
  "NYX-123": "",
  "PRO-999": ""
};

app.post("/verify", (req, res) => {
  const { key, hwid } = req.body;

  if (!keys[key]) {
    return res.json({ status: "invalid" });
  }

  if (keys[key] === "") {
    keys[key] = hwid;
    return res.json({ status: "activated" });
  }

  if (keys[key] === hwid) {
    return res.json({ status: "success" });
  }

  return res.json({ status: "used" });
});

app.listen(3000, () => console.log("API ON 🔥"));
