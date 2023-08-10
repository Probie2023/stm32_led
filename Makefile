TARGET=test
CC=arm-none-eabi-gcc
OBJCOPY=arm-none-eabi-objcopy
RM=rm -f
CORE=3
CPUFLAGS=-mthumb -mcpu=cortex-m$(CORE)
LDFLAGS = -T stm32_flash.ld -Wl,-cref,-u,Reset_Handler -Wl,-Map=$(TARGET).map -Wl,--gc-sections -Wl,--defsym=malloc_getpagesize_P=0x80 -Wl,--start-group -lc -lm -Wl,--end-group
CFLAGS=-g -o

$(TARGET):startup_stm32f10x_hd.o main.o
	$(CC) $^ $(CPUFLAGS) $(LDFLAGS) $(CFLAGS) $(TARGET).elf
startup_stm32f10x_hd.o:startup_stm32f10x_hd.s
	$(CC) -c $^ $(CPUFLAGS) $(CFLAGS) $@
main.o:main.c
	$(CC) -c $^ $(CPUFLAGS) $(CFLAGS) $@

bin:
	$(OBJCOPY) $(TARGET).elf $(TARGET).bin
hex:
	$(OBJCOPY) $(TARGET).elf -Oihex $(TARGET).hex
clean:
	$(RM) *.o $(TARGET).*

