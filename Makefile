CXXFLAGS += $(shell lhapdf-config --cflags)
LDFLAGS  += -Wl,-rpath,$(shell lhapdf-config --ldflags)

.PHONY: all clean

all: testrun_lhapdf

testrun_lhapdf: LDFLAGS += -lstdc++
testrun_lhapdf: testrun_lhapdf.c lhapdfWrapper.a

lhapdfWrapper.a: CXXFLAGS += -fPIC
lhapdfWrapper.a: lhapdf_c.o
	ar crs $@ $^
	ranlib $@

clean:
	rm -f *.o lhapdfWrapper.a
	rm -f testrun_lhapdf
