U0 GRShow(U8 *path)
{
  SettingsPush;

  AutoComplete;
  WinBorder;
  WinMax;
  DocClear;

  CDC *dc = DCAlias;
  CDC *img = GRRead(path);

  dc->color = BLACK;
  GrRect(dc, 0, 0, GR_WIDTH, GR_HEIGHT);

  //GrPaletteSet(img->palette);
  GrBlot(dc, GR_WIDTH / 2 - img->width / 2, GR_HEIGHT / 2 - img->height / 2, img);

  PressAKey;

  DCDel(img);
  DCDel(dc);

  DCFill;
  SettingsPop;
}

U0 GRShowTree(U8 *path)
{
  CDirEntry *entry = FilesFind(path, FUF_JUST_GR);

  while (entry) {
    GRShow(entry->full_name);
    entry = entry->next;
  }
}