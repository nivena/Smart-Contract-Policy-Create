# Smart-Contract-Policy-Create
Functionality:

1.	The contract allows the creation of pet insurance policies by calling the createPolicy function. It takes the inputs of _petType (string), _breed (string), _age (uint256), and _location (string).
2.	Each policy is assigned a unique policy ID and stored in the policies mapping.
3.	The PolicyCreated event is emitted after a policy is successfully created, providing the policy ID and the owner's address.
4.	The contract includes a processClaim function to handle the claim processing for a given policy. It verifies that the caller is the owner of the policy and that the claim has not been previously processed. You would need to add the necessary claim processing logic within this function.
5.	The ClaimProcessed event is emitted after a claim has been successfully processed, providing the policy ID.
6.	The getPolicy function allows retrieving the details of a specific policy by providing the policy ID. It returns the owner's address, pet type, breed, age, location, and a boolean indicating whether a claim has been processed for that policy.
