// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/access/Ownable.sol";

/// @notice Interface to interact with the IdentityNFT contract.
interface IIdentityNFT {
    function identityTokenByOwner(address owner) external view returns (uint256);
}

contract AmenityAccess is Ownable {
    IIdentityNFT public identityNFT;

    mapping(uint256 => string) public amenities;
    uint256 public amenityCounter;

    event AmenityAdded(uint256 amenityId, string amenityName);
    event AccessAttempt(address user, uint256 amenityId, bool success);

    constructor(address _identityNFTAddress) Ownable(msg.sender) {
        identityNFT = IIdentityNFT(_identityNFTAddress);
    }

    /// @notice Add an amenity (only owner).
    function addAmenity(string memory amenityName) public onlyOwner {
        amenityCounter++;
        amenities[amenityCounter] = amenityName;
        emit AmenityAdded(amenityCounter, amenityName);
    }

    function hasAccess(uint256 amenityId) public view returns (bool) {
        require(amenityId > 0 && amenityId <= amenityCounter, "Invalid amenity");
        return identityNFT.identityTokenByOwner(msg.sender) != 0; // anyone can access any amenity. Logic can be implemented to restrict access of specific amenities to specific set of people
    }

    /// @notice Attempt to access an amenity.
    function accessAmenity(uint256 amenityId) public {
        emit AccessAttempt(msg.sender, amenityId, hasAccess(amenityId));
    }
}