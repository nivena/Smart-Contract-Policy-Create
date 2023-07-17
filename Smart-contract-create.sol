pragma solidity ^0.8.0;

contract PetInsurance {
    struct Policy {
        address owner;
        string petType;
        string breed;
        uint256 age;
        string location;
        bool isClaimed;
    }

    mapping(uint256 => Policy) policies;
    uint256 public policyCount;

    event PolicyCreated(uint256 policyId, address owner);
    event ClaimProcessed(uint256 policyId);

    // Create a new policy
    function createPolicy(string memory _petType, string memory _breed, uint256 _age, string memory _location) external {
        Policy storage newPolicy = policies[policyCount];
        newPolicy.owner = msg.sender;
        newPolicy.petType = _petType;
        newPolicy.breed = _breed;
        newPolicy.age = _age;
        newPolicy.location = _location;
        newPolicy.isClaimed = false;

        emit PolicyCreated(policyCount, msg.sender);
        policyCount++;
    }

    // Process a claim for a policy
    function processClaim(uint256 _policyId) external {
        require(_policyId < policyCount, "Invalid policy ID");
        Policy storage policy = policies[_policyId];
        require(policy.owner == msg.sender, "You are not the owner of this policy");
        require(!policy.isClaimed, "Claim has already been processed for this policy");

        // Perform the necessary claim processing logic here...

        policy.isClaimed = true;

        emit ClaimProcessed(_policyId);
    }

    // Retrieve policy details
    function getPolicy(uint256 _policyId) external view returns (address, string memory, string memory, uint256, string memory, bool) {
        require(_policyId < policyCount, "Invalid policy ID");
        Policy storage policy = policies[_policyId];

        return (policy.owner, policy.petType, policy.breed, policy.age, policy.location, policy.isClaimed);
    }
}
