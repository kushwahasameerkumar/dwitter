// var SimpleStorage = artifacts.require("./SimpleStorage.sol");
var Twitter = artifacts.require("./Twitter.sol")

module.exports = function(deployer) {
  deployer.deploy(Twitter);
};
