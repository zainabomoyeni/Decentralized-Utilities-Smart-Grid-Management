;; Grid Operator Verification Contract
;; Manages authorized utility grid operators

;; Constants
(define-constant CONTRACT_OWNER tx-sender)
(define-constant ERR_UNAUTHORIZED (err u100))
(define-constant ERR_ALREADY_REGISTERED (err u101))
(define-constant ERR_NOT_FOUND (err u102))

;; Data Variables
(define-data-var next-operator-id uint u1)

;; Data Maps
(define-map operators
  { operator-id: uint }
  {
    address: principal,
    name: (string-ascii 50),
    license-number: (string-ascii 20),
    is-active: bool,
    registered-at: uint
  }
)

(define-map operator-addresses
  { address: principal }
  { operator-id: uint }
)

;; Public Functions
(define-public (register-operator (address principal) (name (string-ascii 50)) (license-number (string-ascii 20)))
  (let ((operator-id (var-get next-operator-id)))
    (asserts! (is-eq tx-sender CONTRACT_OWNER) ERR_UNAUTHORIZED)
    (asserts! (is-none (map-get? operator-addresses { address: address })) ERR_ALREADY_REGISTERED)

    (map-set operators
      { operator-id: operator-id }
      {
        address: address,
        name: name,
        license-number: license-number,
        is-active: true,
        registered-at: block-height
      }
    )

    (map-set operator-addresses
      { address: address }
      { operator-id: operator-id }
    )

    (var-set next-operator-id (+ operator-id u1))
    (ok operator-id)
  )
)

(define-public (deactivate-operator (operator-id uint))
  (let ((operator (unwrap! (map-get? operators { operator-id: operator-id }) ERR_NOT_FOUND)))
    (asserts! (is-eq tx-sender CONTRACT_OWNER) ERR_UNAUTHORIZED)

    (map-set operators
      { operator-id: operator-id }
      (merge operator { is-active: false })
    )
    (ok true)
  )
)

;; Read-only Functions
(define-read-only (is-authorized-operator (address principal))
  (match (map-get? operator-addresses { address: address })
    operator-data
      (match (map-get? operators { operator-id: (get operator-id operator-data) })
        operator (get is-active operator)
        false
      )
    false
  )
)

(define-read-only (get-operator (operator-id uint))
  (map-get? operators { operator-id: operator-id })
)

(define-read-only (get-operator-by-address (address principal))
  (match (map-get? operator-addresses { address: address })
    operator-data (map-get? operators { operator-id: (get operator-id operator-data) })
    none
  )
)
