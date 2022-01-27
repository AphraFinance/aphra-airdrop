// SPDX-License-Identifier: Unlicense
pragma solidity >=0.8.0;

/// ============ Imports ============

import { AphraTokenTest } from "./utils/AphraTokenTest.sol";
import "./console.sol"; // Test scaffolding

interface Vm {
  // Set block.timestamp (newTimestamp)
  function warp(uint256) external;
  // Set block.height (newHeight)
  function roll(uint256) external;
  // Set block.basefee (newBasefee)
  function fee(uint256) external;
  // Loads a storage slot from an address (who, slot)
  function load(address,bytes32) external returns (bytes32);
  // Stores a value to an address' storage slot, (who, slot, value)
  function store(address,bytes32,bytes32) external;
  // Signs data, (privateKey, digest) => (v, r, s)
  function sign(uint256,bytes32) external returns (uint8,bytes32,bytes32);
  // Gets address for a given private key, (privateKey) => (address)
  function addr(uint256) external returns (address);
  // Performs a foreign function call via terminal, (stringInputs) => (result)
  function ffi(string[] calldata) external returns (bytes memory);
  // Sets the *next* call's msg.sender to be the input address
  function prank(address) external;
  // Sets all subsequent calls' msg.sender to be the input address until `stopPrank` is called
  function startPrank(address) external;
  // Sets the *next* call's msg.sender to be the input address, and the tx.origin to be the second input
  function prank(address,address) external;
  // Sets all subsequent calls' msg.sender to be the input address until `stopPrank` is called, and the tx.origin to be the second input
  function startPrank(address,address) external;
  // Resets subsequent calls' msg.sender to be `address(this)`
  function stopPrank() external;
  // Sets an address' balance, (who, newBalance)
  function deal(address, uint256) external;
  // Sets an address' code, (who, newCode)
  function etch(address, bytes calldata) external;
  // Expects an error on next call
  function expectRevert(bytes calldata) external;
  function expectRevert(bytes4) external;
  // Record all storage reads and writes
  function record() external;
  // Gets all accessed reads and write slot from a recording session, for a given address
  function accesses(address) external returns (bytes32[] memory reads, bytes32[] memory writes);
  // Prepare an expected log with (bool checkTopic1, bool checkTopic2, bool checkTopic3, bool checkData).
  // Call this function, then emit an event, then call a function. Internally after the call, we check if
  // logs were emitted in the expected order with the expected topics and data (as specified by the booleans)
  function expectEmit(bool,bool,bool,bool) external;
  // Mocks a call to an address, returning specified data.
  // Calldata can either be strict or a partial match, e.g. if you only
  // pass a Solidity selector to the expected calldata, then the entire Solidity
  // function will be mocked.
  function mockCall(address,bytes calldata,bytes calldata) external;
  // Clears all mocked calls
  function clearMockedCalls() external;
  // Expect a call to an address with the specified calldata.
  // Calldata can either be strict or a partial match
  function expectCall(address,bytes calldata) external;

