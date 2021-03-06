;;; TOOL: run-interp
(module
  (func (export "call") (result i32)
    i32.const 1
    i64.const 2
    f32.const 3
    f64.const 4
    call $helper)

  (func $helper (param i32 i64 f32 f64) (result i32)
    get_local 1
    i32.wrap/i64
    get_local 0
    i32.add
    get_local 2
    i32.trunc_s/f32
    i32.add
    get_local 3
    i32.trunc_s/f64
    i32.add
    return)

  (func (export "fac10") (result i32)
    i32.const 10
    call $fac)


  (func $fac (param i32) (result i32)
    get_local 0
    i32.const 0
    i32.gt_s 
    if i32
      get_local 0
      get_local 0
      i32.const 1
      i32.sub
      call $fac
      i32.mul
      return
    else
      i32.const 1
      return
    end) 
)
(;; STDOUT ;;;
call() => i32:10
fac10() => i32:3628800
;;; STDOUT ;;)
