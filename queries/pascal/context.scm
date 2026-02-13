; ===== Pascal context (fixed) =====
; Unit name
((unit (moduleName)) @context)

; Class/type name in the interface
((declType
   name: (identifier) @context
   (kEq)
   type: (declClass)))

; Function/procedure **definitions** (implementation).
; Capture the whole defProc so it’s an ancestor of the body.
((defProc) @context)

; Optional: also show plain declarations while you’re *on* them in the interface.
((declProc) @context)

; Uncomment if you want section labels too (can be noisy):
; ((declSection) @context)
