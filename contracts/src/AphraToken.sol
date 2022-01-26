// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity >=0.8.4;

import { MerkleProof } from "@openzeppelin/utils/cryptography/MerkleProof.sol"; // OZ: MerkleProof

import "./DAOToken.sol";

contract AphraToken is DAOToken {

    /// ============ Immutable storage ============

    bytes32 public immutable merkleRoot;

    /// ============ Mutable storage ============

    mapping(address => bool) public hasClaimed;

    address public minter;

    uint256 public mintingAllowedAfter;

    uint32 public constant minimumTimeBetweenMints = 1 days * 365;

    uint8 public constant mintCap = 3;

    /// ============ Errors ============
    error NotMinter();
    error NoMintYet();
    error MintCapExceeded();


    error AlreadyClaimed();
    error NotInMerkle();

    event MinterChanged(address indexed minter, address indexed newMinter);
    event Claim(address indexed to, uint256 amount);

    constructor(bytes32 merkleRoot_,
                address minter_,
                uint256 mintingAllowedAfter_
    ) {
        _init("APHRA DAO", "APHRA");
        merkleRoot = merkleRoot_;
        minter = minter_;
        mintingAllowedAfter = mintingAllowedAfter_;
        emit MinterChanged(address(0), minter);
    }

    function setMinter(address newMinter_) external {
        if (msg.sender != minter) revert NotMinter();
        minter = newMinter_;
        emit MinterChanged(newMinter_, minter);
    }

    function mint(uint256 rawAmount) external {
        if (msg.sender != minter) revert NotMinter();
        if (block.timestamp <= mintingAllowedAfter) revert NoMintYet();
        // record the mint
        mintingAllowedAfter = block.timestamp + minimumTimeBetweenMints;

        // mint the amount
        if (rawAmount > ((totalSupply * mintCap) / 100)) revert MintCapExceeded();
        // mint the amount
        _mint(minter, rawAmount);
    }

    function claim(address to, uint256 amount, bytes32[] calldata proof) external {
        // Throw if address has already claimed tokens
        if (hasClaimed[to]) revert AlreadyClaimed();

        // Verify merkle proof, or revert if not in tree
        bytes32 leaf = keccak256(abi.encodePacked(to, amount));
        bool isValidLeaf = MerkleProof.verify(proof, merkleRoot, leaf);
        if (!isValidLeaf) revert NotInMerkle();

        // Set address to claimed
        hasClaimed[to] = true;

        // Mint tokens to address
        _mint(to, amount);

        // Emit claim event
        emit Claim(to, amount);
    }
}
