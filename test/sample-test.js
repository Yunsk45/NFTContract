const { expect } = require("chai");
const { ethers } = require("hardhat");
/*
describe("Greeter", function () {
  it("Should return the new greeting once it's changed", async function () {
    const Greeter = await ethers.getContractFactory("Greeter");
    const greeter = await Greeter.deploy("Hello, world!");
    await greeter.deployed();

    expect(await greeter.greet()).to.equal("Hello, world!");

    const setGreetingTx = await greeter.setGreeting("Hola, mundo!");

    // wait until the transaction is mined
    await setGreetingTx.wait();

    expect(await greeter.greet()).to.equal("Hola, mundo!");
  });
});
  */

describe("Artwork Smart Contract tests", function() {

  let artwork;

  this.beforeEach(async function () {
    const Artwork = await ethers.getContractFactory("Artwork");
    artwork = await Artwork.deploy("Artwork Contract", "ART");
  });

  it("minted NFT successfully", async function () {
    [account1] = await ethers.getSigners();

    expect(await artwork.balanceOf(account1.address)).to.equal(0);

    const tokenURI = "https://opensea-creatures-api.herokuapp.com/api/creature/1";
    const tx = await artwork.connect(account1).mint(tokenURI);

    expect(await artwork.balanceOf(account1.address)).to.equal(1);
  });

  it("tokenURI is set successfully", async () => { });


});
