BUILD=build
SRC=src

CRUST_FLAGS=-g --edition 2021 -C opt-level=0 -C panic="abort"

RSS=\
	$(SRC)/arena.rs \
	$(SRC)/b.rs \
	$(SRC)/crust.rs \
	$(SRC)/flag.rs \
	$(SRC)/lexer.rs \
	$(SRC)/nob.rs \
	$(SRC)/fake6502.rs \
	$(SRC)/codegen/fasm_x86_64.rs \
	$(SRC)/codegen/gas_aarch64_linux.rs \
	$(SRC)/codegen/uxn.rs \
	$(SRC)/codegen/ir.rs \
	$(SRC)/codegen/mod.rs

# Default target Linux tests
LINUX_TESTS=\
	$(BUILD)/tests/args6 \
	$(BUILD)/tests/args11 \
	$(BUILD)/tests/args11-extrn \
	$(BUILD)/tests/compare \
	$(BUILD)/tests/deref_assign \
	$(BUILD)/tests/divmod \
	$(BUILD)/tests/e \
	$(BUILD)/tests/forward-declare \
	$(BUILD)/tests/globals \
	$(BUILD)/tests/goto \
	$(BUILD)/tests/hello \
	$(BUILD)/tests/inc_dec \
	$(BUILD)/tests/lexer \
	$(BUILD)/tests/literals \
	$(BUILD)/tests/minus_2 \
	$(BUILD)/tests/recursion \
	$(BUILD)/tests/ref \
	$(BUILD)/tests/return \
	$(BUILD)/tests/switch \
	$(BUILD)/tests/stack_alloc \
	$(BUILD)/tests/ternary-side-effect \
	$(BUILD)/tests/ternary \
	$(BUILD)/tests/ternary-assign \
	$(BUILD)/tests/unary_priority \
	$(BUILD)/tests/vector \
	$(BUILD)/tests/multiple-postfix \
	$(BUILD)/tests/rvalue_call \
	$(BUILD)/tests/call_stack_args \
	$(BUILD)/tests/upper

# TODO: ./tests/upper.b does not work on gas-aarch64-linux due to missing implementations of char() and lchar(). See ./libb/gas-aarch64-linux.b
#	$(BUILD)/tests/upper-gas-aarch64-linux
GAS_AARCH64_LINUX_TESTS=\
	$(BUILD)/tests/args6-gas-aarch64-linux \
	$(BUILD)/tests/args11-gas-aarch64-linux \
	$(BUILD)/tests/args11-extrn-gas-aarch64-linux \
	$(BUILD)/tests/compare-gas-aarch64-linux \
	$(BUILD)/tests/deref_assign-gas-aarch64-linux \
	$(BUILD)/tests/divmod-gas-aarch64-linux \
	$(BUILD)/tests/e-gas-aarch64-linux \
	$(BUILD)/tests/forward-declare-gas-aarch64-linux \
	$(BUILD)/tests/globals-gas-aarch64-linux \
	$(BUILD)/tests/goto-gas-aarch64-linux \
	$(BUILD)/tests/hello-gas-aarch64-linux \
	$(BUILD)/tests/inc_dec-gas-aarch64-linux \
	$(BUILD)/tests/lexer-gas-aarch64-linux \
	$(BUILD)/tests/literals-gas-aarch64-linux \
	$(BUILD)/tests/minus_2-gas-aarch64-linux \
	$(BUILD)/tests/recursion-gas-aarch64-linux \
	$(BUILD)/tests/ref-gas-aarch64-linux \
	$(BUILD)/tests/return-gas-aarch64-linux \
	$(BUILD)/tests/switch-gas-aarch64-linux \
	$(BUILD)/tests/stack_alloc-gas-aarch64-linux \
	$(BUILD)/tests/ternary-side-effect-gas-aarch64-linux \
	$(BUILD)/tests/ternary-gas-aarch64-linux \
	$(BUILD)/tests/ternary-assign-gas-aarch64-linux \
	$(BUILD)/tests/unary_priority-gas-aarch64-linux \
	$(BUILD)/tests/vector-gas-aarch64-linux \
	$(BUILD)/tests/multiple-postfix-gas-aarch64-linux \
	$(BUILD)/tests/rvalue_call-gas-aarch64-linux \
	$(BUILD)/tests/call_stack_args-gas-aarch64-linux

