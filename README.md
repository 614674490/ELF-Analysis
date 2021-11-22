<!--
 * @Author: Ken Kaneki
 * @Date: 2021-11-10 09:26:55
 * @LastEditTime: 2021-11-22 20:37:56
 * @Description: README
-->
# Program Description
* **�����ļ���Ŀ¼**
* **ִ�����ýű�**
```sh
sh elf_config.sh
```
## ��������
1. **Debian GNU/Linux 10 (64bit buster)**
2. **VS Code**
3. **C Language & sh**
## ����
* -h
```sh
./bin/ELF -h filename
```
* -S
```sh
./bin/ELF -h filename
```
* -l
```sh
./bin/ELF -h filename
```
* -d
```sh
./bin/ELF -d filename
```
## ���ü��������
* �����Ŀ¼
* ���в��Խű�
```sh
sh elf_config.sh
```
## ���Խű�[elf_config.sh](./elf_config.sh)
- ��������
1. -h
2. -S
3. -l
4. -d
- ��������
1. ��̬���ӿ�[libmymath.so](./telf/libmymath.so)
2. Ŀ���ļ�[main.o](./telf/main.o)
3. ��ִ���ļ�[main.so](./telf/main)

## [ELF](./bin/ELF)
* �����Ŀ¼��
* ͨ��**sh elf_config.sh**ֱ�Ӳ�������
* Ҳ����ͨ��./bin/ELF -h/S/l/d filename��������ELF�ļ�
## Դ��
- include
1. [head.h](./include/head.h)
```txt
����ELF�ļ��õ��ı������ṹ��ͺ���
```
2. [myelf.h](./include/myelf.h)
```txt
����debianϵͳ�Դ���elf.h
```
- source
1. [elf.c](./source/elf.c)
```txt
ʵ��ELF�ļ������ĺ���
```
2. [main.c](./source/main.c)
```txt
������, ��������ִ����Ӧ��ELF�ļ�����
```
- bin
```txt
���ELFָ��
```
- telf
```txt
��Ų����ļ�
```
