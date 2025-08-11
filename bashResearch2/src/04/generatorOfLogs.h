#pragma once
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#define COUNT_FILES 5
#define COUNT_NUMBERS_IN_IP 4
#define YEAR 2025

typedef struct Date {
  int day;
  int month;
  int year;
} Date;

typedef struct Time {
  int hours;
  int minutes;
  int seconds;
} Time;

Date createDate();

void makeLogs(FILE* file, Date date);
int countLentgh(int number);
int writeIp(char* log);
int writeDate(char* log, unsigned int length, unsigned int seconds, Date date);
Time getTime(unsigned int seconds);
void addAnotherInfo(char* log, unsigned int length);