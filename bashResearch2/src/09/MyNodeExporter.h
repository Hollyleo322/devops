#pragma once
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

typedef struct CpuInfo {
  unsigned long long user;
  unsigned long long nice;
  unsigned long long system;
  unsigned long long idle;
  unsigned long long iowait;
  unsigned long long irq;
  unsigned long long softirq;
  unsigned long long steal;
} CpuInfo;

typedef struct MemInfo {
  double total;
  double free;
  double available;
} MemInfo;
typedef struct FsInfo {
  char device[256];
  char type[256];
  double total;
  double used;
  double available;
} FsInfo;
int getCpuInfo(CpuInfo* val);
int getMemoryInfo(MemInfo* val);
int getFsInfo(FsInfo* val);
void writeInfoFs(FsInfo* val, double arr[]);
void writeInfoMemory(MemInfo* val, double arr[]);
void writeInfoCpu(CpuInfo* val, double arr[]);

