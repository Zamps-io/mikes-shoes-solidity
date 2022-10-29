require("@nomicfoundation/hardhat-toolbox");
require("dotenv").config();

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.17",
  networks: {
    mumbai: {
      url: "https://polygon-mumbai.g.alchemy.com/v2/8LmCvCtvgUS0sHoc6X-nA9A1UpP9LnLf",
      accounts: [process.env.PRIVATE_KEY]
    }
  }
};
