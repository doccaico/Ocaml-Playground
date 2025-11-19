(* for_all, for_all2 *)
let () =
  let p i = i = 5 in
  assert (List.for_all p [5; 5; 5] = true);

  let p i = i = 5 in
  let f = List.for_all p in
  assert (f [5; 5; 5] = true);

  assert (List.for_all (fun a -> a = 5) [5; 5; 5] = true);

  let f a b = a > b in
  assert (List.for_all2 f [1; 1; 1] [0; 0; 0] = true)

(* iter, iteri, iter2 *)
let () =
  List.iter (fun e1 -> print_int e1) [1; 2; 3];
  print_newline ();
  (* 123 *)
  List.iteri (fun i e1 -> Printf.printf "%d%d " i e1) [1; 2; 3];
  print_newline ();
  (* 01 12 23 *)
  List.iter2 (fun e1 e2 -> Printf.printf "%d%d " e1 e2) [1; 2; 3] [10; 20; 30];
  print_newline ()
  (* 110 220 330 *)

(* length, compare_lengths, compare_length_with, is_empty, compare *)
let () =
  assert (List.length [0; 1; 2] = 3 && List.length [0] = 1);

  assert (List.compare_lengths [] [] = 0);
  assert (List.compare_lengths [0] [] = 1);
  assert (List.compare_lengths [] [0] = -1);

  assert (List.compare_length_with [0; 1; 2] 3 = 0);
  assert (List.compare_length_with [0; 1; 2] 2 = 1);
  assert (List.compare_length_with [0; 1; 2] 4 = -1);

  assert (List.is_empty [] = true && List.is_empty [0] = false);

  let cmp a b =
    if a = b then
      0
    else if a > b then
      1
    else
      -1
  in
    assert (List.compare cmp [1] [1] = 0);
    assert (List.compare cmp [1] [0] = 1);
    assert (List.compare cmp [0] [1] = -1);

    assert (List.compare cmp [] [] = 0);
    assert (List.compare cmp [0] [] = 1);
    assert (List.compare cmp [] [0] = -1);
