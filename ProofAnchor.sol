// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ProofOfExistence {
    // Event to declare a proof of existence
    event ProofCreated(
        bytes32 indexed documentHash,
        uint256 timestamp
    );

    // Structure of a document
    struct Document {
        uint256 timestamp;
        // additional document metadata if necessary
    }

    // Mapping of document hash to document
    mapping(bytes32 => Document) private documents;

    // Function to add a proof of existence
    function storeProof(bytes32 documentHash) public {
        // Check if the document already exists
        require(
            documents[documentHash].timestamp == 0,
            "This document already exists in the blockchain."
        );

        // Record the timestamp
        documents[documentHash] = Document(block.timestamp);

        // Emit the event that a proof has been stored
        emit ProofCreated(documentHash, block.timestamp);
    }

    // Function to retrieve a proof of existence
    function getProof(bytes32 documentHash) public view returns (uint256) {
        // Check if the document exists
        require(
            documents[documentHash].timestamp != 0,
            "This document does not exist in the blockchain."
        );
        
        // Retrieve the document based on the hash
        return documents[documentHash].timestamp;
    }
}
