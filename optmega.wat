(module
  (type (;0;) (func (param i32 i32)))
  (type (;1;) (func))
  (type (;2;) (func (param i32) (result i32)))
  (type (;3;) (func (param i32 i32) (result i64)))
  (type (;4;) (func (param i32)))
  (func (;0;) (type 0) (param i32 i32)
    i32.const 65536
    i32.const 22
    call 2
    local.get 0
    local.get 1
    call 2
    i32.const 10
    call 1
    unreachable)
  (func (;1;) (type 4) (param i32)
    (local i32 i32)
    i32.const 65748
    i32.load
    local.tee 1
    i32.const 119
    i32.le_u
    if  ;; label = @1
      i32.const 65748
      local.get 1
      i32.const 1
      i32.add
      local.tee 2
      i32.store
      local.get 1
      i32.const 65752
      i32.add
      local.get 0
      i32.store8
      local.get 0
      i32.const 255
      i32.and
      i32.const 10
      i32.ne
      local.get 1
      i32.const 119
      i32.ne
      i32.and
      i32.eqz
      if  ;; label = @2
        i32.const 65696
        local.get 2
        i32.store
        i32.const 65748
        i32.const 0
        i32.store
      end
      return
    end
    call 3
    unreachable)
  (func (;2;) (type 0) (param i32 i32)
    local.get 1
    i32.const 0
    local.get 1
    i32.const 0
    i32.gt_s
    select
    local.set 1
    loop  ;; label = @1
      local.get 1
      if  ;; label = @2
        local.get 0
        i32.load8_u
        call 1
        local.get 1
        i32.const 1
        i32.sub
        local.set 1
        local.get 0
        i32.const 1
        i32.add
        local.set 0
        br 1 (;@1;)
      end
    end)
  (func (;3;) (type 1)
    i32.const 65581
    i32.const 18
    call 0
    unreachable)
  (func (;4;) (type 2) (param i32) (result i32)
    (local i32 i32 i32)
    i32.const 65880
    i32.const 65880
    i64.load
    i64.const 1
    i64.add
    i64.store
    i32.const 65688
    i32.const 65688
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
    i32.const 65872
    i32.const 65872
    i64.load
    local.get 2
    i64.extend_i32_u
    i64.add
    i64.store
    i32.const 65744
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
          i32.const 65744
          memory.size
          i32.const 16
          i32.shl
          local.tee 3
          i32.store
          i32.const 65688
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
  (func (;5;) (type 3) (param i32 i32) (result i64)
    local.get 0
    local.get 1
    i32.add
    i64.extend_i32_u
    i64.const 32
    i64.shl
    i64.const 2097152
    i64.or)
  (func (;6;) (type 3) (param i32 i32) (result i64)
    (local i32 i32)
    block (result i64)  ;; label = @1
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
      if  ;; label = @2
        block  ;; label = @3
          local.get 1
          i32.eqz
          if  ;; label = @4
            i32.const 27
            local.set 3
            i32.const 65654
            local.set 2
            br 1 (;@3;)
          end
          local.get 1
          i32.const 27
          i32.add
          local.tee 3
          call 4
          local.tee 2
          i32.const 23
          i32.add
          i32.const 65677
          i32.load align=1
          i32.store align=1
          local.get 2
          i32.const 16
          i32.add
          i32.const 65670
          i64.load align=1
          i64.store align=1
          local.get 2
          i32.const 8
          i32.add
          i32.const 65662
          i64.load align=1
          i64.store align=1
          local.get 2
          i32.const 65654
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
        br 1 (;@1;)
      end
      i32.const 65617
      i32.const 37
      call 0
      unreachable
    end)
  (func (;7;) (type 1)
    (local i32)
    memory.size
    local.set 0
    i32.const 65688
    i32.const 66176
    i32.store
    i32.const 65744
    local.get 0
    i32.const 16
    i32.shl
    i32.store
    i32.const 65744
    memory.size
    i32.const 16
    i32.shl
    i32.store)
  (func (;8;) (type 2) (param i32) (result i32)
    (local i32)
    block (result i32)  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.const 0
        i32.ge_s
        if  ;; label = @3
          local.get 0
          call 4
          local.set 1
          local.get 0
          i32.eqz
          br_if 1 (;@2;)
          local.get 1
          br 2 (;@1;)
        end
        i32.const 65599
        i32.const 18
        call 0
        unreachable
      end
      call 3
      unreachable
    end)
  (memory (;0;) 2)
  (export "memory" (memory 0))
  (export "_start" (func 7))
  (export "_malloc" (func 8))
  (export "extend" (func 5))
  (export "ahoy" (func 6))
  (data (;0;) (i32.const 65536) "panic: runtime error: nil pointer dereferenceindex out of rangeslice out of rangeunsafe.Slice/String: len out of range21 days of Festivus before ")
  (data (;1;) (i32.const 65684) "\c1\82\01\00\80\02\01\00\d8\00\01\00\00\00\00\00d\01\01\00\c1\82\01\00\00\00\00\00\04\00\00\00\0c\00\00\00\01\00\00\00\00\00\00\00\01\00\00\00\00\00\00\00\02"))
