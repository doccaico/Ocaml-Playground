# Playing with Ocaml

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
