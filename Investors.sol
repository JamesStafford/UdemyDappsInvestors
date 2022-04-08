// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract AddressWallets {
    address owner;
    uint bankFundAmount;

    constructor() payable
    {
        owner = msg.sender;
        bankFundAmount = msg.value;
    }

    address payable[] investorWallets;
    mapping(address => uint) investors;

    modifier onlyOwner {
        require(owner == msg.sender);
        _;
    }

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

    function payout() private {
        for(uint investorWalletIndex = 0; investorWalletIndex < investorWallets.length; investorWalletIndex++) {
            address payable investorWalletAddress = investorWallets[investorWalletIndex];
            investorWalletAddress.transfer(investors[investorWalletAddress]);
        }
    }

    function makePayment() public onlyOwner {
        payout();
    }
}
