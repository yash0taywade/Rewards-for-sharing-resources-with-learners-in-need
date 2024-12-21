# ResourceSharingRewards

## Project Description
The **ResourceSharingRewards** smart contract is a decentralized platform that allows users to share valuable resources (e.g., educational content, software tools, data, etc.) with others while earning rewards. Each resource shared by a user is available for other learners or users to claim, and the sharer of the resource receives a reward in the form of Ether when the resource is claimed. This system incentivizes users to contribute their knowledge, content, or resources to the community.

## Contract Address
0xcad42556112e64a9ea8358ee3ad36526db71ffbc
![Uploading Screenshot 2024-12-21 143028.png…]()



## Project Vision
The vision of the **ResourceSharingRewards** project is to foster a decentralized economy of knowledge and resources. By rewarding users who contribute valuable content or resources, the platform aims to create an ecosystem where content sharing is incentivized, and users are encouraged to actively contribute and collaborate. The system can be applied in various fields such as education, open-source development, and knowledge sharing.

### Key objectives:
- Empower users to monetize their contributions in a decentralized manner.
- Encourage the sharing of valuable resources without the need for central intermediaries.
- Promote a collaborative, peer-to-peer learning environment 

## Key Features

1. **Resource Sharing**:  
   Users can share resources by submitting a name, description, and identifier for the resource. Each shared resource is logged in the contract, and the sharer is tracked.

2. **Claim Resources**:  
   Learners or other users can claim shared resources, marking them as claimed. When claimed, the original sharer receives a reward.

3. **Rewards for Sharers**:  
   Sharers are rewarded with Ether every time their resource is claimed. The reward amount is configurable by the contract owner.

4. **Withdraw Rewards**:  
   Sharers can withdraw accumulated rewards at any time by calling the `withdrawRewards` function. The contract ensures that only users who have earned rewards can withdraw them.

5. **Configurable Reward Amount**:  
   The contract owner has the ability to adjust the reward amount for each resource claim. This feature allows for dynamic reward management.

6. **Deposit Functionality**:  
   The contract owner can deposit Ether into the contract to fund the rewards pool. This ensures there is a sufficient balance for rewarding resource sharers.

7. **Resource Management**:  
   The contract allows users to view resource details, such as the resource name, description, and whether it has been claimed or not. This transparency helps users make informed decisions before claiming resources.

8. **Security and Access Control**:  
   - The contract uses access control mechanisms to restrict certain actions to the contract owner (e.g., modifying reward amounts, depositing funds).
   - It ensures that resources can only be claimed once and that sharers can only withdraw rewards they are entitled to.
