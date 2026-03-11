U0 TakeScrnshot(U8 *filename)
{
  CDC *dc = DCScrnCapture(TRUE);

  GRWrite(filename, dc, 0);
  DCDel(dc);
}