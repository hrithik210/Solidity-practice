const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("StatusContract", function () {
  let contract;
  let owner;
  let addr1;

  beforeEach(async function () {
    [owner, addr1] = await ethers.getSigners(); // Get test accounts
    const StatusContract = await ethers.getContractFactory("StatusContract");
    contract = await StatusContract.deploy();
    await contract.deployed();
  });

  it("Should initialize with Pending status", async function () {
    const status = await contract.isComplete();
    expect(status).to.equal(false); // Pending status means not completed
  });

  it("Should activate when called by owner", async function () {
    await contract.activate();
    const status = await contract.isComplete();
    expect(status).to.equal(false); // Active is not Completed
  });

  it("Should allow funding the contract", async function () {
    await contract.fundContract({ value: ethers.utils.parseEther("1") });
    const balance = await ethers.provider.getBalance(contract.address);
    expect(balance).to.equal(ethers.utils.parseEther("1"));
  });

  it("Should fail if non-owner tries to activate", async function () {
    await expect(contract.connect(addr1).activate()).to.be.revertedWith("not the owner");
  });
});
