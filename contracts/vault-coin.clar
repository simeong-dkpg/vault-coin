;; VaultCoin Protocol - Next-Generation Yield Optimization Platform
;;
;; Summary: Revolutionary DeFi protocol that transforms idle sBTC into productive
;;          assets through intelligent staking mechanisms and automated yield
;;          distribution, maximizing returns while maintaining Bitcoin's security
;;
;; Description: VaultCoin Protocol introduces a sophisticated staking ecosystem
;;              built on Stacks' Bitcoin Layer 2 infrastructure. Users can
;;              deposit their synthetic Bitcoin (sBTC) into optimized yield
;;              vaults that automatically compound returns through strategic
;;              time-locked positions. The protocol features dynamic reward
;;              algorithms, flexible lock periods, and transparent governance
;;              mechanisms that adapt to market conditions for maximum capital
;;              efficiency.

;; ERROR CONSTANTS

(define-constant ERR_NOT_AUTHORIZED (err u100))
(define-constant ERR_ZERO_STAKE (err u101))
(define-constant ERR_NO_STAKE_FOUND (err u102))
(define-constant ERR_TOO_EARLY_TO_UNSTAKE (err u103))
(define-constant ERR_INVALID_REWARD_RATE (err u104))
(define-constant ERR_NOT_ENOUGH_REWARDS (err u105))
(define-constant ERR_INVALID_PERIOD (err u106))
(define-constant ERR_OWNER_UNCHANGED (err u107))

;; DATA STORAGE STRUCTURES

;; User staking positions with timestamp tracking
(define-map stakes
  { staker: principal }
  {
    amount: uint,
    staked-at: uint,
  }
)

;; Historical reward claims for transparency and auditing
(define-map rewards-claimed
  { staker: principal }
  { amount: uint }
)

;; PROTOCOL CONFIGURATION VARIABLES

;; Dynamic reward rate in basis points (5 = 0.5% APY)
(define-data-var reward-rate uint u5)

;; Total reward pool available for distribution to stakers
(define-data-var reward-pool uint u0)

;; Minimum staking period in blocks (~10 days on Stacks mainnet)
(define-data-var min-stake-period uint u1440)