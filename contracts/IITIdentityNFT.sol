// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract IITIdentityNFT is ERC721URIStorage, Ownable {
    uint256 public tokenCount;

    constructor() ERC721("IITDharwadIdentity", "IITDID") Ownable(msg.sender) {}

    function mint(address recipient, string memory tokenURI) public onlyOwner returns (uint256) {
        tokenCount += 1;
        _mint(recipient, tokenCount);
        _setTokenURI(tokenCount, tokenURI);
        return tokenCount;
    }
}
