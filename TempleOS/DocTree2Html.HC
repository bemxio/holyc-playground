#include "C:/Demo/ToHtmlToTXTDemo/ToHtml";

#define INPUT_PATH "T:"
#define OUTPUT_PATH "G:/DocHtml"

U0 DocTree2Html(U8 *in, U8 *out)
{
  CDirEntry *entry;

  for (entry = FilesFind(in); entry; entry = entry->next) {
    if (entry->attr & RS_ATTR_DIR) {
      if (StrCmp(entry->name, ".") && StrCmp(entry->name, ".."))
        DocTree2Html(entry->full_name, out);
    } else if (FilesFindMatch(entry->name, "*.DD*") ||
               FilesFindMatch(entry->name, "*.HC*")) {
      U8 *path = StrNew(entry->full_name);
      StrCpy(entry->full_name, path);

      StrFirstRem(path, "/");
      StrLastRem(path, ".");
      StrLastRem(path, ".");
      path = MStrPrint("%s/%s.html", out, path);

      //"%s -> %s\n", entry->full_name, path;
      ToHtml(entry->full_name, path);
    }
  }
}

if (!IsDir(OUTPUT_PATH))
  DirMk(OUTPUT_PATH);

DocTree2Html(INPUT_PATH, OUTPUT_PATH);
