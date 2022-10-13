var Companies = artifacts.require("Companies");
var CompaniesCountries = artifacts.require("CompaniesCountries");

module.exports = function (deployer) {
  deployer.deploy(Companies);
  deployer.deploy(CompaniesCountries);
};