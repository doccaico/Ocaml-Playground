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
