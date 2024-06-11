// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MyToken is ERC20, Ownable {
    constructor(string memory name, string memory symbol) ERC20("SIDDHARTH", "SID") Ownable(msg.sender) {}

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function burn(uint256 amount) public {
        _burn(msg.sender, amount);
    }

    
    function transfer(address recipient, uint256 amount) public override returns (bool) {
        address sender = _msgSender();
        require(recipient != address(0), "ERC20: transfer to the zero address");
        require(balanceOf(sender) >= amount, "ERC20: transfer amount exceeds balance");

        
        _transfer(sender, recipient, amount);

        return true;
    }
}
