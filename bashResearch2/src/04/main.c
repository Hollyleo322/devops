#include "generatorOfLogs.h"
int main(void) {
  srand(time(NULL));
  char* nameOfLog = malloc(sizeof(char) * 20);
  strcpy(nameOfLog, "nginx .log");
  FILE* file;
  for (int i = 0; i < COUNT_FILES; i++) {
    nameOfLog[5] = i + 1 + '0';  // nameOfLog = "nginx [i].log"
    file = fopen(nameOfLog, "w");
    Date date = createDate();
    makeLogs(file, date);
    fclose(file);
  }
  free(nameOfLog);
  return 0;
}