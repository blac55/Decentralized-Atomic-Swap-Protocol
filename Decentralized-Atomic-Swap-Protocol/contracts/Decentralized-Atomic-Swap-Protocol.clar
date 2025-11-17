
;; title: Decentralized-Atomic-Swap-Protocol
(define-constant ERR-NOT-AUTHORIZED (err u401))
(define-constant ERR-SWAP-EXPIRED (err u402))
(define-constant ERR-SWAP-ALREADY-EXISTS (err u403))
(define-constant ERR-SWAP-NOT-FOUND (err u404))
(define-constant ERR-INVALID-AMOUNT (err u405))
(define-constant ERR-SWAP-ALREADY-CLAIMED (err u406))
(define-constant ERR-INVALID-PROOF (err u407))
(define-constant ERR-SLIPPAGE-TOO-HIGH (err u408))
(define-constant ERR-EXCEEDS-VOLUME-CAP (err u409))
(define-constant ERR-CIRCUIT-BREAKER-ACTIVE (err u410))
(define-constant ERR-BLACKLISTED (err u411))

;; ----- Data Maps -----

;; Data structure for swap details
(define-map swaps
  { swap-id: (buff 32) }
  {
    initiator: principal,
    counterparty: (optional principal),
    btc-address: (buff 34),
    stx-amount: uint,
    btc-amount: uint,
    token-contract: (optional principal),
    token-id: (optional uint),
    token-amount: (optional uint),
    timeout: uint,
    status: (string-ascii 20),
    proof-submitted: bool,
    creation-height: uint,
    slippage-tolerance: uint,
    conditions: (list 10 (string-ascii 64))
  }
)

;; Liquidity provider registry
(define-map liquidity-providers
  { provider: principal }
  {
    total-liquidity: uint,
    rewards-earned: uint,
    fee-discount: uint,
    last-deposit-height: uint,
    reputation-score: uint
  }
)

;; Statistics tracking
(define-map protocol-stats
  { stat-type: (string-ascii 20) }
  { value: uint }
)

