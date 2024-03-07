(module
  (type (;0;) (func (param i32) (result i32)))
  (type (;1;) (func (param i32 i32) (result i64)))
  (type (;2;) (func))
  (func $_initialize (type 2)
    i32.const 2080
    memory.size
    i32.const 16
    i32.shl
    i32.store
    i32.const 2080
    memory.size
    i32.const 16
    i32.shl
    i32.store)
  (func $runtime.alloc (type 0) (param i32) (result i32)
    (local i32 i32 i32)
    i32.const 2096
    i32.const 2096
    i64.load
    i64.const 1
    i64.add
    i64.store
    i32.const 2076
    i32.const 2076
    i32.load
    local.tee 1
    local.get 0
    i32.const 15
    i32.add
    i32.const -16
    i32.and
    local.tee 2
    i32.add
    local.tee 0
    i32.store
    i32.const 2088
    i32.const 2088
    i64.load
    local.get 2
    i64.extend_i32_u
    i64.add
    i64.store
    i32.const 2080
    i32.load
    local.set 3
    block  ;; label = @1
      loop  ;; label = @2
        local.get 0
        local.get 3
        i32.lt_u
        br_if 1 (;@1;)
        memory.size
        memory.grow
        i32.const -1
        i32.ne
        if  ;; label = @3
          i32.const 2080
          memory.size
          i32.const 16
          i32.shl
          local.tee 3
          i32.store
          i32.const 2076
          i32.load
          local.set 0
          br 1 (;@2;)
        end
      end
      unreachable
    end
    local.get 1
    i32.const 0
    local.get 2
    memory.fill
    local.get 1)
  (func $malloc (type 0) (param i32) (result i32)
    (local i32)
    block  ;; label = @1
      local.get 0
      i32.const 0
      i32.lt_s
      br_if 0 (;@1;)
      local.get 0
      call $runtime.alloc
      local.get 0
      i32.eqz
      br_if 0 (;@1;)
      return
    end
    unreachable)
  (func $extend (type 1) (param i32 i32) (result i64)
    local.get 0
    local.get 1
    i32.add
    i64.extend_i32_u
    i64.const 32
    i64.shl
    i64.const 2097152
    i64.or)
  (func $ahoy (type 1) (param i32 i32) (result i64)
    (local i32 i32)
    local.get 0
    i32.eqz
    local.get 1
    i32.const 0
    i32.ne
    i32.and
    local.get 1
    i32.const 0
    i32.lt_s
    i32.or
    i32.eqz
    if  ;; label = @1
      block  ;; label = @2
        local.get 1
        i32.eqz
        if  ;; label = @3
          i32.const 27
          local.set 3
          i32.const 2048
          local.set 2
          br 1 (;@2;)
        end
        local.get 1
        i32.const 27
        i32.add
        local.tee 3
        call $runtime.alloc
        local.tee 2
        i32.const 23
        i32.add
        i32.const 2071
        i32.load align=1
        i32.store align=1
        local.get 2
        i32.const 16
        i32.add
        i32.const 2064
        i64.load align=1
        i64.store align=1
        local.get 2
        i32.const 8
        i32.add
        i32.const 2056
        i64.load align=1
        i64.store align=1
        local.get 2
        i32.const 2048
        i64.load align=1
        i64.store align=1
        local.get 2
        i32.const 27
        i32.add
        local.get 0
        local.get 1
        memory.copy
      end
      local.get 3
      i64.extend_i32_s
      local.get 2
      i64.extend_i32_u
      i64.const 32
      i64.shl
      i64.or
      return
    end
    unreachable)
  (memory (;0;) 1 1)
  (export "memory" (memory 0))
  (export "_initialize" (func $_initialize))
  (export "malloc" (func $malloc))
  (export "extend" (func $extend))
  (export "ahoy" (func $ahoy))
  (data $.rodata (i32.const 2048) "21 days of Festivus before ")
  (data $.data (i32.const 2076) "@\08"))
