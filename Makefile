CC=gcc
CFLAGS=-g -O2 -Wall -Wno-deprecated
INCLUDE=-I./ -I/usr/local/include/zookeeper
LINK_LIBS=-L./ -lzookeeper_mt
TARGET=test
OBJS=$(patsubst %.c,%.o,$(wildcard *.c))

all:$(TARGET)
	@echo "build Success"

.c.o:
	@echo "  CC    $@"
	@$(CC) $(CFLAGS) -o $@ -c $< $(INCLUDE)

$(TARGET):$(OBJS)
	@echo "  LD    $@"
	@$(CC) -o $@ $^ $(LINK_LIBS) -lpthread

clean:
	rm -f $(TARGET) $(OBJS)
