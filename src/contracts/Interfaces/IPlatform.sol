// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Iplatform {
    address[] private users;
    mapping (address => string) private username;
    mapping (address => uint256) private rating;
    uint256 ratingRange;
    uint256 globalRange = 10;

    constructor(uint256 range) {
        ratingRange = range;
    }

    function fetchRatingOfUser(address user_address) public view returns(uint256) {
        return rating[user_address];
    }

    function fetchScaledRatingOfUser(address user_address) public view returns(uint256) {
        return (rating[user_address]/ratingRange)*globalRange;
    }

    function addNewUser(string memory name, address user_address, uint256 initial_rating) public {
        users.push(user_address);
        username[user_address] = name;
        rating[user_address] = (initial_rating/globalRange)*ratingRange;
    }

    function updateRating(address user_address, uint256 new_rating) public {
        rating[user_address] = new_rating;
    }
}