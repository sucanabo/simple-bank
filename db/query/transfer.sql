-- name: CreateTransfer :one
INSERT INTO transfers(
    from_account_id,
    to_account_id,
    amount
)
VALUES ($1,$2,$3)
RETURNING *;

-- name: GetTransfer :one
SELECT * FROM transfers
WHERE id = $1
LIMIT 1;


-- name: ListTransfer :many
SELECT * FROM transfers
ORDER BY create_at DESC
LIMIT $1
OFFSET $2;

-- name: DeleteTrasnfer :exec
DELETE FROM entries
WHERE id = $1;