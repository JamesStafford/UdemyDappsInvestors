// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract AddressWallets {
    address bankAddress;

    constructor() payable {
        bankAddress = msg.sender;
    }

    address payable[] investorWallets;
    mapping(address => uint) investors;

    function payInvestors(address payable investorAddress, uint amount) public {
        investorWallets.push(investorAddress);
        investors[investorAddress] = amount;
    }

    function checkInvestors() public view returns (uint) {
        return investorWallets.length;
    }

    function checkInvestorFundAmount(address investorWallet) public view returns(uint) {
        return investors[investorWallet];
    }
}
