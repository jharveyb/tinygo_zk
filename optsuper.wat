(module
  (type (;0;) (func (param i32 i32 i32 i32) (result i32)))
  (type (;1;) (func))
  (type (;2;) (func (param i32) (result i32)))
  (type (;3;) (func (param i32 i32)))
  (type (;4;) (func (param i32 i32) (result i64)))
  (type (;5;) (func (param i32)))
  (type (;6;) (func (param i32 i32 i32 i32)))
  (type (;7;) (func (param i32 i32) (result i32)))
  (type (;8;) (func (param i32 i32 i32)))
  (import "wasi_snapshot_preview1" "fd_write" (func (;0;) (type 0)))
  (func (;1;) (type 2) (param i32) (result i32)
    (local i32 i32 i32)
    i32.const 65944
    i32.const 65944
    i64.load
    i64.const 1
    i64.add
    i64.store
    i32.const 65716
    i32.const 65716
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
    i32.const 65936
    i32.const 65936
    i64.load
    local.get 2
    i64.extend_i32_u
    i64.add
    i64.store
    i32.const 65808
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
          i32.const 65808
          memory.size
          i32.const 16
          i32.shl
          local.tee 3
          i32.store
          i32.const 65716
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
  (func (;2;) (type 3) (param i32 i32)
    i32.const 65536
    i32.const 22
    call 4
    local.get 0
    local.get 1
    call 4
    i32.const 10
    call 3
    unreachable)
  (func (;3;) (type 5) (param i32)
    (local i32 i32)
    i32.const 65812
    i32.load
    local.tee 1
    i32.const 119
    i32.le_u
    if  ;; label = @1
      i32.const 65812
      local.get 1
      i32.const 1
      i32.add
      local.tee 2
      i32.store
      local.get 1
      i32.const 65816
      i32.add
      local.get 0
      i32.store8
      local.get 0
      i32.const 255
      i32.and
      i32.const 10
      i32.ne
      i32.const 0
      local.get 1
      i32.const 119
      i32.ne
      select
      i32.eqz
      if  ;; label = @2
        i32.const 65724
        local.get 2
        i32.store
        i32.const 1
        i32.const 65720
        i32.const 1
        i32.const 65952
        call 0
        drop
        i32.const 65812
        i32.const 0
        i32.store
      end
      return
    end
    call 6
    unreachable)
  (func (;4;) (type 3) (param i32 i32)
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
        call 3
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
  (func (;5;) (type 1)
    i32.const 65558
    i32.const 23
    call 2
    unreachable)
  (func (;6;) (type 1)
    i32.const 65611
    i32.const 18
    call 2
    unreachable)
  (func (;7;) (type 6) (param i32 i32 i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get 0
    i32.const 48
    i32.sub
    local.tee 5
    global.set 0
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.eqz
        br_if 0 (;@2;)
        block  ;; label = @3
          local.get 0
          i32.load8_u offset=20
          local.tee 4
          i32.const 29
          i32.gt_u
          br_if 0 (;@3;)
          local.get 0
          i32.load offset=8
          i32.const 6
          local.get 4
          i32.shl
          i32.le_u
          br_if 0 (;@3;)
          i32.const 65712
          i32.const 65712
          i32.load
          local.tee 3
          i32.const 7
          i32.shl
          local.get 3
          i32.xor
          local.tee 3
          i32.const 1
          i32.shr_u
          local.get 3
          i32.xor
          local.tee 3
          i32.const 9
          i32.shl
          local.get 3
          i32.xor
          local.tee 3
          i32.store
          local.get 5
          i64.const 0
          i64.store offset=24
          local.get 5
          i32.const 0
          i32.store offset=16
          local.get 5
          local.get 0
          i64.load offset=32 align=4
          i64.store offset=40
          local.get 5
          local.get 0
          i64.load offset=24 align=4
          i64.store offset=32
          local.get 5
          local.get 0
          i32.load offset=16
          local.tee 6
          i32.store offset=24
          local.get 5
          local.get 0
          i32.load offset=12
          local.tee 7
          i32.store offset=20
          local.get 5
          local.get 3
          i32.store offset=12
          local.get 5
          local.get 4
          i32.const 1
          i32.add
          local.tee 3
          i32.store8 offset=28
          local.get 5
          local.get 6
          local.get 7
          i32.add
          i32.const 3
          i32.shl
          i32.const 12
          i32.add
          local.get 3
          i32.shl
          call 1
          i32.store offset=8
          local.get 0
          i32.load offset=12
          call 1
          local.set 6
          local.get 0
          i32.load offset=16
          call 1
          local.set 11
          i32.const 0
          local.set 4
          i32.const 0
          local.set 3
          i32.const 0
          local.set 7
          loop  ;; label = @4
            local.get 7
            i32.eqz
            if  ;; label = @5
              i32.const 0
              i32.const 1
              local.get 0
              i32.load8_u offset=20
              local.tee 7
              i32.shl
              local.get 7
              i32.const 31
              i32.gt_u
              select
              local.set 12
              local.get 0
              i32.load
              local.set 7
            end
            block  ;; label = @5
              loop  ;; label = @6
                local.get 4
                i32.const 255
                i32.and
                i32.const 8
                i32.ge_u
                if  ;; label = @7
                  local.get 3
                  i32.eqz
                  br_if 5 (;@2;)
                  i32.const 0
                  local.set 4
                  local.get 3
                  i32.load offset=8
                  local.set 3
                end
                local.get 3
                i32.eqz
                if  ;; label = @7
                  local.get 8
                  local.get 12
                  i32.ge_u
                  br_if 2 (;@5;)
                  local.get 7
                  local.get 0
                  i32.load offset=16
                  local.get 0
                  i32.load offset=12
                  i32.add
                  i32.const 3
                  i32.shl
                  i32.const 12
                  i32.add
                  local.get 8
                  i32.mul
                  i32.add
                  local.tee 3
                  i32.eqz
                  br_if 5 (;@2;)
                  local.get 8
                  i32.const 1
                  i32.add
                  local.set 8
                end
                local.get 3
                local.get 4
                i32.const 255
                i32.and
                local.tee 9
                i32.add
                i32.load8_u
                i32.eqz
                if  ;; label = @7
                  local.get 4
                  i32.const 1
                  i32.add
                  local.set 4
                  br 1 (;@6;)
                end
                local.get 6
                local.get 0
                i32.load offset=12
                local.tee 10
                local.get 9
                i32.mul
                local.get 3
                i32.add
                i32.const 12
                i32.add
                local.get 10
                memory.copy
                block  ;; label = @7
                  local.get 0
                  i32.load
                  local.get 7
                  i32.eq
                  if  ;; label = @8
                    local.get 11
                    local.get 9
                    local.get 0
                    i32.load offset=16
                    local.tee 9
                    i32.mul
                    local.get 10
                    i32.const 3
                    i32.shl
                    i32.add
                    local.get 3
                    i32.add
                    i32.const 12
                    i32.add
                    local.get 9
                    memory.copy
                    local.get 4
                    i32.const 1
                    i32.add
                    local.set 4
                    br 1 (;@7;)
                  end
                  local.get 0
                  i32.load offset=36
                  local.tee 9
                  i32.eqz
                  br_if 5 (;@2;)
                  local.get 4
                  i32.const 1
                  i32.add
                  local.set 4
                  local.get 0
                  local.get 6
                  local.get 11
                  local.get 6
                  local.get 10
                  local.get 0
                  i32.load offset=4
                  local.get 0
                  i32.load offset=32
                  local.get 9
                  call_indirect (type 0)
                  call 12
                  i32.const 1
                  i32.and
                  i32.eqz
                  br_if 1 (;@6;)
                end
              end
              local.get 5
              i32.load offset=44
              local.tee 10
              i32.eqz
              br_if 3 (;@2;)
              local.get 5
              i32.const 8
              i32.add
              local.get 6
              local.get 11
              local.get 6
              local.get 5
              i32.load offset=20
              local.get 5
              i32.load offset=12
              local.get 5
              i32.load offset=40
              local.get 10
              call_indirect (type 0)
              call 7
              br 1 (;@4;)
            end
          end
          local.get 0
          local.get 5
          i32.load offset=8
          i32.store
          local.get 0
          local.get 5
          i64.load offset=12 align=4
          i64.store offset=4 align=4
          local.get 0
          local.get 5
          i64.load offset=20 align=4
          i64.store offset=12 align=4
          local.get 0
          local.get 5
          i32.load8_u offset=28
          i32.store8 offset=20
          local.get 0
          local.get 5
          i64.load offset=32
          i64.store offset=24 align=4
          local.get 0
          local.get 5
          i64.load offset=40
          i64.store offset=32 align=4
          local.get 0
          i32.load offset=36
          local.tee 3
          i32.eqz
          br_if 1 (;@2;)
          local.get 1
          local.get 0
          i32.load offset=12
          local.get 0
          i32.load offset=4
          local.get 0
          i32.load offset=32
          local.get 3
          call_indirect (type 0)
          local.set 3
        end
        local.get 3
        i32.const 24
        i32.shr_u
        local.tee 4
        i32.const 1
        local.get 4
        select
        local.set 11
        i32.const 0
        local.set 6
        local.get 0
        local.get 3
        call 8
        local.set 3
        i32.const 0
        local.set 8
        i32.const 0
        local.set 10
        i32.const 0
        local.set 7
        loop  ;; label = @3
          local.get 3
          local.tee 4
          if  ;; label = @4
            i32.const 0
            local.set 3
            loop  ;; label = @5
              local.get 3
              i32.const 8
              i32.ne
              if  ;; label = @6
                local.get 0
                i32.load offset=12
                local.tee 6
                local.get 3
                i32.mul
                local.get 4
                i32.add
                i32.const 12
                i32.add
                local.set 12
                local.get 0
                i32.load offset=16
                local.get 3
                i32.mul
                local.get 6
                i32.const 3
                i32.shl
                i32.add
                local.get 4
                i32.add
                i32.const 12
                i32.add
                local.set 9
                block  ;; label = @7
                  local.get 3
                  local.get 4
                  i32.add
                  local.tee 13
                  i32.load8_u
                  local.tee 14
                  local.get 11
                  i32.ne
                  br_if 0 (;@7;)
                  local.get 0
                  i32.load offset=28
                  local.tee 15
                  i32.eqz
                  br_if 5 (;@2;)
                  local.get 1
                  local.get 12
                  local.get 6
                  local.get 0
                  i32.load offset=24
                  local.get 15
                  call_indirect (type 0)
                  i32.const 1
                  i32.and
                  i32.eqz
                  br_if 0 (;@7;)
                  local.get 9
                  local.get 2
                  local.get 0
                  i32.load offset=16
                  memory.copy
                  br 6 (;@1;)
                end
                local.get 7
                local.get 13
                local.get 8
                local.get 14
                i32.or
                local.tee 6
                select
                local.set 7
                local.get 8
                local.get 12
                local.get 6
                select
                local.set 8
                local.get 10
                local.get 9
                local.get 6
                select
                local.set 10
                local.get 3
                i32.const 1
                i32.add
                local.set 3
                br 1 (;@5;)
              end
            end
            local.get 4
            i32.load offset=8
            local.set 3
            local.get 4
            local.set 6
            br 1 (;@3;)
          end
        end
        local.get 8
        i32.eqz
        if  ;; label = @3
          local.get 0
          i32.load offset=16
          local.get 0
          i32.load offset=12
          i32.add
          i32.const 3
          i32.shl
          i32.const 12
          i32.add
          call 1
          local.set 3
          local.get 0
          local.get 0
          i32.load offset=8
          i32.const 1
          i32.add
          i32.store offset=8
          local.get 3
          i32.const 12
          i32.add
          local.tee 4
          local.get 1
          local.get 0
          i32.load offset=12
          local.tee 1
          memory.copy
          local.get 4
          local.get 1
          i32.const 3
          i32.shl
          i32.add
          local.get 2
          local.get 0
          i32.load offset=16
          memory.copy
          local.get 3
          local.get 11
          i32.store8
          local.get 6
          i32.eqz
          br_if 1 (;@2;)
          local.get 6
          local.get 3
          i32.store offset=8
          br 2 (;@1;)
        end
        local.get 0
        local.get 0
        i32.load offset=8
        i32.const 1
        i32.add
        i32.store offset=8
        local.get 8
        local.get 1
        local.get 0
        i32.load offset=12
        memory.copy
        local.get 10
        local.get 2
        local.get 0
        i32.load offset=16
        memory.copy
        local.get 7
        i32.eqz
        br_if 0 (;@2;)
        local.get 7
        local.get 11
        i32.store8
        br 1 (;@1;)
      end
      call 5
      unreachable
    end
    local.get 5
    i32.const 48
    i32.add
    global.set 0)
  (func (;8;) (type 7) (param i32 i32) (result i32)
    local.get 0
    i32.load
    local.get 0
    i32.load offset=16
    local.get 0
    i32.load offset=12
    i32.add
    i32.const 3
    i32.shl
    i32.const 12
    i32.add
    i32.const -1
    i32.const -1
    local.get 0
    i32.load8_u offset=20
    local.tee 0
    i32.shl
    i32.const -1
    i32.xor
    local.get 0
    i32.const 31
    i32.gt_u
    select
    local.get 1
    i32.and
    i32.mul
    i32.add)
  (func (;9;) (type 0) (param i32 i32 i32 i32) (result i32)
    local.get 2
    i32.const -2128831035
    i32.mul
    local.set 2
    loop  ;; label = @1
      local.get 1
      if  ;; label = @2
        local.get 1
        i32.const 1
        i32.sub
        local.set 1
        local.get 2
        local.get 0
        i32.load8_u
        i32.xor
        i32.const 16777619
        i32.mul
        local.set 2
        local.get 0
        i32.const 1
        i32.add
        local.set 0
        br 1 (;@1;)
      end
    end
    local.get 2)
  (func (;10;) (type 1)
    i32.const 65629
    i32.const 18
    call 2
    unreachable)
  (func (;11;) (type 0) (param i32 i32 i32 i32) (result i32)
    (local i32 i32 i32)
    i32.const 0
    local.set 3
    block (result i32)  ;; label = @1
      loop  ;; label = @2
        local.get 2
        local.get 2
        local.get 3
        i32.eq
        br_if 1 (;@1;)
        drop
        local.get 1
        local.get 3
        i32.add
        local.set 4
        block (result i32)  ;; label = @3
          local.get 0
          local.get 3
          i32.add
          local.set 6
          local.get 3
          i32.const 1
          i32.add
          local.set 3
          local.get 6
        end
        i32.load8_u
        local.get 4
        i32.load8_u
        i32.eq
        br_if 0 (;@2;)
      end
      local.get 3
      i32.const 1
      i32.sub
    end
    local.get 2
    i32.ge_u)
  (func (;12;) (type 0) (param i32 i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32)
    local.get 3
    i32.const 24
    i32.shr_u
    local.tee 4
    i32.const 1
    local.get 4
    select
    local.set 6
    local.get 0
    local.get 3
    call 8
    local.set 4
    block  ;; label = @1
      block  ;; label = @2
        loop  ;; label = @3
          local.get 4
          if  ;; label = @4
            i32.const 0
            local.set 3
            loop  ;; label = @5
              local.get 3
              i32.const 8
              i32.ne
              if  ;; label = @6
                block  ;; label = @7
                  local.get 3
                  local.get 4
                  i32.add
                  i32.load8_u
                  local.get 6
                  i32.ne
                  br_if 0 (;@7;)
                  local.get 0
                  i32.load offset=28
                  local.tee 7
                  i32.eqz
                  br_if 6 (;@1;)
                  local.get 0
                  i32.load offset=16
                  local.set 8
                  local.get 1
                  local.get 0
                  i32.load offset=12
                  local.tee 5
                  local.get 3
                  i32.mul
                  local.get 4
                  i32.add
                  i32.const 12
                  i32.add
                  local.get 5
                  local.get 0
                  i32.load offset=24
                  local.get 7
                  call_indirect (type 0)
                  i32.const 1
                  i32.and
                  i32.eqz
                  br_if 0 (;@7;)
                  local.get 2
                  local.get 3
                  local.get 8
                  i32.mul
                  local.get 5
                  i32.const 3
                  i32.shl
                  i32.add
                  local.get 4
                  i32.add
                  i32.const 12
                  i32.add
                  local.get 0
                  i32.load offset=16
                  memory.copy
                  br 5 (;@2;)
                end
                local.get 3
                i32.const 1
                i32.add
                local.set 3
                br 1 (;@5;)
              end
            end
            local.get 4
            i32.load offset=8
            local.set 4
            br 1 (;@3;)
          end
        end
        local.get 2
        i32.const 0
        local.get 0
        i32.load offset=16
        memory.fill
      end
      local.get 4
      i32.const 0
      i32.ne
      return
    end
    call 5
    unreachable)
  (func (;13;) (type 8) (param i32 i32 i32)
    local.get 0
    i32.eqz
    if  ;; label = @1
      i32.const 65581
      i32.const 30
      call 2
      unreachable
    end
    local.get 0
    local.get 1
    local.get 2
    local.get 1
    local.get 0
    i32.load offset=12
    local.get 0
    i32.load offset=4
    local.get 0
    call 9
    call 7)
  (func (;14;) (type 4) (param i32 i32) (result i64)
    local.get 0
    local.get 1
    i32.add
    i64.extend_i32_u
    i64.const 32
    i64.shl
    i64.const 2097152
    i64.or)
  (func (;15;) (type 4) (param i32 i32) (result i64)
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
        block (result i64)  ;; label = @3
          local.get 1
          i32.eqz
          if  ;; label = @4
            i32.const 65684
            local.set 2
            i64.const 27
            br 1 (;@3;)
          end
          local.get 1
          i32.const 27
          i32.add
          local.tee 3
          call 1
          local.tee 2
          i32.const 23
          i32.add
          i32.const 65707
          i32.load align=1
          i32.store align=1
          local.get 2
          i32.const 16
          i32.add
          i32.const 65700
          i64.load align=1
          i64.store align=1
          local.get 2
          i32.const 8
          i32.add
          i32.const 65692
          i64.load align=1
          i64.store align=1
          local.get 2
          i32.const 65684
          i64.load align=1
          i64.store align=1
          local.get 2
          i32.const 27
          i32.add
          local.get 0
          local.get 1
          memory.copy
          local.get 3
          i64.extend_i32_s
        end
        local.get 2
        i64.extend_i32_u
        i64.const 32
        i64.shl
        i64.or
        br 1 (;@1;)
      end
      i32.const 65647
      i32.const 37
      call 2
      unreachable
    end)
  (func (;16;) (type 1)
    (local i32)
    memory.size
    local.set 0
    i32.const 65716
    i32.const 66384
    i32.store
    i32.const 65808
    local.get 0
    i32.const 16
    i32.shl
    i32.store
    i32.const 65808
    memory.size
    i32.const 16
    i32.shl
    i32.store)
  (func (;17;) (type 2) (param i32) (result i32)
    (local i32 i32)
    block (result i32)  ;; label = @1
      global.get 0
      i32.const 16
      i32.sub
      local.tee 1
      global.set 0
      block  ;; label = @2
        local.get 0
        i32.const 0
        i32.ge_s
        if  ;; label = @3
          local.get 0
          call 1
          local.set 2
          local.get 0
          i32.eqz
          br_if 1 (;@2;)
          local.get 1
          local.get 0
          i32.store offset=8
          local.get 1
          local.get 0
          i32.store offset=4
          local.get 1
          local.get 2
          i32.store
          local.get 1
          local.get 2
          i32.store offset=12
          i32.const 65768
          local.get 1
          i32.const 12
          i32.add
          local.get 1
          call 13
          local.get 1
          i32.const 16
          i32.add
          global.set 0
          local.get 2
          br 2 (;@1;)
        end
        call 10
        unreachable
      end
      call 6
      unreachable
    end)
  (table (;0;) 3 3 funcref)
  (memory (;0;) 2)
  (global (;0;) (mut i32) (i32.const 65536))
  (export "memory" (memory 0))
  (export "_start" (func 16))
  (export "_malloc" (func 17))
  (export "extend" (func 14))
  (export "ahoy" (func 15))
  (elem (;0;) (i32.const 1) func 11 9)
  (data (;0;) (i32.const 65536) "panic: runtime error: nil pointer dereferenceassignment to entry in nil mapindex out of rangeslice out of rangeunsafe.Slice/String: len out of range21 days of Festivus before ")
  (data (;1;) (i32.const 65712) "aQ\86AP\03\01\00\18\01\01\00\00\00\00\00\a4\01\01\00\c1\82\01\00\00\00\00\00\04\00\00\00\0c\00\00\00\01\00\00\00\00\00\00\00\01\00\00\00\00\00\00\00\02\00\00\00\bc\02\01\00aQ\86A\00\00\00\00\04\00\00\00\0c")
  (data (;2;) (i32.const 65796) "\01\00\00\00\00\00\00\00\02"))
