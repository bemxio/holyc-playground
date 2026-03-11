U0 GRShow(U8 *filename)
{
  SettingsPush;

  AutoComplete;
  WinBorder;
  WinMax;
  DocClear;

  CDC *dc = DCAlias;
  CDC *img = GRRead(filename);

  //GrPaletteSet(img->palette);
  GrBlot(dc, 0, 0, img);

  PressAKey;

  DCDel(img);
  DCDel(dc);

  DCFill;
  SettingsPop; 
}

U0 GRGallery(U8* dir)
{
  CDirEntry* entry = FilesFind(dir, FUF_JUST_GR);

  while (entry->next) {
    GRShow(entry->full_name);
    entry = entry->next;
  }
}