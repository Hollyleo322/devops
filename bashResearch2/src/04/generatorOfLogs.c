#include "generatorOfLogs.h"

void makeLogs(FILE* file, Date date) {
  char* log = malloc(sizeof(char) * 200);
  unsigned int quantityOfRecords = 100 + rand() % 901;
  unsigned int increment = 86400 / quantityOfRecords;
  unsigned int seconds = 0;
  unsigned int length = 0;
  for (unsigned int i = 0; i < quantityOfRecords; i++) {
    length = writeIp(log);
    length = writeDate(log, length, seconds, date);
    addAnotherInfo(log, length);
    fprintf(file, "%s", log);
    seconds += increment;
  }
  free(log);
}
int countLentgh(int number) {
  int count = 0;
  while (number > 0) {
    number /= 10;
    count++;
  }
  return count;
}
int writeIp(char* log) {
  int maxNumber = 255;
  unsigned int length = 0;
  length = 0;
  for (int k = 0; k < COUNT_NUMBERS_IN_IP; k++) {
    unsigned int number = 1 + rand() % maxNumber;
    if (k == (COUNT_NUMBERS_IN_IP - 1)) {
      sprintf(log + length, "%d", number);
    } else {
      sprintf(log + length, "%d.", number);
      length += 1;
    }
    length += countLentgh(number);
  }
  return length;
}

void addAnotherInfo(char* log, unsigned int length) {
  char* methods[] = {"GET", "POST", "PUT", "DELETE", "PATCH"};
  char* urlandversionofprotocol = "/api/v1/users HTTP/2.0";
  char* codes[] = {
      "200", "201", "400", "401", "403", "404",
      "500", "501", "502", "503"};  // 200 - success of method, 201 - creation
                                    // of resource, 400 - bad request, 401 -
                                    // unauthorized, 403 - forbidden, 404 - not
                                    // found, 500 - internal server error, 501 -
                                    // not implemented(server can't response on
                                    // method), 502 - bad gateway(get not
                                    // allowed response from another server),
                                    // 503 - service unavailable(mb tehnical
                                    // works)
  char* agents[] = {"Mozilla",         "Google Chrome",       "Opera",
                    "Safari",          "Internet Explorer",   "Microsoft Edge",
                    "Crawler and bot", "Library and net tool"};
  sprintf(log + length, " \"%s %s\" %s \"%s\"\n", methods[rand() % 5],
          urlandversionofprotocol, codes[rand() % 10], agents[rand() % 8]);
}
Date createDate() {
  Date result;
  result.day = rand() % 31 + 1;
  result.month = rand() % 3 + 1;
  result.year = YEAR;
  if (result.month == 2) {
    result.day = rand() % 28 + 1;
  }
  return result;
}
int writeDate(char* log, unsigned int length, unsigned int seconds, Date date) {
  Time time = getTime(seconds);
  char* months[] = {"Jan", "Feb", "Mar"};
  int lentghOfDate = sprintf(log + length, " [%d/%s/%d:%02d:%02d:%02d +0500]",
                             date.day, months[date.month - 1], date.year,
                             time.hours, time.minutes, time.seconds);
  return lentghOfDate + length;
}
Time getTime(unsigned int seconds) {
  Time result;
  result.hours = seconds / 3600;
  result.minutes = (seconds - result.hours * 3600) / 60;
  result.seconds = seconds % 60;
  return result;
}