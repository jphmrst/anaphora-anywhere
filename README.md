# anaphora-anywhere --- anaphoric references without macros
The word "anaphoric" refers to the linguistic rule that a pronoun like
"it" refers to the most recent object mentioned in a text.  This
simple library provides anaphoric references for Emacs Lisp in
arbitrary contexts, not just certain macro calls, at the cost of
making the binding reference explicit.

Anaphoric macros are familiar Lisp add-ons, popularized (if not
invented) by Paul Graham in *On Lisp*, which bind a special variable
(usually "it") to the last noted calculation.  One disadvantage of
these macros is that anaphoric reference may be made only to
expressions at very specific points; moreover these points are
introduced by a set of macros parallel to standard Lisp constructs.
For example, in

```lisp
(awhen (function-call arg1 arg2 arg3)
  (pp it))
```

the variable `it` is introduced by the `awhen` macro (that is,
anaphoric `when`), and refers to the condition
`(function-call arg1 arg2 arg3)`.

This package introduces two functions for anaphoric reference.

* The `its` function tags a value to be referenced later, and returns
  its argument.
  
* The `it` function simply returns the last value memorized by `its`.

So under this library's approach, the example with macros above would
be written

```lisp
(when (its (function-call arg1 arg2 arg3))
  (pp (it)))
```

Instead of calling an anaphoric form of the `when` test, we mark the
condition explicitly; instead of using the `it` variable, we make a
call to the `it` function.

## Indexed reference

Both `its` and `it` take an additional parameter which can be used to
maintain differently indexed anaphoric reference.  By default, the
index is `0`.
