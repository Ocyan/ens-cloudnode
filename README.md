# ENS Cloud Node Resolver

A reversed resolver paradigm, to give back control to the user.

**Note: This is a draft abstract proposal, nothing solid has been implemented yet.**

## The Abstract idea

For a fully decentralized environment, we need to provide the network (infrastructure) control to the end users. With the current architectures of most DApps, only the ownership of data has a  distributed incentive of control. Everything else is still architected in a centralized or cluster way. We introduce a protocol, where the end-user can control the backend infrastructure. technologies like ENS make this supper possible to happen.

### The Pitch

Lets introduce a protocol, where the end-user (The operator of the DApp, the human behind the keyboard - sorry robots) can choose their backend infrastructure vendor, by blocking the DApp to interact with server-side nodes, that the user has a negative incentive to use (eg for political, or other misbehaving reasons).

### The Problem

Because of how TCP/IP works, the internet client-server Application model will always be centralized or clustered, in the network level. This actually creates a great flaw in the blockchain ecosystems as the end-users have no voting power on which backend infrastructure should be used, that should relay their ownable data to their Web-based DApp.

In a broader picture, we  already see that  services that provide a full-node in a PaaS model, have an all-growing market percentage. Which contradicts the philosophy which ethereum and other blockchains are based on.

**TODO image to follow**

### The Approach

By using ENS as the main registry between the human-users and infrastructure vendors, users can deploy special resolvers (CloudResolver) under their ens domain name. With CloudResolvers, users can set which cloud vendors should the DApp use.

Accordingly the CloudVendors can set their own resolvers, that set which users they support, for what service.

The match between users and vendors in binded with an AccessToken smart contract, that binds the subscription of a user, to use a cloudProvider for a specific service. In the AccessToken, both parties (User's & Provider's) public keys are being set. So the DApp can make sure that the operator is indeed the subscriber of the targeted cloud Provider

**TODO image to follow**

### Results

**TODO User can track their own usage (metrics)**
**TODO User can see how their DApp is handing their data**
**TODO Users can have different providers for different services, without anyone knowing it**

#### Example

**TODO Need to provide an example use case**

## The Protocol

### The New Rosolvers

### ENS and DApps

### How a DApp can switch between providers

### How a DApp can make sure the user is the rightful subscriber

### How a Provider can make sure the user is the rightful subscriber

### How a DApp can make use of the Providers endpoints

## Challenges

### Web and Networking

### Security concerns

## Future Implementations

### Common protocols for full-node vendors
