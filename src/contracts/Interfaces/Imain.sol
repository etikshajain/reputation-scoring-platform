// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Imain {
    uint256 private count;
    mapping (uint256 => string) private platformName;
    mapping (uint256 => address) private platformAddress;
    uint256 globalRange = 10;

    constructor() {
        count = 0;
    }

    function fetchPlatformAddress(uint256 id) public view returns(address) {
        return platformAddress[id];
    }

    function fetchPlatformName(uint256 id) public view returns(string memory) {
        return platformName[id];
    }

    function addNewPlatform(string memory name, address contractAddress) public {
        platformName[count] = name;
        platformAddress[count] = contractAddress;
        count++;
    }

    // adding a new user in a platform: 
    //in frontend:
    //fetch all platform addresses:
    //for each platform:
    //check whether that user address exists, if yes, fetch the scaled rating and take average
    //return the expected initial rating (out of globalrange)
}