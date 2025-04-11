// File: CertificateNFT.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract CertificateNFT is ERC721, Ownable {
    uint256 public currentCertificateId;

    // Certificate structure includes IPFS file ID for the certificate document.
    struct Certificate {
        uint256 courseId;  // Use 0 for final degree certificates.
        string certificateType; // e.g. "Course Completion" or "Degree"
        string ipfsFileId;
    }
    
    mapping(uint256 => Certificate) public certificates;
    event CertificateIssued(uint256 certificateId, address to, uint256 courseId, string certificateType);

    constructor() ERC721("IITDharwadCertificate", "IITD-CERT") Ownable(msg.sender) {}

    /// @notice Mint a new certificate NFT.
    /// @param to Recipient address.
    /// @param courseId Course ID (or 0 for degree).
    /// @param certificateType Type of certificate.
    /// @param ipfsFileId IPFS file ID of the certificate document.
    function mintCertificate(
        address to,
        uint256 courseId,
        string memory certificateType,
        string memory ipfsFileId
    ) public onlyOwner returns (uint256) {
        uint256 newCertificateId = ++currentCertificateId;
        _mint(to, newCertificateId);
        certificates[newCertificateId] = Certificate(courseId, certificateType, ipfsFileId);
        emit CertificateIssued(newCertificateId, to, courseId, certificateType);
        return newCertificateId;
    }
}