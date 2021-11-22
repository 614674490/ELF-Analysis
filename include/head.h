/*
 * @Author: Ken Kaneki
 * @Date: 2021-11-10 09:28:02
 * @LastEditTime: 2021-11-14 13:43:01
 * @Description: README
 */
#ifndef HEAD_H_INCLUDED
#define HEAD_H_INCLUDED

#include <stdio.h>
#include <string.h>
#include <errno.h>
#include <unistd.h>
#include <stdlib.h>
#include <sys/mman.h>
#include <stdint.h>
#include <sys/stat.h>
#include <fcntl.h>
#include "myelf.h"

//�������
#define ELF_header "-h"
#define Program_header "-l"
#define Section_header "-S"
#define Dynamic_Section "-d"
//�����
#define MACHINE_LEN 225
#define S_FLAGS_LEN 16
#define P_FLAGS_LEN 8
#define D_FLAGS_LEN 36
typedef struct
{
    Elf64_Dyn *dyn;    //Dynamic entry
    uint8_t dyn_index; //dynamic section offset
    uint8_t dyn_num;   //Dynamic entry number
} DynSec;
typedef struct
{
    uint8_t *mem;     //ָ��elf�ļ���ָ��
    Elf64_Ehdr *ehdr; //elf header
    Elf64_Shdr *shdr; //section header
    Elf64_Phdr *phdr; //program header
    DynSec dynsec;    //Dynamic entry
    char *dynstrtab;  //Dynamic string table
    char *shstrtab;   //string table
} Filedata;

typedef struct
{
    Filedata filedata;                            //ָ��elf�ļ���ָ��
    uint8_t ostype;                               //32 or 64
    char **argv;                                  //�洢�������
    void (*filedata_init)(Filedata *filedata);    //����filedata����
    void (*elf_file_64_parse)(Filedata filedata); //����ָ�룬ָ��elf�ļ���������
} Elf_64_Parse;

//���
extern const char machine[MACHINE_LEN][60]; //ehdr->e_machine:ϵͳ�ܹ�
extern const char s_flags[S_FLAGS_LEN];     //shdr[i].sh_flags:�� section ��Ӧ������
extern const char p_flags[P_FLAGS_LEN][4];  //phdr[i].ph_flags:�� program_segment ��Ӧ������
extern const char d_flags[D_FLAGS_LEN][17]; //dyn[i].d_tag:�� dynamic section ��Ӧ������
//����value��ѯ��Ӧ����Ϣ
const char *get_ehdr_class(unsigned char id);
const char *get_ehdr_data(unsigned char id);
const char *get_ehdr_osabi(unsigned char id);
const char *get_ehdr_type(Elf64_Half type);
const char *get_shdr_type(Elf64_Word type);
const char *get_phdr_type(Elf64_Word type);
const char *get_dyn_type(Elf64_Dyn dyn, Filedata filedata);

void Filedata_Init(Filedata *filedata);
int ELF_Init(Elf_64_Parse *epar, char **argv, uint8_t *mem);

void elf_header_64_parse(Filedata filedata);      //����ELF_Header
void section_header_64_parse(Filedata filedata);  //����Section_Header
void program_header_64_parse(Filedata filedata);  //����Program_Header
void elf_file_64_print(Elf_64_Parse epar);        //����ELF File
void dynamic_section_64_parse(Filedata filedata); //����Dynamic section
#endif
