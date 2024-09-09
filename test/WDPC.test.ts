import { loadFixture } from "@nomicfoundation/hardhat-toolbox/network-helpers";
import { expect } from "chai";
import { ethers } from "hardhat";
import { TransactionReceipt } from "ethers";

describe("WDPC", function () {
    
    async function deployFixture() {

        const [owner, addr1, addr2] = await ethers.getSigners();
        const WDPC = await ethers.getContractFactory("WDPC");
        const contract = await WDPC.deploy();

        return { contract, owner, addr1, addr2 };
    }

    describe("deposit-related", function(){
        describe("deposit", async function(){
            it("Should deposit multiple ether transactions and mint correspondly - happy path", async function(){
                const {contract, owner, addr1} = await loadFixture(deployFixture);

                let previousETHBalance = ethers.provider.getBalance(contract);
                let previousCoinSupply = contract.totalSupply();
                //let price = 

                let utils = require("ethers");
                let transaction = await owner.sendTransaction({
                    to: contract,
                    value: utils.parseEther("17.0")
                });

                expect(await ethers.provider.getBalance(contract)).to.equal(previousETHBalance + utils.parseEther("17.0"));
                //expect(await contract.totalSupply()).to.equal(previousCoinSupply + ));
                expect(await transaction).to.emit(contract, "Deposit").withArgs(owner, 17, );
            });

            it("Should revert in case of zero deposit", async function(){
            });

            it("Should revert in case of mint calculation overflow", async function(){
            });
        });
        
        describe("receive", async function(){
            //msg.data empty
            it("Should call deposit() - happy path", async function (){
        
            });
        });
    
        describe("fallback", async function(){
            //regular call() - msg.data not empty
            it("Should call deposit() - happy path", async function (){
        
            });
        });
    });
});