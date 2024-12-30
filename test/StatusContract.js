const { expect } = require("chai");
const { ethers } = require("hardhat");
const { parseEther } = ethers;

describe("StatusContract", function () {
  let contract;
  let owner;

  beforeEach(async function () {
    [owner] = await ethers.getSigners(); // Get test accounts
    const StatusContract = await ethers.getContractFactory("StatusContract");
    contract = await (await StatusContract.deploy()).waitForDeployment(); // Deploy contract and wait
  });

  it("Should initialize with Pending status", async function () {
    const isComplete = await contract.isComplete();
    expect(isComplete).to.equal(false); // Pending status means not completed
  });

  it("Should activate when called by owner", async function () {
    await contract.activate();
    const status = await contract.isComplete();
    expect(status).to.equal(false); // Active status is not completed
  });
  it("Should allow funding the contract", async function () {
    await contract.fundContract({ value: parseEther("1") });
    const balance = await ethers.provider.getBalance(await contract.getAddress());
    expect(balance).to.equal(parseEther("1"));
  });

  it("Should fail if non-owner tries to activate", async function () {
    const [, addr1] = await ethers.getSigners();
    await expect(contract.connect(addr1).activate()).to.be.revertedWith("not the owner");
  });
});
