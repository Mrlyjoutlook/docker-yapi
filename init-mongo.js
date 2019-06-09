db.createUser({
  user: "test1",
  pwd: "test1",
  roles: [{ role: "readWrite", db: "yapi" }]
});
