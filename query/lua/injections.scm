(
  (function_call
    (field_expression
      (property_identifier) @_cdef_identifier)
    (arguments
      (string) @c)
      (#offset! 1 0 0 0))

  (#eq? @_cdef_identifier "cdef")
  (function_call
    (field_expression
      (property_identifier) @cmd_identifier
    )
    (arguments
      (string) @vim
    )
  )
  (#eq? @cmd_identifier "cmd")
  (#offset! 1 0 0 0)
)

(comment) @comment
