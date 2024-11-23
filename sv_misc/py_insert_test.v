module py_insert_test
  (

  );

  /*AUTOINSERTLISP(insert-from-shell "python" "enum_gen.py" "--enum" "my_name_t" "--values" "FOO" "BAR" "BAZ" "QUUX" "Z")*/
  // Beginning of automatic insert lisp
  typedef enum logic [2:0] {
    FOO  = 3'd0,
    BAR  = 3'd1,
    BAZ  = 3'd2,
    QUUX = 3'd3,
    Z    = 3'd4
  } my_name_t;
  // End of automatics

endmodule
