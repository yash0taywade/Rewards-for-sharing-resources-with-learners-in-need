// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ResourceSharingRewards {

    address public owner;
    uint256 public rewardAmount;
    uint256 public totalResources;

    struct Resource {
        uint256 id;
        address sharer;
        string resourceName;
        string description;
        bool claimed;
    }

    mapping(uint256 => Resource) public resources;
    mapping(address => uint256) public rewards;

    event ResourceShared(uint256 indexed resourceId, address indexed sharer, string resourceName);
    event ResourceClaimed(uint256 indexed resourceId, address indexed learner);
    event RewardPaid(address indexed sharer, uint256 amount);

    constructor(uint256 _rewardAmount) {
        owner = msg.sender;
        rewardAmount = _rewardAmount;
        totalResources = 0;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the contract owner can perform this action.");
        _;
    }

    modifier resourceExists(uint256 resourceId) {
        require(resources[resourceId].sharer != address(0), "Resource does not exist.");
        _;
    }

    modifier resourceNotClaimed(uint256 resourceId) {
        require(!resources[resourceId].claimed, "Resource has already been claimed.");
        _;
    }

    // Function to share a resource
    function shareResource(string memory resourceName, string memory description) public {
        totalResources++;
        uint256 resourceId = totalResources;

        resources[resourceId] = Resource({
            id: resourceId,
            sharer: msg.sender,
            resourceName: resourceName,
            description: description,
            claimed: false
        });

        emit ResourceShared(resourceId, msg.sender, resourceName);
    }

    // Function for learners to claim a resource
    function claimResource(uint256 resourceId) public resourceExists(resourceId) resourceNotClaimed(resourceId) {
        resources[resourceId].claimed = true;
        rewards[resources[resourceId].sharer] += rewardAmount;

        emit ResourceClaimed(resourceId, msg.sender);
    }

    // Function to withdraw rewards for the sharer
    function withdrawRewards() public {
        uint256 amount = rewards[msg.sender];
        require(amount > 0, "No rewards to withdraw.");

        rewards[msg.sender] = 0;
        payable(msg.sender).transfer(amount);

        emit RewardPaid(msg.sender, amount);
    }

    // Function to set the reward amount (only by the owner)
    function setRewardAmount(uint256 _rewardAmount) public onlyOwner {
        rewardAmount = _rewardAmount;
    }

    // View the details of a resource
    function getResource(uint256 resourceId) public view returns (Resource memory) {
        return resources[resourceId];
    }

    // View current rewards for a sharer
    function viewRewards(address sharer) public view returns (uint256) {
        return rewards[sharer];
    }

    // Deposit funds into the contract for rewarding sharers
    function deposit() public payable onlyOwner {}

}