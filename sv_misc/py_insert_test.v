module py_insert_test
  (

  );

  /*AUTOINSERTLISP(insert-from-shell "python" "enum_gen.py" "--enum" "encoded_t" "--values" "FOO" "BAR" "BAZ" "QUUX" "Z")*/
  // Beginning of automatic insert lisp
  typedef enum logic [2:0] {
    FOO  = 3'd0,
    BAR  = 3'd1,
    BAZ  = 3'd2,
    QUUX = 3'd3,
    Z    = 3'd4
  } encoded_t;
  // End of automatics

  /*AUTOINSERTLISP(insert-from-shell "python" "enum_gen.py" "--enum" "onehot_t" "--onehot" "--values" "IDLE" "FLUSH" "WRITEBACK" "FINISH")*/
  // Beginning of automatic insert lisp
  typedef enum logic [3:0] {
    IDLE      = 4'd1,
    FLUSH     = 4'd2,
    WRITEBACK = 4'd4,
    FINISH    = 4'd8
  } onehot_t;
  // End of automatics

endmodule
