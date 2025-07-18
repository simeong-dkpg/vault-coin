# VaultCoin Protocol

> Next-Generation Yield Optimization Platform on Stacks Bitcoin Layer 2

VaultCoin Protocol is a sophisticated DeFi staking ecosystem that transforms idle synthetic Bitcoin (sBTC) into productive assets through intelligent staking mechanisms and automated yield distribution, maximizing returns while maintaining Bitcoin's security guarantees.

## 🌟 Features

- **Dynamic Yield Optimization**: Intelligent staking mechanisms with time-weighted reward algorithms
- **Flexible Lock Periods**: Configurable minimum staking periods for risk management
- **Auto-Compounding**: Automatic reward claiming and reinvestment capabilities
- **Transparent Governance**: Decentralized governance for protocol parameters
- **Bitcoin Security**: Built on Stacks Layer 2 for Bitcoin-level security
- **Real-time Analytics**: Comprehensive protocol statistics and user dashboards

## 🏗️ System Overview

VaultCoin Protocol operates as a yield-generating vault system where users can:

1. **Stake sBTC**: Deposit synthetic Bitcoin tokens to earn dynamic rewards
2. **Earn Yields**: Receive time-weighted rewards based on staking duration and amount
3. **Compound Returns**: Automatically reinvest rewards for maximum capital efficiency
4. **Flexible Unstaking**: Withdraw stakes after minimum lock periods with accumulated rewards

## 📋 Contract Architecture

### Core Components

#### Data Structures

- **Stakes Map**: Tracks user staking positions with amounts and timestamps
- **Rewards Claimed Map**: Historical record of reward distributions for transparency
- **Protocol Variables**: Dynamic configuration for reward rates, lock periods, and pools

#### Key Functions

##### Staking Operations

- `stake(amount)` - Stake sBTC tokens to earn rewards
- `unstake(amount)` - Withdraw staked tokens with automatic reward claiming
- `claim-rewards()` - Claim accumulated rewards without unstaking

##### Administrative Functions

- `set-reward-rate(new-rate)` - Update dynamic reward rates (governance)
- `set-min-stake-period(new-period)` - Adjust minimum staking periods
- `add-to-reward-pool(amount)` - Fund the reward distribution pool

##### Query Functions

- `get-stake-info(staker)` - Retrieve user staking information
- `calculate-rewards(staker)` - Calculate pending rewards for a user
- `get-protocol-stats()` - Get comprehensive protocol statistics

## 🔄 Data Flow

```text
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   User Wallet   │───▶│  VaultCoin      │───▶│   sBTC Vault    │
│                 │    │  Protocol       │    │                 │
└─────────────────┘    └─────────────────┘    └─────────────────┘
         │                       │                       │
         │                       ▼                       │
         │              ┌─────────────────┐              │
         │              │  Reward Pool    │              │
         │              │                 │              │
         │              └─────────────────┘              │
         │                       │                       │
         ▼                       ▼                       ▼
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   Stake Data    │    │ Reward Tracking │    │  Time-Weighted  │
│   Storage       │    │   & Claims      │    │  Calculations   │
└─────────────────┘    └─────────────────┘    └─────────────────┘
```

### Reward Calculation Algorithm

The protocol uses a time-weighted reward algorithm:

```math
reward = (stake_amount × reward_rate × stake_duration) / (1000 × blocks_per_year)
```

Where:

- `stake_amount`: User's staked sBTC amount
- `reward_rate`: Current reward rate in basis points
- `stake_duration`: Time staked in blocks
- `blocks_per_year`: ~52,560 blocks (365 days on Stacks)

## 🚀 Getting Started

### Prerequisites

- [Clarinet](https://github.com/hirosystems/clarinet) - Stacks smart contract development tool
- [Node.js](https://nodejs.org/) - For running tests and tools
- sBTC tokens for staking

### Installation

1. Clone the repository:

```bash
git clone https://github.com/simeong-dkpg/vault-coin.git
cd vault-coin
```

2. Install dependencies:

```bash
npm install
```

3. Check contract syntax:

```bash
clarinet check
```

4. Run tests:

```bash
npm test
```

### Contract Deployment

The main contract is located at `contracts/vault-coin.clar`. Deploy using Clarinet:

```bash
clarinet deploy --testnet
```

## 🧪 Testing

Run the comprehensive test suite:

```bash
# Check contract syntax
clarinet check

# Run TypeScript tests
npm test

# Run specific test file
npm test -- vault-coin.test.ts
```

## 📊 Protocol Parameters

| Parameter | Default Value | Description |
|-----------|---------------|-------------|
| Reward Rate | 5 basis points | 0.5% APY for stakers |
| Min Stake Period | 1,440 blocks | ~10 days minimum lock |
| Max Reward Rate | 1,000 basis points | 100% maximum APY cap |

## 🔐 Security Features

- **Time-locked Staking**: Minimum staking periods prevent flash loan attacks
- **Overflow Protection**: Safe arithmetic operations throughout
- **Access Control**: Owner-only administrative functions
- **Transparent Auditing**: Complete reward claim history tracking

## 🛠️ API Reference

### Public Functions

#### `stake(amount: uint)`

Stakes sBTC tokens to earn rewards.

- **Parameters**: `amount` - Amount of sBTC to stake
- **Returns**: `(response boolean uint)`

#### `unstake(amount: uint)`

Unstakes tokens and claims accumulated rewards.

- **Parameters**: `amount` - Amount to unstake
- **Returns**: `(response boolean uint)`

#### `claim-rewards()`

Claims accumulated rewards without unstaking.

- **Returns**: `(response boolean uint)`

### Read-Only Functions

#### `get-stake-info(staker: principal)`

Returns staking information for a user.

- **Returns**: `(optional {amount: uint, staked-at: uint})`

#### `calculate-rewards(staker: principal)`

Calculates pending rewards for a staker.

- **Returns**: `uint`

#### `get-protocol-stats()`

Returns comprehensive protocol statistics.

- **Returns**: `{total-staked: uint, reward-pool: uint, reward-rate: uint, min-stake-period: uint, current-apy: uint}`

## 📈 Economics

### Yield Generation

- Time-weighted rewards based on staking duration
- Dynamic APY ranging from 0.5% to 100% (configurable)
- Compound interest through reward reinvestment

### Token Flow

1. Users stake sBTC → Protocol vault
2. Rewards accrue based on time and amount
3. Claims transfer rewards from pool → user
4. Unstaking returns principal + auto-claimed rewards

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit changes (`git commit -m 'Add amazing feature'`)
4. Push to branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🔗 Links

- [Stacks Documentation](https://docs.stacks.co/)
- [Clarinet Documentation](https://github.com/hirosystems/clarinet)
- [sBTC Documentation](https://docs.stacks.co/sbtc)
