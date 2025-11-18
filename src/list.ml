let () =
  (* for_all, for_all2 *)
  let p i = i = 5 in
  assert (List.for_all p [5; 5; 5] = true);

  let p i = i = 5 in
  let f = List.for_all p in
  assert (f [5; 5; 5] = true);

  assert (List.for_all (fun a -> a = 5) [5; 5; 5] = true);

  let f a b = a > b in
  assert (List.for_all2 f [1; 1; 1] [0; 0; 0] = true);
