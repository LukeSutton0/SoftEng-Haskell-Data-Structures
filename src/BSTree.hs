module BSTree (
    createEmptyBSTree,
    insertIntoBSTree,
    BSTree(..)
) where


data BSTree k v = Empty | Node k v (BSTree k v) (BSTree k v) deriving (Eq, Show)

createEmptyBSTree :: Ord k => BSTree k v
createEmptyBSTree = Empty

insertIntoBSTree :: Ord k => k -> v -> BSTree k v -> BSTree k v
insertIntoBSTree key value Empty = Node key value Empty Empty
insertIntoBSTree key value (Node k v left right)
    | key == k = Node key value left right
    | key < k  = Node k v (insertIntoBSTree key value left) right
    | otherwise = Node k v left (insertIntoBSTree key value right)

lookupBSTree :: Ord k => k -> BSTree k v -> Maybe v
lookupBSTree _ Empty = Nothing
lookupBSTree key (Node k v left right)
    | key == k = Just v
    | key < k  = lookupBSTree key left
    | otherwise = lookupBSTree key right