  function getCode(string calldata) external returns (bytes memory);
}
/// @title Tests
/// @notice MerkleClaimERC20 tests
/// @author Anish Agnihotri <contact@anishagnihotri.com>
contract Tests is AphraTokenTest {

  Vm vm = Vm(0x7109709ECfa91a80626fF3989D68f67F5b1DD12D);
  /// @notice Allow Alice to claim 100e18 tokens
  function testAliceClaim() public {
    // Setup correct proof for Alice
    bytes32[] memory aliceProof = new bytes32[](1);
    aliceProof[0] = 0xceeae64152a2deaf8c661fccd5645458ba20261b16d2f6e090fe908b0ac9ca88;

    // Collect Alice balance of tokens before claim
    uint256 alicePreBalance = ALICE.tokenBalance();

    // Claim tokens
    ALICE.claim(
      // Claiming for Alice
      address(ALICE),
      // 100 tokens
      100e18,
      // With valid proof
      aliceProof
    );

    // Collect Alice balance of tokens after claim
    uint256 alicePostBalance = ALICE.tokenBalance();

    // Assert Alice balance before + 100 tokens = after balance
    assertEq(alicePostBalance, alicePreBalance + 100e18);
  }

  /// @notice Prevent Alice from claiming twice
  function testFailAliceClaimTwice() public {
    // Setup correct proof for Alice
    bytes32[] memory aliceProof = new bytes32[](1);
    aliceProof[0] = 0xceeae64152a2deaf8c661fccd5645458ba20261b16d2f6e090fe908b0ac9ca88;

    // Claim tokens
    ALICE.claim(
      // Claiming for Alice
      address(ALICE),
      // 100 tokens
      100e18,
      // With valid proof
      aliceProof
    );

    // Claim tokens again
    ALICE.claim(
      // Claiming for Alice
      address(ALICE),
      // 100 tokens
      100e18,
      // With valid proof
      aliceProof
    );
  }

  /// @notice Prevent Alice from claiming with invalid proof
  function testFailAliceClaimInvalidProof() public {
    // Setup incorrect proof for Alice
    bytes32[] memory aliceProof = new bytes32[](1);
    aliceProof[0] = 0xc11ae64152a2deaf8c661fccd5645458ba20261b16d2f6e090fe908b0ac9ca88;

    // Claim tokens
    ALICE.claim(
      // Claiming for Alice
      address(ALICE),
      // 100 tokens
      100e18,
      // With valid proof
      aliceProof
    );
  }

  /// @notice Prevent Alice from claiming with invalid amount
  function testFailAliceClaimInvalidAmount() public {
    // Setup correct proof for Alice
    bytes32[] memory aliceProof = new bytes32[](1);
    aliceProof[0] = 0xceeae64152a2deaf8c661fccd5645458ba20261b16d2f6e090fe908b0ac9ca88;

    // Claim tokens
    ALICE.claim(
      // Claiming for Alice
      address(ALICE),
      // Incorrect: 1000 tokens
      1000e18,
      // With valid proof (for 100 tokens)
      aliceProof
    );
  }

  /// @notice Prevent Bob from claiming
  function testFailBobClaim() public {
    // Setup correct proof for Alice
    bytes32[] memory aliceProof = new bytes32[](1);
    aliceProof[0] = 0xceeae64152a2deaf8c661fccd5645458ba20261b16d2f6e090fe908b0ac9ca88;

    // Claim tokens
    BOB.claim(
      // Claiming for Bob
      address(BOB),
      // 100 tokens
      100e18,
      // With valid proof (for Alice)
      aliceProof
    );
  }

  /// @notice Let Bob claim on behalf of Alice
  function testBobClaimForAlice() public {
    // Setup correct proof for Alice
    bytes32[] memory aliceProof = new bytes32[](1);
    aliceProof[0] = 0xceeae64152a2deaf8c661fccd5645458ba20261b16d2f6e090fe908b0ac9ca88;

    // Collect Alice balance of tokens before claim
    uint256 alicePreBalance = ALICE.tokenBalance();

    // Claim tokens
    BOB.claim(
      // Claiming for Alice
      address(ALICE),
      // 100 tokens
      100e18,
      // With valid proof (for Alice)
      aliceProof
    );

    // Collect Alice balance of tokens after claim
    uint256 alicePostBalance = ALICE.tokenBalance();

    // Assert Alice balance before + 100 tokens = after balance
    assertEq(alicePostBalance, alicePreBalance + 100e18);
  }

  /// @notice Let the minter mint
  function testMintBeforeLockoutFail() public {
    // Collect Alice balance of tokens before claim
    testAliceClaim();

    uint256 minterPreBalance = TOKEN.balanceOf(address(this));
    vm.expectRevert(abi.encodeWithSignature("NoMintYet()"));
    TOKEN.mint(uint256(500e18));

    uint256 minterPostBalance = TOKEN.balanceOf(address(this));

    assertEq(minterPostBalance, minterPreBalance);
  }

  /// @notice Mint after Lockout
  function testMintAfterLockout() public {
    testAliceClaim();

    // Collect Alice balance of tokens before claim
    uint256 minterPreBalance = TOKEN.balanceOf(address(this));
    vm.warp(TOKEN.mintingAllowedAfter() + 1);
    TOKEN.mint(uint256(2e18));

    uint256 minterPostBalance = TOKEN.balanceOf(address(this));

    assertEq(minterPostBalance, minterPreBalance + 2e18);
  }
  /// @notice Fail Double Mint after lockout
  function testMintDoubleAfterLockoutFail() public {
    testAliceClaim();

    // Collect Alice balance of tokens before claim
    uint256 minterPreBalance = TOKEN.balanceOf(address(this));
    vm.warp(TOKEN.mintingAllowedAfter() + 1);
    TOKEN.mint(uint256(2e18));
    vm.expectRevert(abi.encodeWithSignature("NoMintYet()"));

    TOKEN.mint(uint256(2e18));
    uint256 minterPostBalance = TOKEN.balanceOf(address(this));

    assertEq(minterPostBalance, minterPreBalance + 2e18);
  }
  /// @notice Fail to mint above cap
  function testMintAboveCapFail() public {
    testAliceClaim();

    // Collect Alice balance of tokens before claim
    uint256 minterPreBalance = TOKEN.balanceOf(address(this));
    uint256 availableToMint = (TOKEN.totalSupply() * TOKEN.mintCap()) / 100;
    uint256 attemptToMint = 5e18;
    vm.warp(TOKEN.mintingAllowedAfter() + 1);
    vm.expectRevert(abi.encodePacked(abi.encodeWithSignature("MintCapExceeded(uint256,uint256)", availableToMint, attemptToMint)));

    TOKEN.mint(attemptToMint);

    uint256 minterPostBalance = TOKEN.balanceOf(address(this));

    assertEq(minterPostBalance, minterPreBalance);
  }

  /// @notice Fail to mint above cap
  function testChangeMinterMintAboveCapFail() public {
    vm.warp(TOKEN.mintingAllowedAfter() + 1);

    testAliceClaim();

    // Collect Alice balance of tokens before claim

    uint256 minterPreBalance = TOKEN.balanceOf(TOKEN.minter());
    TOKEN.setMinter(address(BOB)); //set bob as the minter
    vm.startPrank(address(BOB), address(BOB)); //become bob
    uint256 availableToMint = (TOKEN.totalSupply() * TOKEN.mintCap()) / 100;
    uint256 attemptToMint = 5e18;
    vm.expectRevert(abi.encodeWithSignature("MintCapExceeded(uint256,uint256)", availableToMint, attemptToMint));
    TOKEN.mint(attemptToMint);
    uint256 minterPostBalance = TOKEN.balanceOf(TOKEN.minter());
    vm.stopPrank();
    assertEq(minterPostBalance, minterPreBalance);
  }

}
