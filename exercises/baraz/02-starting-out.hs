{-
 -Once you've installed Haskell from http://www.haskell.org/platform/, load the interpreter with the command ghci.
 -
 -You can load (and reload) this file in the interpreter with the command: ":l 2-starting-out.hs"
 -
 -The first function has been completed as an example. All the other functions are undefined.
 -They can be implemented in one line using the material covered in http://learnyouahaskell.com/starting-out
 -
 -All indices are zero based.
 -}

-- Find the penultimate element in list l
penultimate l = last (init l)

-- Find the element at index k in list l
-- For example: "findK 2 [0,0,1,0,0,0]" returns 1
findK k l = if k == 0 then head l else findK (k-1) (tail l)

-- Determine if list l is a palindrome
isPalindrome l = if length l < 2 
                 then True
                 else if head l == last l
                     then isPalindrome (init (tail l))
                     else False
                     
isPalindrome' l = l == reverse l

{-
 - Duplicate the elements in list xs, for example "duplicate [1,2,3]" would give the list [1,1,2,2,3,3]
 - Hint: The "concat [l]" function flattens a list of lists into a single list. 
 - (You can see the function definition by typing ":t concat" into the interpreter. Perhaps try this with other variables and functions)
 -
 - For example: concat [[1,2,3],[3,4,5]] returns [1,2,3,3,4,5]
 -}
duplicate xs = if length xs == 1 -- sarebbe da gestire il caso []
               then [(head xs), (head xs)]
               else (head xs):(head xs):(duplicate (tail xs))

{-
 - Imitate the functinality of zip
 - The function "min x y" returns the lower of values x and y
 - For example "ziplike [1,2,3] ['a', 'b', 'c', 'd']" returns [(1,'a'), (2, 'b'), (3, 'c')]
 -}
ziplike xs ys = if length xs == 1 || length ys == 1 -- come sopra, sarebbe da gestire il caso []
                then [((head xs), (head ys))]
                else ((head xs), (head ys)):ziplike (tail xs) (tail ys)

-- Split a list l at element k into a tuple: The first part up to and including k, the second part after k
-- For example "splitAtIndex 3 [1,1,1,2,2,2]" returns ([1,1,1],[2,2,2])
splitAtIndex k l = ((take k l), (drop k l))

-- Drop the element at index k in list l
-- For example "dropK 3 [0,0,0,1,0,0,0]" returns [0,0,0,0,0,0]
dropK k l = if k == 0
            then tail l
            else (head l):(dropK (k-1) (tail l))

-- Extract elements between ith and kth element in list l. Including i, but not k
-- For example, "slice 3 6 [0,0,0,1,2,3,0,0,0]" returns [1,2,3]
slice i k l = if l == []
              then []
              else if i <= 0 && k > 0 --if the list is not empty and the slice is real
                   then (head l):(slice (i-1) (k-1) (tail l))
                   else slice(i-1)(k-1)(tail l)

slice' i k l = reverse (take i (reverse (take k l)))

-- Insert element x in list l at index k
-- For example, "insertElem 2 5 [0,0,0,0,0,0]" returns [0,0,0,0,0,2,0]
insertElem x k l = if k == 0
                   then x:l
                   else (head l):(insertElem x (k-1) (tail l))

-- Rotate list l n places left.
-- For example, "rotate 2 [1,2,3,4,5]" gives [3,4,5,1,2]
rotate n l = (drop (mod n (length l)) l)++(take (mod n (length l)) l)