MINGW32_TESTS=\
	$(BUILD)/tests/args6.exe \
	$(BUILD)/tests/args11.exe \
	$(BUILD)/tests/args11-extrn.exe \
	$(BUILD)/tests/compare.exe \
	$(BUILD)/tests/deref_assign.exe \
	$(BUILD)/tests/divmod.exe \
	$(BUILD)/tests/e.exe \
	$(BUILD)/tests/forward-declare.exe \
	$(BUILD)/tests/globals.exe \
	$(BUILD)/tests/goto.exe \
	$(BUILD)/tests/hello.exe \
	$(BUILD)/tests/inc_dec.exe \
	$(BUILD)/tests/lexer.exe \
	$(BUILD)/tests/literals.exe \
	$(BUILD)/tests/minus_2.exe \
	$(BUILD)/tests/recursion.exe \
	$(BUILD)/tests/ref.exe \
	$(BUILD)/tests/return.exe \
	$(BUILD)/tests/switch.exe \
	$(BUILD)/tests/stack_alloc.exe \
	$(BUILD)/tests/ternary-side-effect.exe \
	$(BUILD)/tests/ternary.exe \
	$(BUILD)/tests/ternary-assign.exe \
	$(BUILD)/tests/unary_priority.exe \
	$(BUILD)/tests/vector.exe \
	$(BUILD)/tests/multiple-postfix.exe \
	$(BUILD)/tests/rvalue_call.exe \
	$(BUILD)/tests/call_stack_args.exe \
	$(BUILD)/tests/upper.exe

UXN_TESTS=\
	$(BUILD)/tests/args6.rom \
	$(BUILD)/tests/args11.rom \
	$(BUILD)/tests/args11-extrn.rom \
	$(BUILD)/tests/compare.rom \
	$(BUILD)/tests/deref_assign.rom \
	$(BUILD)/tests/divmod.rom \
	$(BUILD)/tests/e.rom \
	$(BUILD)/tests/forward-declare.rom \
	$(BUILD)/tests/globals.rom \
	$(BUILD)/tests/goto.rom \
	$(BUILD)/tests/hello.rom \
	$(BUILD)/tests/inc_dec.rom \
	$(BUILD)/tests/lexer.rom \
	$(BUILD)/tests/literals.rom \
	$(BUILD)/tests/minus_2.rom \
	$(BUILD)/tests/recursion.rom \
	$(BUILD)/tests/ref.rom \
	$(BUILD)/tests/return.rom \
	$(BUILD)/tests/switch.rom \
	$(BUILD)/tests/stack_alloc.rom \
	$(BUILD)/tests/ternary-side-effect.rom \
	$(BUILD)/tests/ternary.rom \
	$(BUILD)/tests/ternary-assign.rom \
	$(BUILD)/tests/unary_priority.rom \
	$(BUILD)/tests/vector.rom \
	$(BUILD)/tests/multiple-postfix.rom \
	$(BUILD)/tests/rvalue_call.rom \
	$(BUILD)/tests/call_stack_args.rom \
	$(BUILD)/tests/upper.rom

6502_TESTS=\
	$(BUILD)/tests/args6.6502 \
	$(BUILD)/tests/args11.6502 \
	$(BUILD)/tests/args11-extrn.6502 \
	$(BUILD)/tests/compare.6502 \
	$(BUILD)/tests/deref_assign.6502 \
	$(BUILD)/tests/divmod.6502 \
	$(BUILD)/tests/e.6502 \
	$(BUILD)/tests/forward-declare.6502 \
	$(BUILD)/tests/globals.6502 \
	$(BUILD)/tests/goto.6502 \
	$(BUILD)/tests/hello.6502 \
	$(BUILD)/tests/inc_dec.6502 \
	$(BUILD)/tests/lexer.6502 \
	$(BUILD)/tests/literals.6502 \
	$(BUILD)/tests/minus_2.6502 \
	$(BUILD)/tests/recursion.6502 \
	$(BUILD)/tests/ref.6502 \
	$(BUILD)/tests/return.6502 \
	$(BUILD)/tests/switch.6502 \
	$(BUILD)/tests/stack_alloc.6502 \
	$(BUILD)/tests/ternary-side-effect.6502 \
	$(BUILD)/tests/ternary.6502 \
	$(BUILD)/tests/ternary-assign.6502 \
	$(BUILD)/tests/unary_priority.6502 \
	$(BUILD)/tests/vector.6502 \
	$(BUILD)/tests/multiple-postfix.6502 \
	$(BUILD)/tests/rvalue_call.6502 \
	$(BUILD)/tests/call_stack_args.6502 \
	$(BUILD)/tests/upper.6502

