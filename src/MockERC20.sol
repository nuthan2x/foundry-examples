// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8;

import {ERC20} from "openzeppelin-contracts/token/ERC20/ERC20.sol";
import {Ownable} from "openzeppelin-contracts/access/Ownable.sol";

contract MockERC20 is ERC20, Ownable {
    constructor() ERC20("Mock Token", "MTK") {}

    function mint(address _to, uint256 _amount) external onlyOwner {
        _mint(_to, _amount);
    }
}

// mumbai  0x769823453Fe84eE86e8A78Cd59e071931B62b48C