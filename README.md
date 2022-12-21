# Reputation-scoring-platform

## Assumptions:

1. There are n platforms.
2. New platforms can be added.
3. A user can register on any number of platforms.
4. each platform has its own rating range.
5. Standard rating range is taken to be 10.

## Approach for on chain data handling:

We have assigned a unique-id(index) to each platform. Each platform has a name and a seperate smart contract that stores all of its users and their corresponding ratings. The following on chain methods have been created:

1. `fetchRatingOfUser` : It is called for a particular platform and returns the rating of the user on that platform.

2. `fetchScaledRatingOfUser` : It is called for a particular platform and returns the rating of the user on that platform scaled up/down to our standard range.

3. `updateRating` : When a user does something on a platform that changes his rating, it is updated on chain in the smart contract of that platform.

4. `addNewuser` : When a user wants to register on a platform for the first time, the following steps are followed:

    i. We fetch the contract addresses of all the existing platforms.
  
    ii. For each platform, we check whether the user exists or not (using user's address), if yes, we fetch the standard rating of user using `fetchScaledRatingOfUser`.
  
    iii. We take average of the standard ratings and scale it up/down to the rating scale of that platform. This is used as the start rating of the user.
  
    iv. We add the user in the corresponding contract of the platform.