LINUX_OBJS=\
	$(BUILD)/nob.linux.o \
	$(BUILD)/flag.linux.o \
	$(BUILD)/libc.linux.o \
	$(BUILD)/arena.linux.o \
	$(BUILD)/fake6502.linux.o

MINGW32_OBJS=\
	$(BUILD)/nob.mingw32.o \
	$(BUILD)/flag.mingw32.o \
	$(BUILD)/libc.mingw32.o \
	$(BUILD)/arena.mingw32.o \
	$(BUILD)/fake6502.linux.o

$(BUILD)/b: $(RSS) $(LINUX_OBJS) | $(BUILD)
	rustc $(CRUST_FLAGS) -C link-args="$(LDFLAGS) $(LINUX_OBJS) -lc -lgcc" $(SRC)/b.rs -o $(BUILD)/b

$(BUILD)/%.linux.o: ./thirdparty/%.c | $(BUILD)
	$(CC) -fPIC -g -c $< -o $@ $(LDFLAGS)

# Cross-compilation on Linux to Windows using mingw32-w64
# Invoked on demand by `make ./build/b.exe`
$(BUILD)/b.exe: $(RSS) $(MINGW32_OBJS) | $(BUILD)
	rustc $(CRUST_FLAGS) --target x86_64-pc-windows-gnu -C link-args="$(MINGW32_OBJS) -lmingwex -lmsvcrt -lkernel32" $(SRC)/b.rs -o $(BUILD)/b

$(BUILD)/%.mingw32.o: ./thirdparty/%.c | $(BUILD)
	x86_64-w64-mingw32-gcc -fPIC -g -c $< -o $@

$(BUILD):
	mkdir -pv $(BUILD)

.PHONY: test
test: $(LINUX_TESTS)

$(BUILD)/tests/%: ./tests/%.b $(BUILD)/b FORCE | $(BUILD)/tests
	$(BUILD)/b -run -o $@ $<

.PHONY: test-gas-aarch64-linux
test-gas-aarch64-linux: $(GAS_AARCH64_LINUX_TESTS)

$(BUILD)/tests/%-gas-aarch64-linux: ./tests/%.b $(BUILD)/b FORCE | $(BUILD)/tests
	$(BUILD)/b -t gas-aarch64-linux -run -o $@ $<

.PHONY: test-mingw32
test-mingw32: $(MINGW32_TESTS)

$(BUILD)/tests/%.exe: ./tests/%.b $(BUILD)/b FORCE | $(BUILD)/tests
	$(BUILD)/b -t fasm-x86_64-windows -run -o $@ $<

$(BUILD)/tests:
	mkdir -pv $(BUILD)/tests

.PHONY: test-uxn
test-uxn: $(UXN_TESTS)

$(BUILD)/tests/%.rom: ./tests/%.b $(BUILD)/b FORCE | $(BUILD)/tests
	$(BUILD)/b -t uxn -o $@ $<
	uxncli $@

.PHONY: test-6502
test-6502: $(6502_TESTS)

$(BUILD)/tests/%.6502: ./tests/%.b $(BUILD)/b FORCE | $(BUILD)/tests
	$(BUILD)/b -run -nostdlib -t 6502 -o $@ $< ./libb/6502.b

# https://www.gnu.org/software/make/manual/html_node/Force-Targets.html
FORCE:
