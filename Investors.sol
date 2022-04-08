// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

/*
    Write in the functionality so that not only do our investors get added to the wallets with amounts; but those amounts equal real ether
    payouts

    Exercise:
        1. Create a constructor function which can allocate an initial payable value to the contract upon deployment.
        2. Create a function called payout which explicitly prohibits outside visibility in the strict sense.
        3. Write a for loop in the function that iterates over all the wallets of the investors.
        4. While iterating through the wallets the loop should return a transfers of ethers equal to the amounts in each wallet.
        (hint: You need to transfer into the investorWallet by checking each investor address matched up to investorWallets of the index)
        5. Write a function called makePayment which can then execute the payout function once deployed.
        6. Deploy the contract and test for successful transactions. (Hint: watch out for wei conversations!!)
*/
contract AddressWallets {
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
