#! /bin/bash

#----------���ɲ����ļ�----------#
echo "build test file ... ..."
#�������Ŀ¼
cd ./telf
#DYN(Shared Object File)
gcc -no-pie -shared -fPIC -o libmymath.so mymath.c
#REF(Relocatable File)
gcc -c main.c
#EXEC(Executable File)
gcc -no-pie ./main.o ./libmymath.so -o main

#���ظ�Ŀ¼
cd ..

#----------���ɷ���ָ��(./bin/ELF)----------#
echo "build ELF cmd ... ..."
gcc -g ./source/*.c -I ./include -o ./bin/ELF

#----------ELFָ�����----------#
echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>   ELF bin   <<<<<<<<<<<<<<<<<<<<<<<<<<<<<"

#-h
echo " "
echo ">>>>>>>>>>>>>>>>>>>>ELF -h libmymath.so/main.o/main<<<<<<<<<<<<<<<<<<<<"
echo " "
echo "@@@@@@@@@@@@@@@@"
echo "@ libmymath.so @"
echo "@@@@@@@@@@@@@@@@"
echo " "
./bin/ELF -h ./telf/libmymath.so
echo " "
echo "@@@@@@@@@@@@@@@@"
echo "@    main.o    @"
echo "@@@@@@@@@@@@@@@@"
echo " "
./bin/ELF -h ./telf/main.o
echo " "
echo "@@@@@@@@@@@@@@@@"
echo "@     main     @"
echo "@@@@@@@@@@@@@@@@"
echo " "
./bin/ELF -h ./telf/main

#-S
echo " "
echo ">>>>>>>>>>>>>>>>>>>>ELF -S libmymath.so/main.o/main<<<<<<<<<<<<<<<<<<<<"
echo " "
echo "@@@@@@@@@@@@@@@@"
echo "@ libmymath.so @"
echo "@@@@@@@@@@@@@@@@"
echo " "
./bin/ELF -S ./telf/libmymath.so
echo " "
echo "@@@@@@@@@@@@@@@@"
echo "@    main.o    @"
echo "@@@@@@@@@@@@@@@@"
echo " "
./bin/ELF -S ./telf/main.o
echo " "
echo "@@@@@@@@@@@@@@@@"
echo "@     main     @"
echo "@@@@@@@@@@@@@@@@"
echo " "
./bin/ELF -S ./telf/main

#-l
echo " "
echo ">>>>>>>>>>>>>>>>>>>>ELF -l libmymath.so/main.o/main<<<<<<<<<<<<<<<<<<<<"
echo " "
echo "@@@@@@@@@@@@@@@@"
echo "@ libmymath.so @"
echo "@@@@@@@@@@@@@@@@"
echo " "
./bin/ELF -l ./telf/libmymath.so
echo " "
echo "@@@@@@@@@@@@@@@@"
echo "@    main.o    @"
echo "@@@@@@@@@@@@@@@@"
echo " "
./bin/ELF -l ./telf/main.o
echo " "
echo "@@@@@@@@@@@@@@@@"
echo "@     main     @"
echo "@@@@@@@@@@@@@@@@"
echo " "
./bin/ELF -l ./telf/main

#-d
echo " "
echo ">>>>>>>>>>>>>>>>>>>>ELF -d libmymath.so/main.o/main<<<<<<<<<<<<<<<<<<<<"
echo " "
echo "@@@@@@@@@@@@@@@@"
echo "@ libmymath.so @"
echo "@@@@@@@@@@@@@@@@"
echo " "
./bin/ELF -d ./telf/libmymath.so
echo " "
echo "@@@@@@@@@@@@@@@@"
echo "@    main.o    @"
echo "@@@@@@@@@@@@@@@@"
echo " "
./bin/ELF -d ./telf/main.o
echo " "
echo "@@@@@@@@@@@@@@@@"
echo "@     main     @"
echo "@@@@@@@@@@@@@@@@"
echo " "
./bin/ELF -d ./telf/main

