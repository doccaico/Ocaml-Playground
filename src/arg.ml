let usage_msg = "append [-verbose] <file1> [<file2>] ... -o <output>"

let verbose = ref false

let input_files = ref []

let output_file = ref ""

let anon_fun filename =
  input_files := !input_files @ [filename]

let speclist =
  [("-verbose", Arg.Set verbose, "Output debug information");
   ("-o", Arg.Set_string output_file, "Set output file name")]

let () =
  Arg.parse speclist anon_fun usage_msg;

  let files_len = List.length !input_files in

  if files_len = 0 then begin
    print_endline "error: too few arguments";
    print_endline usage_msg;
    exit 1;
  end;

  if !verbose then
    print_endline "-verbose: on";

  if !output_file = "" then
    print_endline "default bin's name: a.exe"
  else
    print_endline @@ "your bin's name: " ^ !output_file;

  for i = 0 to files_len - 1 do
    print_endline @@ List.nth !input_files i
  done

(*
$ ocaml main.ml -verbose arg1 arg2 arg3
-verbose: on
default bin's name: a.exe
arg1
arg2
arg3
*)
