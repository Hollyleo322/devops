#include "MyNodeExporter.h"

int getCpuInfo(CpuInfo* var) {
  int res = 0;
  FILE* cpuInfo = popen("cat /proc/stat | awk 'NR==1{print $0}'", "r");
  if (cpuInfo == NULL) {
    res = 1;
  } else {
    fscanf(cpuInfo, "cpu  %llu %llu %llu %llu %llu %llu %llu %llu", &var->user,
           &var->nice, &var->system, &var->idle, &var->iowait, &var->irq,
           &var->softirq, &var->steal);
  }
  pclose(cpuInfo);
  return res;
}
int getMemoryInfo(MemInfo* val) {
  int res = 0;
  FILE* memInfo = popen(
      "free --kilo  | grep Mem: | awk '{printf \"%e %e %e\", $2, $4,$7}'", "r");
  if (memInfo == NULL) {
    res = 1;
  } else {
    fscanf(memInfo, "%le %le %le", &val->total, &val->free, &val->available);
  }
  pclose(memInfo);
  return res;
}
int getFsInfo(FsInfo* val) {
  int res = 0;
  FILE* fsInfo = popen(
      "df -T | awk '{if ($7 ~ /^\\/$/) printf \"%s %s %lf %lf "
      "%lf\",$1,$2,$3,$4,$5}'",
      "r");
  if (fsInfo == NULL) {
    res = 1;
  } else {
    fscanf(fsInfo, "%s %s %lf %lf %lf", val->device, val->type, &val->total,
           &val->used, &val->available);
  }
  pclose(fsInfo);
  return res;
}
int main() {
  int res = 0;
  CpuInfo cpuInfo = {0};
  MemInfo memInfo = {0};
  FsInfo fsInfo;
  int checkCpu = getCpuInfo(&cpuInfo);
  int checkMem = getMemoryInfo(&memInfo);
  int checkFS = getFsInfo(&fsInfo);
  double infoFs[3];
  double infoMemory[3];
  double infoCpu[8];
  FILE* file = fopen("/home/scripts/09/index.html", "w");
  if (!checkCpu && !checkMem && !checkFS && file != NULL) {
    char* types[] = {"user",   "nice", "system",  "idle",
                     "iowait", "irq",  "softirq", "steal"};
    char* typesMemory[] = {"MemAvailable", "MemFree", "MemTotal"};
    char* typesFs[] = {"total", "used", "available"};
    writeInfoFs(&fsInfo, infoFs);
    writeInfoMemory(&memInfo, infoMemory);
    writeInfoCpu(&cpuInfo, infoCpu);
    for (int i = 0; i < 8; i++) {
      fprintf(file, "s21_node_cpu_seconds_total{mode=\"%s\"} %.2f\n", types[i],
              infoCpu[i]);
    }
    for (int i = 0; i < 3; i++) {
      fprintf(file, "s21_node_memory_%s_bytes %e\n", typesMemory[i],
              infoMemory[i]);
    }
    for (int i = 0; i < 3; i++) {
      fprintf(file,
              "s21_node_filesystem_%s_bytes{device=\"%s\",fstype=\"%s"
              "s\"mountpoint=\"/\"} %e\n",
              typesFs[i], fsInfo.device, fsInfo.type, infoFs[i]);
    }
    fclose(file);
  } else {
    res = 1;
  }
  return res;
}
void writeInfoCpu(CpuInfo* val, double arr[]) {
  int divider = sysconf(_SC_CLK_TCK);
  arr[0] = val->user / (double)divider;
  arr[1] = val->nice / (double)divider;
  arr[2] = val->system / (double)divider;
  arr[3] = val->idle / (double)divider;
  arr[4] = val->iowait / (double)divider;
  arr[5] = val->irq / (double)divider;
  arr[6] = val->softirq / (double)divider;
  arr[7] = val->steal / (double)divider;
}

void writeInfoMemory(MemInfo* val, double arr[]) {
  arr[0] = val->available * 1024;
  arr[1] = val->free * 1024;
  arr[2] = val->total * 1024;
}
void writeInfoFs(FsInfo* val, double arr[]) {
  arr[0] = val->total * 1024;
  arr[1] = val->used * 1024;
  arr[2] = val->available * 1024;
}