#define COM1 0x3f8

U0 SerialInit(U32 baud)
{
  U16 divisor = 115200 / baud;

  OutU8(COM1 + 1, 0x00); // disable interrupts
  OutU8(COM1 + 3, 0x80); // enable DLAB
  OutU8(COM1 + 0, divisor.u8[0]); // divisor low byte
  OutU8(COM1 + 1, divisor.u8[1]); // divisor high byte
  OutU8(COM1 + 3, 0x03); // connection parameters (8 bit, no parity, 1 stop bit)
  OutU8(COM1 + 2, 0x47); // enable and clear FIFO (8 byte threshold)
  OutU8(COM1 + 4, 0x0B); // enable DTR, RTS & OUT2 pins
}

U8 SerialRead()
{
  return InU8(COM1);
}

U0 SerialWrite(U8 byte)
{
  OutU8(COM1, byte);
}

U8 *data = "Hello, world!\n";
U8 *ptr;

SerialInit(9600);

for (ptr = data; *ptr; ptr++) {
  SerialWrite(*ptr);
}