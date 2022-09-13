//SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

error  Advertisement__NotEnoughEthToChange();

contract Advertisement{

    uint256[] public paidAmounts;
    bool canChange = false;

    function payToChange()public payable {
        if(msg.value > paidAmounts[paidAmounts.length-1]){
            paidAmounts.push(msg.value);
            canChange = true;
        }else{
            revert Advertisement__NotEnoughEthToChange();
        }

    }
    
    function getLastPayment()public view returns(uint256){
        return  paidAmounts[paidAmounts.length-1];
    }
}
