# Playing with Ocaml

- プリミティブ型と値

```ocaml
let () =
  assert (65 / 60 = 1);
  assert (65 mod 60 = 5);
  assert (3.14 *. 2. = 6.28);
  assert (3.14 *. float_of_int 2 = 6.28);
  assert (true && true = true);
  assert (false || false = false);
  assert (int_of_char 'a' = 97 && int_of_char 'b' = 98);
  assert (int_of_char 'b' - int_of_char 'a' = 1);
  assert (char_of_int 97 = 'a' && char_of_int 98 = 'b');
  assert (string_of_int 42 = "42");
  assert (string_of_float 42. = "42." && string_of_float 42.0 = "42.");
  assert (string_of_bool true = "true" && string_of_bool false = "false");
  assert (int_of_string "42" = 42);
  assert (float_of_string "42." = 42.);
  assert (bool_of_string "true" = true)
```

- 簡単な演算と比較 (`=`, `<>`, int, float)

```ocaml
let () =
  assert (1 + 2 = 3);
  assert (1 + 20 <> 3);
  assert (1. +. 2. = 3.);
  assert (1. +. 20. <> 3.)
```

- List, Tuple, Pair

```ocaml
let list = [0; 1; 2; 3; 4]
let tuple = (0, '0', "zero")
let pair = (0, "zero")

let () =
  assert (List.nth list 4 = 4);
  let (_, second_val, _) = tuple in
    assert (second_val = '0');
  assert (snd pair = "zero")
```

- 文字列連結 (`^`)

```ocaml
let cat a b = a ^ " " ^ b

let () = assert (cat "ha" "ha" = "ha ha")
```

- 部分適用/`Partial application`

```ocaml
let cat a b = a ^ " " ^ b
let cat_hi = cat "hi"
let () = assert (cat_hi "friend" = "hi friend")
```

- 無名関数/`Anonymous function`

```ocaml
let add a b = a + b
let add_anon = fun a b -> a + b

let () =
  assert (add 1 2 = 3);
  assert (add_anon 1 2 = 3);
  assert ((fun a b -> a + b) 1 2 = 3) (* 即座に関数を呼び出せる *)
```

- 局所変数 `let ... in`

```ocaml
let concat3 a b c = a ^ b ^ c

let () =
  let hi = "hi" in
  let space = " " in
  let cat = "cat" in
  assert (concat3 hi space cat = "hi cat")
```

- 条件分岐 (`If ... Else`)

```ocaml
let g x =
  if x = "foo" then 1
  else if x = "bar" then 2
  else if x = "baz" then 3
  else if x = "qux" then 4
  else 0;;

let () =
  assert (g "bar" = 2);
  assert (g "notfound" = 0);
```

- パターンマッチ/Pattern Matching (`match ... with`)

```ocaml
let g x = match x with
    | "foo" -> 1
    | "bar" -> 2
    | "baz" -> 3
    | "qux" -> 4
    | _ -> 0;;

let () =
  assert (g "bar" = 2);
  assert (g "notfound" = 0);

(* ---- *)

let snd p =
  match p with
  | (_, y) -> y

let () =
  assert (snd (10, 20) = 20)
```

- 再帰関数 (`rec`)

```ocaml
let rec sum u =
  match u with
  | [] -> 0
  | x :: v -> x + sum v

let () =
  assert (sum [1; 2; 3] = 6);
```

- 高階関数/Higher-Order Function (e.g. `List.map`)

```ocaml
let square x = x * x

let rec map f u =
  match u with
  | [] -> []
  | x :: u -> f x :: map f u

let () =
  assert (map square [1; 2; 3; 4] = [1; 4; 9; 16]);
  assert (List.map square [1; 2; 3; 4] = [1; 4; 9; 16])
```
