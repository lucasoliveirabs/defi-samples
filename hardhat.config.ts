import { HardhatUserConfig } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox";
import dotenv from "dotenv";

dotenv.config();

const config: HardhatUserConfig = {
  solidity: "0.8.24",
  networks: {
    sepolia: {
      url: process.env.RPC_NODE,
      chainId: 11155111,
      accounts: {
        mnemonic: process.env.SECRET
      }
    }
  }
};

export default config;
