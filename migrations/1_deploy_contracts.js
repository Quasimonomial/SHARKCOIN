"use strict";

const UserFactory = artifacts.require('./UserFactory.sol');


/**
 * @param deployer object : The thing that can deploy contracts
 * @param network  string : Network name, e.g. "live" or "development"
 * @param accounts  array : Array with accounts addresses
 */
module.exports = async (deployer, network, accounts)=> {
    await deployer.deploy(UserFactory);

    const uf = await UserFactory.deployed();
    console.log(`Example contract address: ${UserFactory.address}`);

    const user = await uf.newUser.call();
    console.log(`Initial Example contract state: ${user.address}`);
};
